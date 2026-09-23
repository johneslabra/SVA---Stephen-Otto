#!/usr/bin/env python3
"""PreToolUse guard: only listed editors may change files in master/.

Reads the Claude Code hook payload on stdin. Allows everything that does not
write inside master/. For writes inside master/, checks the current
`git config user.email` against the allowlist in master/who-can-edit.md.

If that file is missing or lists nobody, the client is not onboarded yet and writes
are allowed, so onboarding can create the list in the first place. If it lists people
but none of them has an email, writes are refused: the list cannot be matched against
anyone, so allowing them through would mean a lock that protects nothing.
"""
import json
import os
import re
import subprocess
import sys

ALLOWLIST = os.path.join("master", "who-can-edit.md")
# FAQs are answers VAs collect from the client day to day. Locking them to the
# lead would mean the people who learn the answers cannot write them down, so
# this one file inside master/ stays open to everyone.
OPEN_FILES = {os.path.join("master", "faqs.md")}
EMAIL_RE = re.compile(r"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}")

# Bash verbs that can modify a file. Reading (cat, grep, ls, head) is fine.
WRITE_VERBS = re.compile(
    r"(>>?|\btee\b|\bsed\b[^|;]*-i|\brm\b|\bmv\b|\bcp\b|\btruncate\b|\bdd\b"
    r"|\bchmod\b|\bchown\b|\bln\b|\bmkdir\b|\btouch\b)"
)


def allow():
    sys.exit(0)


def deny(reason):
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "deny",
            "permissionDecisionReason": reason,
        }
    }))
    sys.exit(0)


def repo_root():
    root = os.environ.get("CLAUDE_PROJECT_DIR")
    if root:
        return root
    try:
        return subprocess.run(
            ["git", "rev-parse", "--show-toplevel"],
            capture_output=True, text=True, timeout=5,
        ).stdout.strip() or os.getcwd()
    except Exception:
        return os.getcwd()


def touches_master(path, root):
    if not path:
        return False
    abs_path = os.path.abspath(os.path.join(root, os.path.expanduser(path)))
    for open_file in OPEN_FILES:
        if abs_path == os.path.abspath(os.path.join(root, open_file)):
            return False
    master = os.path.abspath(os.path.join(root, "master"))
    return abs_path == master or abs_path.startswith(master + os.sep)


def read_allowlist(path):
    """Emails on bullet lines under the '## Allowed editors' heading.

    Returns (emails, number of entries). Scoped to that one section, and blind
    to HTML comments, so the worked examples that explain the format are never
    mistaken for real editors.
    """
    try:
        with open(path, "r", encoding="utf-8") as fh:
            lines = fh.read().splitlines()
    except OSError:
        return set(), 0

    allowed = set()
    entries = 0
    in_section = False
    in_comment = False
    for line in lines:
        # Anything inside an HTML comment is guidance for whoever edits this
        # file, examples included. It must never count as a real entry.
        if in_comment:
            if "-->" not in line:
                continue
            in_comment = False
            line = line.split("-->", 1)[1]
        while "<!--" in line:
            before, rest = line.split("<!--", 1)
            if "-->" in rest:
                line = before + rest.split("-->", 1)[1]
            else:
                line = before
                in_comment = True
                break

        if line.startswith("#"):
            in_section = "allowed editors" in line.lower()
            continue
        if in_section and line.lstrip().startswith(("-", "*")):
            entries += 1
            allowed.update(m.lower() for m in EMAIL_RE.findall(line))
    return allowed, entries


def main():
    try:
        payload = json.load(sys.stdin)
    except Exception:
        allow()

    tool = payload.get("tool_name", "")
    tool_input = payload.get("tool_input") or {}
    root = repo_root()

    if tool in ("Write", "Edit", "NotebookEdit"):
        if not touches_master(tool_input.get("file_path"), root):
            allow()
    elif tool == "Bash":
        command = tool_input.get("command", "")
        if "master/" not in command and "master " not in command:
            allow()
        # A command that only touches the open files is fine.
        if all(name in command for name in OPEN_FILES) and "who-can-edit" not in command:
            stripped = command
            for name in OPEN_FILES:
                stripped = stripped.replace(name, "")
            if "master/" not in stripped and "master " not in stripped:
                allow()
        if not WRITE_VERBS.search(command):
            allow()
    else:
        allow()

    # From here on: something is trying to write inside master/.
    allowed, entries = read_allowlist(os.path.join(root, ALLOWLIST))

    if not allowed and not entries:
        # Not onboarded yet - nobody is designated, so don't block setup.
        allow()

    if not allowed:
        # Someone has been listed, but without an email to match against. The
        # lock would silently protect nobody, so refuse rather than pretend.
        deny(
            "Blocked: people are listed as able to change the main client details, "
            "but none of them has an email next to their name, so there is no way to "
            "tell who is who. Tell the VA in plain words that the list of people who "
            "can change the main client details is missing their email addresses, and "
            "that someone already on it needs to add them before these files can be "
            "changed. An email must be the one git saves their work under. "
            "Do not edit the list yourself to get around this."
        )

    try:
        current = subprocess.run(
            ["git", "config", "user.email"],
            capture_output=True, text=True, timeout=5, cwd=root,
        ).stdout.strip().lower()
    except Exception:
        current = ""

    if current and current in allowed:
        allow()

    who = current or "nobody (no email is set on this computer)"
    deny(
        "Blocked: the master client details are set to be changed only by "
        f"{', '.join(sorted(allowed))}. This computer is signed in as {who}. "
        "Tell the person in plain words that these core client details are "
        "locked so they cannot be changed by accident, and that their lead "
        "needs to make this change or add them to the list in "
        "master/who-can-edit.md. Do not try another way to write the file."
    )


if __name__ == "__main__":
    main()
