# Interview Prep

An application workbench. Track every role you are going after, and move each one from
research through to a mock interview, with output tailored to that company and to your own
background.

**Live: https://daynalee.github.io/interview-prep/**

One static HTML file. No build step, no backend, no dependencies, no API key.

## Paste the link, not the posting

Greenhouse, Ashby and Lever all serve their job data with `access-control-allow-origin: *`, so
the page reads them directly. Paste the posting URL, press **Fetch**, and it fills the role, the
full description, and on Greenhouse **their actual application questions**. Identity, compliance
and demographic fields are filtered out; salary expectations are deliberately left for you.

Ashby and Lever do not expose application questions, so add those by hand. Any other board:
paste the description yourself.

## Pipeline first

The top of the page is every role you are chasing, sorted so interviews come first, with a **Next**
column that names the specific thing each one needs. Applications do not usually die because you
were rejected; they die because nothing happened next. When there is no recorded next action the
page infers one from the stage: submit it, set the date you applied, chase a referral, prep the
questions, debrief while it is fresh. Anything overdue turns orange, with a count at the bottom.

## Set your floor once

Put your floor and the top of your range in the profile panel. Every role then gets scored against
it: whole range clears your floor, clears only near the top, or their ceiling is below it and this
is a skip. Stored in this browser only.

## It tells you not to bother, before you spend anything

Put their posted range, the years they ask for, and the headcount into the role fields and the page
gives you an immediate local read against your own criteria. No prompt, no model, no cost. If a
role fails your filters you find out in ten seconds instead of after an hour of tailoring.

Pay gets special handling because it is where the mistakes happen. A range posted as **OTE** is
base plus bonus, so the headline is not the guaranteed money. The base to variable split is the
number that decides whether an offer clears your floor, it is almost never published, and it is the
first thing to ask. Comparing your target against their *total* is how people talk themselves into
and out of the wrong roles.

## One link in, four things out

Paste the posting URL, press **Fetch**, press **Do everything for this role**. One prompt, one
paste into Claude, and you get:

1. **Company research**, every claim tagged `[VERIFIED]` with a source, `[INFERRED]`, or `[UNKNOWN]`.
2. **A tailored resume**, rewritten against the posting from `me/06-resume.md`, plus what changed
   and why, plus what the posting asks for that your background does not evidence.
3. **Answers to their actual application questions**, with per-question limits obeyed.
4. **The interview questions to expect**, ranked into near certain, from the posting, from the
   company, the ones you should fear, and curveballs, **with drafted answers**, a spine for each,
   and the follow-up probes that come next.

Every run opens with a **verdict**: apply, apply only with a referral, or skip, scored against your
criteria. It is instructed not to soften it to be encouraging.

The research pass also runs one search deliberately: **anyone at the company whose career overlaps
yours.** Former employers, schools, cities. Executive hire press releases name prior employers
outright. A real overlap beats every other fact in a dossier, because it is checkable, specific to
you, and no other candidate has it. That search is what turned up an ex-Uber ads leader at
MyFitnessPal, which was the strongest thing in that entire application.

The resume tailoring is allowed to reorder, reweight and re-word. It is not allowed to invent a
bullet, inflate a number, or move a date.

The seven steps below are still there for when you want to control a stage, reuse a dossier across
rounds, or run a mock interview.

## The seven steps

Each one copies a prompt. Paste it into Claude, then bring the result back into the page so
later steps reuse it.

1. **Research the company.** Web search. Every claim tagged `[VERIFIED]` with a source URL,
   `[INFERRED]` with the reasoning, or `[UNKNOWN]`. Gaps are never filled with something
   plausible.
1b. **What does this actually pay.** Market data for the title at this company size in this city,
   from postings and filings rather than aggregator averages, plus a number to actually ask for and
   what is likely flexible. Explicitly told not to anchor on your current salary, and to treat
   PE equity as exit-contingent rather than annual comp.
2. **Should I apply.** Scores the role against your stated criteria and returns Apply, Apply
   if you can get a referral, or Skip. Built to say no.
3. **Application answers.** Answers their exact questions, each with its own length limit, or
   writes full materials (cover letter, short answer bank, resume alignment, outreach) if you
   have not added questions.
4. **Predict my questions.** Ranked into near certain, likely from the posting, likely from the
   company, the ones you should fear, and curveballs, with an order to prepare in.
5. **Draft prep answers.** Answers with a one-line spine to rebuild each in the room,
   follow-up drilling for the probes that come next, and six researched questions to ask them.
6. **Practice out loud.** Claude interviews you one question at a time, probes your answers,
   pushes back, then critiques.
7. **Debrief afterwards.** Turns your notes into paste-ready edits **addressed file by file**:
   new stories for the story bank in the same shape as the existing ones, numbers you could not
   break down when probed, anything you actually said out loud for the voice samples, gaps with no
   prepared bridge, and what the resume made them ask. Plus what to stop doing. This is the only
   part of the tool that compounds: run it four times and the profile is genuinely yours rather
   than a reconstruction.

## Why it is built this way

**Research once per company.** The dossier is stored on the application and reused by every
later step, rather than re-researched each time.

**Two passes, never blended.** Research produces cited facts; a separate pass writes from your
profile and may only use `[VERIFIED]` facts. Doing both at once is what makes answers generic.

**The page never calls a model.** It cannot scrape, because browsers block cross-origin
requests and job boards block bots anyway. So it captures structure, stores what Claude returns,
and builds the right prompt. Everything intelligent happens in Claude, on the plan you already
have.

**Per-question length limits with a real counter.** Paste an answer back into a question and
your browser counts it. That is the count their form applies, and it is more reliable than a
model's self-reported count.

**Your data stays yours.** Profile and applications live in this browser's localStorage only.
Nothing personal is in this repository. Anyone else who opens the site gets an empty tool. Use
**Back up** to export a JSON file, and **Restore** to move it to another device.

## Setup

**On your Mac, zero setup:**

```
~/interview-web/run.sh
```

That regenerates your profile from `~/interview-agent/me/`, starts a local server, and opens the
page with everything preloaded.

**On the hosted site, unlock with a passphrase.** The repo can hold `profile.enc.json`, your
profile encrypted with AES-GCM-256 under a key derived by PBKDF2-SHA256 at 600,000 iterations.
The page fetches it, you enter your passphrase once per device, it decrypts in your browser and
saves locally. Every visit after that loads on its own.

To create it: load your profile in the page, open **Encrypt this profile for the hosted site**,
choose a passphrase, and commit the downloaded `profile.enc.json`.

**Your passphrase is the only protection.** Anyone can download the encrypted file, so it can be
attacked offline with no rate limiting. Use a long unique passphrase from a password manager, and
store it there before you close the tab. It is not recoverable.

Readable profile text is never committed. `profile.local.txt` is gitignored and
`PROFILE-PASTE.md` lives in the private repo.

1. Get your profile in, by whichever route above.
2. Press **New**, fill in the company and paste the job description.
3. Work down the steps.

If you open `index.html` by double-clicking it, browsers block storage on `file://` and nothing
will persist, which is the one case where it really does ask every time. The page detects that
and tells you to use `run.sh` instead.

## Files

- `index.html`: everything. Deliberately one file. Splitting the script out introduced a real
  failure mode: GitHub Pages caches each file separately for 10 minutes, so a browser could end
  up with the markup and no script, which renders a page where nothing responds. One file cannot
  skew against itself.
- `profile.local.txt`: gitignored. If present, the page auto-loads it, so running locally needs
  no pasting. Never committed, never on the public site.

If the page ever does look dead, it now says so instead of failing silently, and a hard refresh
(Cmd Shift R) is the fix.
