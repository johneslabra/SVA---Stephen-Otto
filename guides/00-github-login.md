# Guide 0 — Log in to GitHub on your computer (do once per computer)

Without this, the repo saves your work locally but cannot upload it. You will see:
`could not read Username for 'https://github.com'`

## Easiest by far: the one-line setup

> **If you have Antigravity, do not use this.** Ask your lead for the joining message
> instead — you paste it into Antigravity and it sets everything up for you. The steps
> below are only for setting up by hand.

```bash
bash <(curl -sL https://raw.githubusercontent.com/johneslabra/SVA-Client-KB-Template/main/scripts/setup-va.sh) PASTE_THE_CLIENT_LINK_HERE
```

This does everything on this page for you, and downloads the client folder too.
Only carry on below if it does not work on your computer.

## By hand: GitHub CLI

**Install**
- Mac: `brew install gh`
- Windows: `winget install GitHub.cli`
- Ubuntu/Debian: `sudo apt install gh`

**Log in**
```bash
gh auth login
```
Choose: GitHub.com → HTTPS → Yes (authenticate git) → Login with a web browser. Follow the link, paste the code.

**Test**
```bash
cd path/to/client-repo
bash scripts/sync.sh
```
You should see `sync: done`.

## Also set your name once (so commits show who did the work)
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Alternative: SSH key
If you already use SSH keys with GitHub, clone with the SSH link (`git@github.com:...`) instead of HTTPS and no login step is needed.
