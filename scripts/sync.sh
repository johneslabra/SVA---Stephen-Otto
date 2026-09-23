#!/usr/bin/env bash
# Pull latest, commit any local changes, push. Safe to run any time.
# Used by: Claude Code hooks (.claude/settings.json), cron, or by hand: bash scripts/sync.sh
cd "$(dirname "$0")/.."

# The VA can say "not yet" when asked whether to share their work with the team.
# That is what .sync-hold means: keep saving on this computer, upload nothing.
# `bash scripts/sync.sh --local-only` does the same for a single run, and
# `bash scripts/sync.sh --share` clears the hold and uploads.
LOCAL_ONLY=0
case "$1" in
  --local-only) LOCAL_ONLY=1 ;;
  --share)      rm -f .sync-hold ;;
esac
[ -f .sync-hold ] && LOCAL_ONLY=1

# A previous run may have stopped half way through combining two VAs' work.
# Undo that first, so this run starts from a clean state. No work is lost:
# anything the VA had done was already committed by the run that stopped.
if [ -d .git/rebase-merge ] || [ -d .git/rebase-apply ]; then
  git rebase --abort 2>/dev/null || git rebase --quit 2>/dev/null
fi

commit_all() {
  if [ -n "$(git status --porcelain)" ]; then
    git add -A
    git commit --quiet -m "[Auto] sync $(date '+%Y-%m-%d %H:%M') by $(git config user.name || echo "$USER")"
  fi
}

# Always save locally first, so nothing depends on the push working
commit_all

if [ "$LOCAL_ONLY" = "1" ]; then
  [ -f .sync-hold ] || date '+%Y-%m-%d' > .sync-hold
  held_since="$(cat .sync-hold 2>/dev/null)"
  days=$(( ( $(date +%s) - $(date -d "$held_since" +%s 2>/dev/null || date +%s) ) / 86400 ))
  echo "sync: saved on this computer. Held back from the team since $held_since ($days day(s)). Remind the VA."
  exit 0
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "sync: saved locally. Not connected to GitHub yet (no remote). See guides/01-client-setup.md"; exit 0
fi

if ! git pull --rebase --quiet >/tmp/sync-out 2>/tmp/sync-err; then
  if grep -qi "could not read Username\|Permission denied\|Authentication failed" /tmp/sync-err; then
    echo "sync: not logged in to GitHub. Work is saved locally only. See guides/00-github-login.md"; exit 0
  fi

  # Two VAs changed the same file and git could not combine them on its own.
  # Keep both sides rather than leaving the VA stuck mid-merge.
  if [ -n "$(git diff --name-only --diff-filter=U)" ]; then
    for f in $(git diff --name-only --diff-filter=U); do
      case "$f" in
        *.md)
          # Notes and task files: keep this VA's version, the work log lines
          # from the other side were already merged in by the union rule.
          git checkout --theirs -- "$f" 2>/dev/null || git checkout --ours -- "$f" 2>/dev/null
          ;;
        *)
          # Anything else cannot be combined line by line, so keep both:
          # the other VA's version stays under the original name, and this
          # VA's is saved beside it rather than being thrown away.
          second="${f%.*} (second version).${f##*.}"
          [ "$f" = "${f%.*}" ] && second="$f (second version)"
          git show ":3:$f" > "$second" 2>/dev/null && git add "$second" 2>/dev/null
          git checkout --ours -- "$f" 2>/dev/null
          ;;
      esac
      git add "$f" 2>/dev/null
    done
    if ! GIT_EDITOR=true git rebase --continue >/dev/null 2>&1; then
      git rebase --abort 2>/dev/null
      echo "sync: saved locally. Could not combine your work with someone else's automatically."
      echo "sync: tell your lead the client folder needs a look. Nothing is lost."
      exit 0
    fi
  else
    git rebase --abort 2>/dev/null
    echo "sync: saved locally. Could not reach GitHub this time."; exit 0
  fi
fi

# Automatic merges keep both VAs' lines, which can leave a task file's top
# section listing a field twice. Put that right before anything is uploaded.
if python3 scripts/tidy-after-merge.py; then
  commit_all
fi

if git push --quiet 2>/tmp/sync-err || git push --quiet -u origin "$(git rev-parse --abbrev-ref HEAD)" 2>/tmp/sync-err; then
  echo "sync: done"
else
  echo "sync: push failed. Work is saved locally only. See guides/00-github-login.md"; cat /tmp/sync-err
fi
exit 0
