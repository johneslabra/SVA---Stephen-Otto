#!/usr/bin/env bash
# Bring a client folder that was made from an older template up to date.
#
# Run this from the template folder, for Tech only:
#
#   bash scripts/update-client-repo.sh ~/Desktop/SVA/bright-smile-dental
#   bash scripts/update-client-repo.sh ~/Desktop/SVA/*          # several at once
#
# It replaces the machinery — instructions, scripts, guides, templates, skills —
# and leaves every piece of client work alone. It never touches:
#
#   master/*            the client's details, including who may edit them
#   <Niche>/            any service folder, its README, tasks or assets
#
# The one exception is master/faqs.md, which is CREATED if missing because older
# folders predate it, and never overwritten if it already exists.
#
# Nothing is pushed. It stages the changes and shows you what it did, so you can
# look before committing.

set -u

TEMPLATE="$(cd "$(dirname "$0")/.." && pwd)"

# Machinery: safe to overwrite, holds no client work.
FILES="
CLAUDE.md
AGENTS.md
README.md
.gitattributes
.gitignore
.claude/settings.json
scripts/sync.sh
scripts/guard-master.py
scripts/tidy-after-merge.py
scripts/client-status.py
scripts/setup-va.sh
scripts/make-agents-md.py
scripts/update-client-repo.sh
"

DIRS="
guides
skills
_templates
"

# Created only if absent, because a client folder may already have real content.
CREATE_IF_MISSING="
master/faqs.md
master/who-can-edit.md
"

fail() { printf '\n  ERROR: %s\n' "$1"; return 1; }

update_one() {
  local target="$1"
  printf '\n=== %s\n' "$target"

  [ -d "$target" ]      || { fail "no such folder"; return 1; }
  [ -d "$target/.git" ] || { fail "not a client folder (no history in it)"; return 1; }
  [ -d "$target/master" ] || { fail "this does not look like a client folder — no client details in it"; return 1; }
  [ "$(cd "$target" && pwd)" != "$TEMPLATE" ] || { fail "that is the template itself, skipping"; return 1; }

  if [ -n "$(cd "$target" && git status --porcelain 2>/dev/null)" ]; then
    printf '  Note: this folder has unsaved changes. Saving them first so nothing is lost.\n'
    (cd "$target" && git add -A && git commit --quiet -m "[Auto] save before template update") || true
  fi

  local changed=0

  # Work out the client's real name first, so files carrying it can be compared
  # like for like. Without this the same three files look changed every run.
  local real=""
  if [ -f "$target/master/README.md" ]; then
    real="$(sed -n 's/^# Master — //p' "$target/master/README.md" | head -1)"
    [ "$real" = "{{CLIENT_NAME}}" ] && real=""
  fi

  local tmp
  tmp="$(mktemp)"
  for f in $FILES; do
    [ -f "$TEMPLATE/$f" ] || continue
    mkdir -p "$target/$(dirname "$f")"
    if [ -n "$real" ]; then
      sed "s/{{CLIENT_NAME}}/$real/g" "$TEMPLATE/$f" > "$tmp"
    else
      cp "$TEMPLATE/$f" "$tmp"
    fi
    if ! cmp -s "$tmp" "$target/$f"; then
      cp "$tmp" "$target/$f"
      printf '  updated  %s\n' "$f"
      changed=$((changed + 1))
    fi
  done
  rm -f "$tmp"

  for d in $DIRS; do
    [ -d "$TEMPLATE/$d" ] || continue
    # Replace wholesale: these are machinery, and a stale guide is worse than none.
    if [ -d "$target/$d" ] && ! diff -rq "$TEMPLATE/$d" "$target/$d" >/dev/null 2>&1; then
      rm -rf "${target:?}/$d"
      cp -r "$TEMPLATE/$d" "$target/$d"
      printf '  updated  %s/\n' "$d"
      changed=$((changed + 1))
    elif [ ! -d "$target/$d" ]; then
      cp -r "$TEMPLATE/$d" "$target/$d"
      printf '  added    %s/\n' "$d"
      changed=$((changed + 1))
    fi
  done

  for f in $CREATE_IF_MISSING; do
    [ -f "$TEMPLATE/$f" ] || continue
    if [ ! -f "$target/$f" ]; then
      cp "$TEMPLATE/$f" "$target/$f"
      printf '  added    %s   (was missing, blank copy)\n' "$f"
      changed=$((changed + 1))
    else
      printf '  kept     %s   (already has content)\n' "$f"
    fi
  done

  [ -n "$real" ] && printf '  named    files carry "%s"\n' "$real"

  if [ "$changed" -eq 0 ]; then
    printf '  Already up to date.\n'
    return 0
  fi

  (cd "$target" && git add -A) || true
  printf '  %s item(s) updated and staged. Client details and tasks untouched.\n' "$changed"
  printf '  To finish:  cd "%s" && git commit -m "Update from template" && bash scripts/sync.sh\n' "$target"
}

if [ $# -eq 0 ]; then
  printf 'Give me the client folder(s) to update, e.g.\n'
  printf '  bash scripts/update-client-repo.sh ~/Desktop/SVA/bright-smile-dental\n'
  exit 1
fi

for target in "$@"; do
  update_one "$target" || true
done

printf '\nDone. Nothing has been uploaded — check each folder, then commit and sync.\n'
