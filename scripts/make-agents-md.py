#!/usr/bin/env python3
"""Rebuild AGENTS.md from CLAUDE.md.

Both files hold the same instructions; only the tool reading them differs.
Keeping one source stops them drifting, which has happened before.

Run after editing CLAUDE.md:  python3 scripts/make-agents-md.py
"""
import sys

SRC, DST = "CLAUDE.md", "AGENTS.md"

# Claude Code enforces the master/ rule with a hook. Other tools have no hook,
# so they are told to honour it themselves.
SWAPS = [(
    "- **Never** edit `master/` for someone not listed in `master/who-can-edit.md`. If blocked,",
    "- **Never** edit `master/` for someone not listed in `master/who-can-edit.md`. Claude Code\n"
    "  blocks this automatically; other tools must honour it themselves. If blocked,",
)]


def main():
    text = open(SRC, encoding="utf-8").read()
    for old, new in SWAPS:
        if old not in text:
            print(f"{SRC} no longer contains the line this script rewrites:\n  {old[:60]}...")
            return 1
        text = text.replace(old, new, 1)
    open(DST, "w", encoding="utf-8").write(text)
    print(f"{DST} rebuilt from {SRC}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
