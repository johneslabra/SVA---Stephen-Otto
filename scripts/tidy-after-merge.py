#!/usr/bin/env python3
"""Tidy task files after an automatic merge.

`.gitattributes` tells git to keep both VAs' lines rather than stopping with a
conflict. That is right for work logs, but it duplicates the single-value fields
at the top of a task file (status, updated, owner). This keeps the last value of
each field, which is the one from whoever synced most recently, and drops any
line that ended up in the file twice in a row.

Silent unless it changes something. Safe to run at any time.
"""
import glob
import re
import sys

TARGETS = ["*/tasks/*.md", "*/*/tasks/*.md", "master/history.md",
           "master/faqs.md", "*/README.md"]
FIELD = re.compile(r"^([A-Za-z_][A-Za-z0-9_-]*):(.*)$")


def tidy_frontmatter(block):
    """Keep one line per field: the last value given, in first-seen order."""
    order, values, other = [], {}, []
    for line in block:
        m = FIELD.match(line)
        if not m:
            other.append(line)
            continue
        key = m.group(1)
        if key not in values:
            order.append(key)
        values[key] = line
    return [values[k] for k in order] + other


def drop_repeated_lines(lines):
    """Drop a list item or table row that already appears earlier in the file.

    Combining two VAs' copies can land the same work-log entry or the same FAQ
    row in the file twice, sometimes several lines apart. Neither ever needs to
    appear twice, so the first is kept and later copies dropped. Only list items
    and table rows are considered, so ordinary prose is never touched.
    """
    seen, out = set(), []
    for line in lines:
        stripped = line.strip()

        # A real bullet is "- text" or "* text". A row of dashes is a
        # frontmatter fence or a horizontal rule and must never be dropped.
        is_bullet = (
            len(stripped) > 2
            and stripped[0] in "-*"
            and stripped[1] == " "
            and stripped[2:].strip() != ""
        )

        # A table row, but not the "|---|---|" line under a heading, and not a
        # blank placeholder row, which several tables here start life with.
        is_row = (
            stripped.startswith("|")
            and set(stripped) - set("|- :")
            and stripped.strip("| ") != ""
        )

        if is_bullet or is_row:
            if stripped in seen:
                continue
            seen.add(stripped)
        out.append(line)
    return out


def tidy(path):
    with open(path, encoding="utf-8") as fh:
        original = fh.read()
    lines = original.splitlines()

    if lines and lines[0].strip() == "---":
        try:
            end = lines.index("---", 1)
        except ValueError:
            end = None
        if end is not None:
            lines = ["---"] + tidy_frontmatter(lines[1:end]) + lines[end:]

    lines = drop_repeated_lines(lines)
    new = "\n".join(lines) + ("\n" if original.endswith("\n") else "")
    if new != original:
        with open(path, "w", encoding="utf-8") as fh:
            fh.write(new)
        return True
    return False


def main():
    changed = [p for pattern in TARGETS for p in sorted(glob.glob(pattern)) if tidy(p)]
    if changed:
        print("tidied after merge: " + ", ".join(changed))
    return 0


if __name__ == "__main__":
    sys.exit(main())
