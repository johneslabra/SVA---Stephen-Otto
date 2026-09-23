# Guide 3 — New VA replacing a previous VA

The previous VA's history is in the repo. You do not need a handover call. The AI will walk you through it.

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

Choose **3**. The AI gives you the full handover and marks you as the new owner. Step 4 below is what it will do for you.

If you prefer a direct prompt:

> I'm replacing the previous VA on [niche name]. Give me a full briefing: who the client is, the brand, the tools I need, the rules, and every open task in my niche with its full history, where the previous VA left off, and the next steps. Also flag anything blocked or waiting on the client.

Read it carefully. Ask follow-ups:

> Show me the decisions made with the client on [task].
> What did the previous VA do in the last two weeks?
> Is there anything in the niche README handover notes I should know?

### Step 4. Mark yourself as the owner
> Update the niche README "Current VA" to my name, and set me as owner on all open tasks in [niche].

### Step 5. Get your logins
Open the password manager. `master/tools-and-access.md` tells you which entry name to open for each tool.

## Every working day

Syncing is automatic. Opening the repo in Claude Code pulls the latest. Ending the session pushes your changes. You never run git by hand.

**Start of day** — open the repo in Claude Code and ask:
> What changed since yesterday and what should I work on today?

**End of day** — tell the AI:
> Today I [what you did]. Update the task files.

Then close the session. Your work is pushed. Do this every day, even if a task is not finished. The work log is the history for whoever comes after you.

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
- Never delete a task file or rewrite old work-log entries. Set status to `done` or `cancelled`.
- When the client decides something, tell the AI so it goes under **Decisions** with the date.

## For the lead: when a VA leaves
Before removing the old VA, ask them to run:
> Update every open task in my niche with where I left off and the next steps. Add anything a replacement needs to know to the niche README handover notes.

Then remove them from the GitHub repo and the password manager share, and rotate any shared passwords.
