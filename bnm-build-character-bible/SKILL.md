---
name: bnm-build-character-bible
description: Create operational character files for motivation arc relationships and voice foundations.
---

## BNM Runtime Contract

Before doing task work, read `resources/shared-resources/runtime-contract.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/runtime-contract.md` when installed by a BMad module, or `../shared-resources/runtime-contract.md` when running from the module source, and follow it. In particular:

- Load `{project-root}/_bmad/bnm/config.yaml` when available.
- Use `bnm_output_folder` for durable novel artifacts.
- Read every referenced prompt/resource/example file before executing the workflow.
- Treat listed prompt files as ordered workflow steps, not optional background.
- For Chinese projects, apply `resources/shared-resources/chinese-output-policy.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/chinese-output-policy.md` when installed by a BMad module, or `../shared-resources/chinese-output-policy.md` from the module source.

# BNM Build Character Bible

## Metadata

- code: bnm-build-character-bible
- title: Build Character Bible
- description: Creates operational character files for motivation, arc, relationships, and voice foundations.

## Purpose

Build characters who can sustain plot pressure and future drafting. This workflow turns loose character ideas into a usable `character-bible.md`, not a decorative profile sheet.

## Roles Used

- Character Architect
- Story Architect
- Genre Strategist
- Dialogue Editor
- Author Director

## Inputs

- User character notes
- `story-bible.md`
- `genre-positioning.md`
- Existing outline or premise notes

## Flow

1. Identify each major character's dramatic function.
2. Define desire, need, fear, lie, wound, mask, and pressure points.
3. Map relationship pressure between major characters.
4. Define arc milestones and proof-of-change choices.
5. Seed voice differences without writing generic sample dialogue.
6. Mark assumptions that require author approval.

## Output

- Character bible
- Relationship map
- Character arc map
- Voice seeds

## Gate

A character is not approved if they only have traits, backstory, or trauma but no current pressure that changes choices.

## Reader-Impact Standard

If the character fails, describe the user impact plainly: readers will not believe the choice, will not feel the relationship pressure, or will feel the character exists only to move the plot.

