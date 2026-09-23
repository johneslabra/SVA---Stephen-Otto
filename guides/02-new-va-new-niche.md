# Guide 2 — New VA starting a new niche

You are the first person doing this service for this client. You create the niche folder yourself.

## Day one

## The quick way (recommended)

Paste this one line into Terminal (Mac) or Git Bash (Windows), with the client
link your lead sent you on the end:

> **If you have Antigravity, do not use this.** Ask your lead for the joining message
> instead — you paste it into Antigravity and it sets everything up for you. The steps
> below are only for setting up by hand.

```bash
bash <(curl -sL https://raw.githubusercontent.com/johneslabra/SVA-Client-KB-Template/main/scripts/setup-va.sh) PASTE_THE_CLIENT_LINK_HERE
```

It installs what is needed, signs you in, downloads the client folder, and checks
it works. It is safe to run again if anything goes wrong.

When it finishes it tells you where the folder is, and which email your work is
saved under. Your lead may ask you for that email.

Then open the folder and type: **Onboard me please**

---

If that does not work on your computer, do it by hand instead:



### Step 1. Accept the invites
- Accept the GitHub collaborator invite (check your email).
- Accept the password manager share.

### Step 2. Log in to GitHub on this computer (once)
Follow `guides/00-github-login.md`. Takes two minutes. Without it your work cannot upload.

### Step 2b. Download the client repo
On the repo page click the green **Code** button, copy the link, then:

```bash
git clone PASTE_THE_LINK_HERE
cd acme-dental
```

### Step 3. Get onboarded
Open the folder in Claude Code or Antigravity and type:

> Onboard me please

Choose **2**. The AI briefs you on the client, creates your niche folder, and logs your first tasks. Steps 4 and 5 below are what it will do for you.

If you prefer a direct prompt:

> I'm the new VA on this client. Brief me on who the client is, the brand, contacts, tools, and rules from master/. Also summarise what the other niches are doing.

### Step 4. Create your niche folder
> I'm starting GHL work for this client. Create a GHL niche folder from the template and interview me to fill in its README: scope, KPIs, recurring duties, and tools.

The AI copies `_templates/niche/` to `GHL/`, asks you questions, and writes the README.

### Step 5. Log your first tasks
> Create task files for what I've been asked to do: [describe the tasks]. 

### Step 6. Get your logins
Open the password manager. `master/tools-and-access.md` tells you which entry name to open for each tool.

## Every working day

Syncing is automatic. Opening the repo in Claude Code pulls the latest. Ending the session pushes your changes. You never run git by hand.

**Start of day** — open the repo in Claude Code and ask:
> What changed since yesterday and what should I work on today?

**End of day** — tell the AI:
> Today I [what you did]. Update the task files.

Then close the session. Your work is pushed. Do this every day, even if a task is not finished. The work log is the history the next VA will read.

**Using Antigravity or another tool?** Set up the auto-sync cron once (see below), or run `bash scripts/sync.sh` at the start and end of your day.

### One-time: auto-sync every 15 minutes (optional but recommended)
```bash
crontab -e
```
Add this line, with the real path to your clone:
```
*/15 * * * * cd /full/path/to/acme-dental && bash scripts/sync.sh >> /tmp/client-sync.log 2>&1
```
Windows users: use Task Scheduler to run `bash scripts/sync.sh` every 15 minutes, or just rely on Claude Code.

## Rules
- Never put passwords, API keys, or card details in the repo or the chat.
- Never delete a task file. Set its status to `done` or `cancelled`.
- When the client decides something, tell the AI so it goes under **Decisions** with the date.
