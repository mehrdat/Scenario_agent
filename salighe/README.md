# سلیقه · Personal Taste Profile

This folder is the agents' **memory of you**.

`profile.md` (created when you first run `/salighe update` or `/salighe learn`) is what every command reads before producing any work. It encodes your visual style, your favorite directors, your tonal preferences, the genres you gravitate to, the themes you return to, the things you avoid.

The result: scripts that sound like *you*, storyboards in the style you actually like, character work that hits the archetypes you keep reaching for, dialogue in the register you write in.

## How it's populated

Two paths, used together:

### 1. You tell it explicitly
```
/salighe update "I love Farhadi-style moral dilemmas and Kiarostami long takes. Persian dialogue, Tehrani register. Hate slapstick. Default storyboard style: kiarostami. Aspect: usually 16:9."
```

### 2. The agent observes your work
```
/salighe learn
```
The **salighe-shenas** sub-agent reads everything in `output/` and proposes additions — directors you've cited, themes that recur, structural choices you've made, visual styles you've picked. It writes a proposal at `salighe/_proposed-update.md` with evidence (file paths + line ranges). You accept / reject / edit before anything merges into `profile.md`.

## How it's used

Every command (`/senaario`, `/storybord`, `/negaareh`, `/koutaah`, `/behtar`, …) reads `profile.md` first. The agents:
- Lean toward your stated genres if your brief is ambiguous.
- Default your storyboard style if you don't pass one.
- Match your sentence rhythm and vocabulary register in scenarios.
- Cite directors / writers from your reference list when explaining structural choices.
- Avoid topics or styles you've flagged.

## Privacy

Anything written here lands in your git repo and will be pushed if you push. If you'd rather keep your profile local, add `salighe/profile.md` to `.gitignore`.

## Archive

`/salighe reset` moves the current profile to `salighe/_archive/profile-<date>.md` and starts fresh. Old profiles are kept for reference.
