---
name: bnm-draft-chapter
description: Plan draft style check and continuity register a chapter.
---

## BNM Runtime Contract

Before doing task work, read `resources/shared-resources/runtime-contract.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/runtime-contract.md` when installed by a BMad module, or `../shared-resources/runtime-contract.md` when running from the module source, and follow it. In particular:

- Load `{project-root}/_bmad/bnm/config.yaml` when available.
- Use `bnm_output_folder` for durable novel artifacts.
- Read every referenced prompt/resource/example file before executing the workflow.
- Treat listed prompt files as ordered workflow steps, not optional background.
- For Chinese projects, apply `resources/shared-resources/chinese-output-policy.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/chinese-output-policy.md` when installed by a BMad module, or `../shared-resources/chinese-output-policy.md` from the module source.

# BNM Draft Chapter

## Metadata

- code: bnm-draft-chapter
- title: Draft Chapter
- description: Plans, drafts, style-checks, and continuity-registers a fiction chapter.

## Purpose

Produce a controlled chapter draft that advances story state and does not damage long-form continuity.

## Required Flow

1. Run context check.
2. Create or refine chapter brief.
3. Create scene cards.
4. Draft from scene cards.
5. Run style and dialogue discipline.
6. Identify continuity updates.

## Gate

Do not draft if the chapter has no clear story-state change. Instead, create a chapter brief and ask for the smallest author decision needed.

## Prompts

- `prompts/01-context-check.md`
- `prompts/02-scene-cards.md`
- `prompts/03-draft.md`
- `prompts/04-style-pass.md`
- `prompts/05-ledger-update.md`

