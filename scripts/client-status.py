#!/usr/bin/env python3
"""Report whether this client has been set up yet.

Runs at the start of every session so the AI knows, without having to go and
look, when it is sitting in a folder nobody has filled in. Answering questions
about a client from an empty folder means inventing facts, which is the one
thing it must never do.

A file counts as filled in when it differs from the blank copy kept in
`_templates/master/`. That is exact, where judging "does this look empty?" by
reading the text is not: the blank files are full of headings, table headers and
instructions that are easy to mistake for real answers.

Prints a single line for the AI to read. Never fails, never blocks anything.
"""
import glob
import os
import re
import sys

PLACEHOLDER = "{{CLIENT_NAME}}"
CORE = ["business-overview.md", "brand.md", "contacts.md", "tools-and-access.md"]
BLANKS = os.path.join("_templates", "master")


def normalise(text):
    """Ignore differences that carry no answers: spacing and the client's name."""
    text = text.replace(PLACEHOLDER, "")
    return re.sub(r"\s+", " ", text).strip()


def read(path):
    try:
        with open(path, encoding="utf-8", errors="replace") as fh:
            return fh.read()
    except OSError:
        return None


def is_filled(name):
    """True if this client detail file has been changed from the blank copy."""
    current = read(os.path.join("master", name))
    if current is None:
        return False
    blank = read(os.path.join(BLANKS, name))
    if blank is None:
        # No blank to compare against, so fall back to "has anything been typed".
        stripped = [
            ln.strip() for ln in current.splitlines()
            if ln.strip() and not ln.strip().startswith("#")
        ]
        return len(stripped) > 3
    return normalise(current) != normalise(blank)


def main():
    root = os.environ.get("CLAUDE_PROJECT_DIR") or os.getcwd()
    try:
        os.chdir(root)
    except OSError:
        return 0

    if not os.path.isdir("master"):
        print("client-status: no client details folder here.")
        return 0

    filled = [name for name in CORE if is_filled(name)]

    placeholder = any(
        PLACEHOLDER in (read(path) or "") for path in glob.glob("master/*.md")
    )

    niches = [
        d for d in sorted(os.listdir("."))
        if os.path.isdir(os.path.join(d, "tasks")) and not d.startswith((".", "_"))
    ]

    if not filled:
        print(
            "client-status: NOT SET UP."
            + (" The client's name has not been filled in yet." if placeholder else "")
            + " The client details are blank. Do not answer questions about this client"
            " and do not start work on it. Offer to run the setup first."
        )
    elif len(filled) < len(CORE):
        missing = ", ".join(
            name.replace(".md", "").replace("-", " ")
            for name in CORE if name not in filled
        )
        print(
            f"client-status: PARTLY SET UP. Still blank: {missing}."
            " Answer from what is filled in, say plainly when something has not been"
            " recorded yet, and never fill a gap with a guess."
        )
    else:
        print(f"client-status: set up. {len(niches)} type(s) of work in this folder.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
