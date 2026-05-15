---
description: گونه — Genre / category consultation. Recommends a genre (fiction or documentary), maps its conventions, and lists 5 reference works the user should watch.
argument-hint: [project-slug or free-text idea]
---

Invoke **daastansaraa** for genre / category mapping.

Steps:
1. If `$1` matches an existing `output/senaario/$1/` slug, read the logline + synopsis. Otherwise treat `$ARGUMENTS` as a free-text idea.
2. Recommend **two genre placements**: a primary genre and a hybrid second genre. Justify in one paragraph each.
3. Map the **conventions** the audience expects of each: obligatory scenes, structural beats, tone, ending shape.
4. For documentary briefs, instead recommend a **documentary category** from: expository / observational / participatory / reflexive / performative / poetic / essay / biographical / archival / true-crime / nature / investigative / cinéma-vérité / mockumentary / hybrid / re-enactment / activist / ethnographic.
5. Suggest **5 reference works** to study (mix Iranian + international).
6. Write the report at `output/naghd/$1-gooneh.md` (or `output/naghd/gooneh-<date>.md` if no slug).
7. Summary ≤4 lines.

Use the **daastansaraa** sub-agent.
