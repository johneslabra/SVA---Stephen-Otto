#!/usr/bin/env bash
# One-command setup for a VA's computer.
#
# The VA pastes a single line. This installs what is needed, signs them in,
# downloads the client folder, and checks it actually works.
#
#   bash <(curl -sL https://raw.githubusercontent.com/OWNER/REPO/main/scripts/setup-va.sh) CLIENT_FOLDER_LINK
#
# Safe to run again. It skips anything already done.
#
# Everything printed here is read by someone who does not know what git is.
# Keep the wording plain, and never print a raw error on its own.

set -u

say()  { printf '\n%s\n' "$*"; }
step() { printf '\n[%s of 5] %s\n' "$1" "$2"; }
ok()   { printf '   done. %s\n' "${1:-}"; }
warn() { printf '\n! %s\n' "$*"; }

die() {
  printf '\n-----------------------------------------------\n'
  printf 'Stopped: %s\n' "$1"
  [ $# -gt 1 ] && printf '\nWhat to do: %s\n' "$2"
  printf '\nIf you are stuck, send this whole screen to your lead.\n'
  printf -- '-----------------------------------------------\n\n'
  exit 1
}

ask() {
  # ask "question" -> answer on stdout. Reads from the terminal, not the pipe,
  # so this still works when the script is run straight from the internet.
  local prompt="$1" answer=""
  while [ -z "$answer" ]; do
    printf '\n%s ' "$prompt" > /dev/tty
    read -r answer < /dev/tty || die "could not read your answer."
  done
  printf '%s' "$answer"
}

confirm() {
  local answer
  answer="$(ask "$1 (yes/no)")"
  case "$(printf '%s' "$answer" | tr '[:upper:]' '[:lower:]')" in
    y|yes) return 0 ;;
    *)     return 1 ;;
  esac
}

# ---------------------------------------------------------------- 0. greeting

cat <<'BANNER'

===============================================
 Setting up your client folder
===============================================

This takes about five minutes. It will:
  - install the tool that keeps your work backed up
  - sign you in
  - download the client folder to your computer
  - check everything works

You may be asked to open a web page and paste a short code.
That is normal.
BANNER

# ------------------------------------------------------- 1. what do we have?

step 1 "Checking your computer"

case "$(uname -s)" in
  Darwin)                 PLATFORM=mac ;;
  Linux)                  PLATFORM=linux ;;
  MINGW*|MSYS*|CYGWIN*)   PLATFORM=windows ;;
  *)                      PLATFORM=unknown ;;
esac
ok "You are on $(uname -s)."

command -v git >/dev/null 2>&1 || die \
  "your computer does not have the basic tools installed yet." \
  "Ask your lead to install Git on this computer, then run this again."

# ------------------------------------------------------ 2. the backup tool

step 2 "Installing the backup tool"

install_gh() {
  case "$PLATFORM" in
    mac)
      command -v brew >/dev/null 2>&1 || return 1
      brew install gh
      ;;
    linux)
      if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update -qq && sudo apt-get install -y gh
      elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y gh
      else
        return 1
      fi
      ;;
    windows)
      command -v winget >/dev/null 2>&1 || return 1
      winget install --id GitHub.cli --silent --accept-package-agreements --accept-source-agreements
      ;;
    *) return 1 ;;
  esac
}

if command -v gh >/dev/null 2>&1; then
  ok "Already installed."
else
  say "   This needs to install one small program. You may be asked for your"
  say "   computer password. That is your own password, not a work one."
  if ! install_gh; then
    die "the backup tool could not be installed automatically on this computer." \
        "Ask your lead to install the GitHub CLI, then run this again. It is at cli.github.com."
  fi
  command -v gh >/dev/null 2>&1 || die \
    "the backup tool installed but the computer cannot find it yet." \
    "Close this window, open a new one, and run the same line again."
  ok "Installed."
fi

# --------------------------------------------------------------- 3. sign in

step 3 "Signing you in"

if gh auth status >/dev/null 2>&1; then
  ok "Already signed in."
else
  say "   A web page will open. Sign in, then paste the code it shows you."
  say "   If no page opens, copy the link it prints into your browser."
  gh auth login --hostname github.com --git-protocol https --web || die \
    "signing in did not finish." \
    "Run the same line again and complete the sign-in page."
  gh auth status >/dev/null 2>&1 || die \
    "signing in did not finish." \
    "Run the same line again and complete the sign-in page."
  ok "Signed in."
fi

gh auth setup-git >/dev/null 2>&1 || true

# Name and email, so saved work shows who did it. These are also what decides
# who is allowed to change a client's core details, so get them right.
GH_LOGIN="$(gh api user --jq .login 2>/dev/null || true)"
GH_NAME="$(gh api user --jq '.name // ""' 2>/dev/null || true)"
GH_EMAIL="$(gh api user --jq '.email // ""' 2>/dev/null || true)"

if [ -z "$(git config --global user.name || true)" ]; then
  [ -n "$GH_NAME" ] || GH_NAME="$(ask 'What is your full name?')"
  git config --global user.name "$GH_NAME"
fi

if [ -z "$(git config --global user.email || true)" ]; then
  if [ -z "$GH_EMAIL" ] || [ "$GH_EMAIL" = "null" ]; then
    # Their address is private on GitHub, so use the one GitHub provides for
    # exactly this. Work saved under anything else may not be accepted.
    GH_ID="$(gh api user --jq .id 2>/dev/null || true)"
    if [ -n "$GH_ID" ] && [ -n "$GH_LOGIN" ]; then
      GH_EMAIL="${GH_ID}+${GH_LOGIN}@users.noreply.github.com"
    else
      GH_EMAIL="$(ask 'What is your work email address?')"
    fi
  fi
  git config --global user.email "$GH_EMAIL"
fi

WHO_NAME="$(git config --global user.name)"
WHO_EMAIL="$(git config --global user.email)"
ok "Your work will be saved as: $WHO_NAME <$WHO_EMAIL>"

# ------------------------------------------------------ 4. the client folder

step 4 "Downloading the client folder"

REPO_URL="${1:-}"
if [ -z "$REPO_URL" ]; then
  say "   Your lead sent you a link for this client. It looks like"
  say "   https://github.com/something/client-name"
  REPO_URL="$(ask 'Paste that link here:')"
fi

REPO_URL="$(printf '%s' "$REPO_URL" | tr -d '[:space:]')"
REPO_URL="${REPO_URL%.git}"
REPO_URL="${REPO_URL%/}"
case "$REPO_URL" in
  https://github.com/*/*|git@github.com:*/*) : ;;
  *) die "that does not look like a client folder link." \
         "Ask your lead to send you the link again. It starts with https://github.com/" ;;
esac

CLIENT_NAME="$(basename "$REPO_URL")"

# Clients go in an SVA folder on the Desktop, where the VA can actually see them.
# Windows often moves the Desktop into OneDrive, so look there too. If there is no
# Desktop at all, fall back to the home folder rather than failing.
find_desktop() {
  local candidate
  for candidate in \
    "$HOME/Desktop" \
    "$HOME/OneDrive/Desktop" \
    "$HOME/OneDrive - "*"/Desktop" \
    "${USERPROFILE:-}/Desktop"
  do
    [ -d "$candidate" ] && printf '%s' "$candidate" && return 0
  done
  return 1
}

if DESKTOP="$(find_desktop)"; then
  PARENT="$DESKTOP/SVA"
else
  PARENT="$HOME/SVA"
fi

TARGET="$PARENT/$CLIENT_NAME"
mkdir -p "$PARENT" || die "could not create the SVA folder on your Desktop." \
  "Check you have space on this computer, then run the same line again."

if [ -d "$TARGET/.git" ]; then
  ok "You already have this client. Getting the latest."
  git -C "$TARGET" pull --rebase --autostash --quiet 2>/dev/null || true
elif [ -e "$TARGET" ]; then
  die "there is already something called $CLIENT_NAME in your SVA folder." \
      "Ask your lead which one to keep."
else
  if ! GIT_TERMINAL_PROMPT=0 git clone --quiet "$REPO_URL" "$TARGET" 2>/tmp/setup-va-err; then
    rm -rf "$TARGET"
    # "Not found" and "could not read Username" both usually mean the same
    # thing from the VA's side: this account cannot see this client yet.
    if grep -qi "not found\|does not exist\|could not read Username\|Authentication failed\|Permission denied\|403" /tmp/setup-va-err; then
      die "you do not have access to this client yet." \
          "Send your lead this: 'Can you add me to the $CLIENT_NAME folder on GitHub? My username is ${GH_LOGIN:-unknown}.'"
    fi
    if grep -qi "could not resolve\|unable to access\|timed out\|network" /tmp/setup-va-err; then
      die "your computer could not reach the internet." \
          "Check your connection and run the same line again."
    fi
    die "the client folder could not be downloaded." \
        "Run the same line again. If it keeps failing, send your lead this screen."
  fi
  ok "Downloaded."
fi

# ------------------------------------------------------------- 5. does it work

step 5 "Checking it works"

cd "$TARGET" || die "could not open the folder that was just downloaded."

# The automatic backup runs through bash, and the rule about who may change a
# client's core details runs through python3. On Windows neither is a given.
# Check now and say so, rather than letting it fail quietly in a month.
MISSING=""
command -v bash >/dev/null 2>&1 || MISSING="the Bash shell"
if ! command -v python3 >/dev/null 2>&1; then
  if command -v python >/dev/null 2>&1 && python -c "import sys; sys.exit(0 if sys.version_info[0]==3 else 1)" 2>/dev/null; then
    : # python is Python 3, close enough
  else
    MISSING="${MISSING:+$MISSING and }Python"
  fi
fi
if [ -n "$MISSING" ]; then
  warn "This computer is missing $MISSING."
  warn "Your work will still save, but the automatic backup may not run."
  warn "Send your lead this: 'Setup says this computer is missing $MISSING for $CLIENT_NAME.'"
fi

if [ -f scripts/sync.sh ]; then
  RESULT="$(bash scripts/sync.sh 2>&1 | tail -1)"
  case "$RESULT" in
    *"sync: done"*)
      ok "Your work will back up automatically." ;;
    *"not logged in"*|*"push failed"*)
      warn "Your work saves on this computer, but cannot back up yet."
      warn "Send your lead this: 'Setup finished but the backup is not working for $CLIENT_NAME.'" ;;
    *"no remote"*)
      warn "This folder is not connected to the online backup yet. Your lead needs to do that." ;;
    *)
      ok "Ready." ;;
  esac
else
  warn "This does not look like a client folder. Check the link with your lead."
fi

# ------------------------------------------------------------------ finished

cat <<FINISHED

===============================================
 All set
===============================================

Your client folder is here:

  $TARGET

What to do now:
  1. Open that folder in Antigravity or Claude Code.
  2. Type:  Onboard me please
  3. Answer the questions it asks.

If anyone ever asks which email you save your work under, it is:

  $WHO_EMAIL

FINISHED
