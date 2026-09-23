# Guide 1 — Setting up a new client

Two people are involved, and it matters which does what.

| Who | Does what |
|---|---|
| **Tech** | Everything on GitHub: creating the client folder, access, invites. Part A below. |
| **CSP** | Fills in the client's information by answering questions. Part B below. Needs no technical knowledge and never touches GitHub. |

If you are the CSP, skip to **Part B**. Tech does Part A first and sends you a message
when it is your turn.

Think of it as a cookie cutter and cookies.

- **The template repo is the cookie cutter.** Never fill it in. It stays blank forever.
- **Each client repo is a cookie.** One per client, made by copying the cutter, then filled in.

## Part A — Tech

### One time only: mark the template as a cutter

1. Open the `client-template` repo on GitHub in your browser.
2. Click **Settings**.
3. Near the top, tick **Template repository**.

### Per client

#### Step 1. Make the client repo from the template
1. Open the `client-template` repo on GitHub.
2. Click the green **Use this template** button, then **Create a new repository**.
3. Name it after the client, e.g. `acme-dental`. Set it to **Private**. Click Create.

#### Step 2. Log in to GitHub on this computer (once)
Follow `guides/00-github-login.md`. Takes two minutes. Without it your work cannot upload.

#### Step 2b. Download it to your computer
On the new repo page click the green **Code** button, copy the link, then:

```bash
git clone PASTE_THE_LINK_HERE
cd acme-dental
```

Then send the CSP the joining message in `guides/05-messages-to-send.md`,
using the CSP version. Their part starts below.

---

## Part B — CSP

You do not need to know anything technical for this. You answer questions about the
client, and everything else happens for you.

### Step 3. Fill in the client's information

Open the client folder in Antigravity, and type:

> Onboard me please

Choose **1**. It will ask you for the client's business name, then take you through the
client one topic at a time: what they do, their brand, the people, the tools, the rules,
and the customer FAQs. Answer what you know, say "I don't know" for anything you don't,
and it moves on.

Give it about twenty minutes. It saves as you go.

**The customer FAQs are the part worth preparing.** They are the questions this business
gets asked all the time and the client's own answers. Every VA who replies to a comment,
message or enquiry will use them, and without them they either guess or interrupt the
client. Before you start, try to get from the client:

- the questions their customers ask most, and their answers in their own words
- anything customers ask that they have never settled on an answer for
- anything a VA must never answer on the client's behalf — usually price, complaints,
  refunds, or anything promising a result

If you do not have these on the day, leave them blank. They will be kept on a list of
things to find out and added whenever you get them.

**Never type a password into the chat.** Passwords go in the password folder. Just say
which login is which and it records the name only.

### Step 3b. Decide who can change the client's information

It will ask who is allowed to change these core details from now on. This stops them
being changed by accident later.

Usually that is you and the account lead. Give it their full names, and for each person
the email their computer saves work under — if they are not sure, they can open their own
folder and ask "what email am I saving my work under?".

Everyone else can still read everything and work normally. They just cannot change these
particular details.

If you do not have everyone's email on the day, say so and leave it open. It can be
locked down any time.

### Step 4. Set up the first type of work (optional)

If you already know what the first VA will be doing, say so:

> Set up social media work for this client

Otherwise skip it. The VA can do this themselves on their first day.

### Step 5. That is it

Your answers save and back up on their own. Just close Antigravity when you are done.

If it tells you something did not back up, send that message to Tech. Your answers are
not lost either way.

---

## Back to Tech

### Note for Tech: the email on the permissions list

The list of people allowed to change a client's core details is matched on **the email
git is configured with on that person's machine**, not their GitHub login. If GitHub
keeps their address private, that is their `users.noreply.github.com` address. When in
doubt, put both on the line, comma separated — an extra one costs nothing, the wrong one
locks someone out of their own client.

Never let a name be listed without an email. The check cannot match a name, so it blocks
everybody, including the people on the list.

### Step 6. Give the VA access
1. GitHub: client repo → **Settings** → **Collaborators** → **Add people** → give **Write** access.
2. Password manager: create a shared vault/collection for the client, add every login using the exact entry names written in `master/tools-and-access.md`, share it with the VA.


Then send them the joining message from `guides/05-messages-to-send.md`. It is
ready to copy, with three blanks to fill in.

Done. Repeat Steps 1–6 for every new client.

## How auto-sync works
- `.claude/settings.json` makes Claude Code run `git pull` when a session starts and `scripts/sync.sh` (pull, commit, push) when it ends.
- `scripts/sync.sh` is safe to run any time and can be put on a cron. VAs on Antigravity should set that up (see guides 2 and 3).
- Auto commits are labelled `[Auto] sync <date> by <name>` so you can see who pushed what.

## Before assigning a new niche to a VA
Add that niche's tools to `master/tools-and-access.md` and to the password manager first. Otherwise the VA's briefing will say "logins unknown".
