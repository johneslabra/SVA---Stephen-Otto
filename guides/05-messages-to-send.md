# Guide 5 — Messages to send

Two ready-made messages, both sent by Tech. One for the CSP who fills in the client's
information, one for the VA who does the work.

Neither person needs to know anything technical. They paste a message into Antigravity
and it sets their computer up for them.

Fill in the blanks and send. Nothing has to be hosted anywhere: the steps travel inside
the message.

**The prompts on their own are in `guides/prompts/`**, as plain text files ready to copy:

- `csp-setup-prompt.txt`
- `va-setup-prompt.txt`
- `update-clients-prompt.txt` — for Tech, to bring older client folders up to date

Those are the same prompts as below, without the surrounding explanation. Use whichever
is easier to send.

- **CLIENT** — the client's name, e.g. Bright Smile Dental
- **CLIENT_LINK** — the client's folder link, from GitHub → the client repo → green
  **Code** button → copy the HTTPS link

Send the GitHub invite and the password folder share at the same time, or the VA will get
stuck through no fault of their own.

---

## Message 1 — for the CSP (setting up a new client)

Send this once the client's folder exists on GitHub and they have been invited.

> Hi! We've set up the folder for **CLIENT** and you're the one filling in their details.
> It's all questions about the client — nothing technical.
>
> **1. Accept two invites** (check your email, including spam)
> - one from GitHub, to join the client folder
> - one for the password folder
>
> **2. Open Antigravity**, then open any folder — your Desktop is fine.
>
> **3. Paste this in and send it:**
>
> ---
>
> I'm setting up a new client and I need the client folder on this computer.
> Please do all of this for me and tell me in plain words what's happening. I'm
> not technical, so don't ask me to run anything myself or to choose between
> technical options — just pick the sensible one and tell me what you did.
>
> First work out whether I'm on Mac or Windows, and use the right approach.
>
> 1. Make sure git is installed. Windows: `winget install --id Git.Git -e` —
>    I need it for the Bash shell it includes. Mac: `xcode-select --install`.
> 2. Make sure the GitHub CLI (`gh`) is installed. Windows:
>    `winget install --id GitHub.cli -e`. Mac: use Homebrew if I have it,
>    otherwise download the official package from github.com/cli/cli/releases
>    and walk me through it. If something was just installed, my shell may need
>    restarting before it can be found — handle that rather than telling me it
>    failed.
> 3. Check `gh auth status`. If I'm not signed in, run
>    `gh auth login --hostname github.com --git-protocol https --web`, then
>    **tell me the code and the web page to open, and wait for me to finish
>    before carrying on.**
> 4. Run `gh auth setup-git`.
> 5. If my name and email aren't set in git, set them from my GitHub account.
>    If GitHub hides my email, use my `users.noreply.github.com` address.
> 6. Make a folder called "SVA" on my Desktop if it isn't there, and clone
>    CLIENT_LINK into it. On Windows my Desktop may be inside OneDrive. If I
>    don't have access, tell me my GitHub username so I can ask for it.
> 7. Check this computer has Bash and Python 3. On Windows install Python with
>    `winget install --id Python.Python.3.12 -e` if it's missing.
> 8. Run `bash scripts/sync.sh` to check the backup works.
> 9. Tell me where the folder is, what email my work is saved under, and whether
>    anything didn't work.
>
> ---
>
> **4. Send me the email address it shows you at the end** — I need it so you're
> allowed to change the client's details later.
>
> **5. Open the client folder** (File → Open Folder → Desktop → SVA → the client's
> name) and type:
>
> ```
> Onboard me please
> ```
>
> **Choose 1.** It'll ask you about the client one topic at a time — what they do,
> their brand, who's who, the tools, the rules, and the questions their customers
> ask most. Answer what you know and say "I don't know" for anything you don't.
> Takes about twenty minutes.
>
> **Worth knowing:**
> - Your answers save on their own as you go. Nothing to remember.
> - Never type a password into the chat. Passwords go in the password folder.
> - If you don't know something, leave it. It keeps a list and you can add it later.
>
> The one thing worth preparing beforehand: ask the client what questions their
> customers ask them most, and what they answer. Also anything we should never
> answer for them — prices, complaints, refunds. That's the part every VA uses daily.

---

## Message 2 — for the VA (doing the work)

> Hi! Here's how to get set up on **CLIENT**. Takes about five minutes.
>
> **1. Accept two invites** (check your email, including spam)
> - one from GitHub, to join the client folder
> - one for the password folder
>
> **2. Open Antigravity**, then open any folder — your Desktop is fine. It just needs
> somewhere to start, and it will make the proper folder for you in a moment.
>
> **3. Copy everything below and paste it into the chat**, then send it.
>
> ---
>
> I'm a virtual assistant and I need to set up a client folder on this computer.
> Please do all of this for me, step by step, and tell me in plain words what's
> happening. I'm not technical, so please don't ask me to run anything myself,
> and don't ask me to choose between technical options — just pick the sensible
> one and tell me what you did.
>
> First work out whether I'm on Mac or Windows, and use the right approach.
>
> 1. Make sure git is installed.
>    - Windows: if it's missing, install Git for Windows
>      (`winget install --id Git.Git -e`). I need it for the Bash shell it
>      includes, so don't skip this even if something else would do.
>    - Mac: if it's missing, run `xcode-select --install` and wait for it.
> 2. Make sure the GitHub CLI (`gh`) is installed.
>    - Windows: `winget install --id GitHub.cli -e`
>    - Mac: use Homebrew if I have it. If I don't, don't install Homebrew just
>      for this — download the official `gh` package from
>      github.com/cli/cli/releases instead, and walk me through it.
>    - If a new program was installed, my shell may need restarting before it
>      can be found. Handle that rather than telling me it failed.
> 3. Check whether I'm signed in with `gh auth status`. If I'm not, run
>    `gh auth login --hostname github.com --git-protocol https --web`, then
>    **tell me the code and the web page to open, and wait for me to finish
>    before carrying on.** Don't move to the next step until I say it's done.
> 4. Run `gh auth setup-git`.
> 5. If my name and email aren't set in git yet, set them from my GitHub
>    account. If GitHub hides my email, use my `users.noreply.github.com`
>    address.
> 6. Make a folder called "SVA" on my Desktop if it isn't there already, and
>    clone CLIENT_LINK into it. On Windows my Desktop may be inside OneDrive —
>    use whichever one is real. If I don't have access, tell me my GitHub
>    username so I can ask my lead.
> 7. Check this computer has Bash and Python 3, since the automatic backup and
>    the file protection need them. On Windows, Git for Windows provides Bash;
>    install Python with `winget install --id Python.Python.3.12 -e` if it's
>    missing. On Mac both are usually already there.
> 8. Open that folder and run `bash scripts/sync.sh` to check the backup works.
>    On Windows, run it through Git Bash.
> 9. Tell me where the folder is, what email address my work is saved under, and
>    whether anything above didn't work.
>
> ---
>
> **4. When it's done**, it'll show you an email address. **Send me that** — I need it
> to give you the right permissions.
>
> **5. Open the client folder it made.** It's on your Desktop, in a folder called
> **SVA**. In Antigravity: File → Open Folder → Desktop → SVA → the client's name.
> Then type:
>
> ```
> Onboard me please
> ```
>
> It'll ask whether you're new to this client or taking over from someone. Answer its
> questions and it'll set you up and tell you what to work on first.
>
> **Worth knowing:**
> - Everything for work lives in the SVA folder on your Desktop. One folder per client.
> - Your work saves and backs up on its own. You never have to remember to save.
> - Never type a password into the chat. Passwords live in the password folder only.
> - At the end of each day, just tell it what you did.
>
> If anything goes wrong, copy what it said and send it to me. You can't break anything,
> and you can paste that message again as many times as you like.

---

## If they get stuck

**"It says I don't have access."** They haven't accepted the GitHub invite, or it went to
a different email. The AI will have told them their GitHub username — use it to invite
them.

**"It's waiting and nothing is happening."** The sign-in step needs them to open a web
page and paste a code. They may not have noticed. Tell them to look for the code in the
chat and open github.com/login/device.

**"It asked for my password."** That is their own computer password, needed to install
the tool. If they are on a company machine and do not have it, they need IT, or the
by-hand steps in `guides/00-github-login.md`.

**Nothing works.** Fall back to the one-line terminal setup in
`guides/00-github-login.md`, which does the same thing without Antigravity.

## Mac and Windows notes

Almost all VAs are on one or the other, and they fail in different places.

**Windows.** Git for Windows is the important one: it brings the Bash shell that the
automatic backup runs through. Without it, work still saves but may never reach the team
— the failure you cannot see. Python is also needed for the protection on the client's
core details. The setup checks both and says so if either is missing.

Windows also often puts the Desktop inside OneDrive. The setup handles both, but if a VA
cannot find their SVA folder, look in OneDrive first.

**Mac.** Homebrew is the usual way to install `gh`, and plenty of Macs do not have it.
Do not install Homebrew just for this — the official `gh` download is quicker and less
invasive. Bash and Python are already on every Mac.

A Mac may also ask to install developer tools the first time git runs. That is normal,
takes a few minutes, and only happens once.

## Why it is written this way

The instructions are addressed to the AI, not the VA, and they are explicit about waiting
at the sign-in step — that is the one point where a person has to do something in a
browser, and an assistant that races past it leaves them stranded.

"Tell me what email my work is saved under" is there because that address decides who can
change the client's core details. Asking while it is on their screen saves chasing it
later.
