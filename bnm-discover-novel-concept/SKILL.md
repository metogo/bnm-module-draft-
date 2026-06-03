---
name: bnm-discover-novel-concept
description: Turn raw fiction ideas into a story brief reader promise and premise viability notes.
---

## BNM Runtime Contract

Before doing task work, read `resources/shared-resources/runtime-contract.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/runtime-contract.md` when installed by a BMad module, or `../shared-resources/runtime-contract.md` when running from the module source, and follow it. In particular:

- Load `{project-root}/_bmad/bnm/config.yaml` when available.
- Use `bnm_output_folder` for durable novel artifacts.
- Read every referenced prompt/resource/example file before executing the workflow.
- Treat listed prompt files as ordered workflow steps, not optional background.
- For Chinese projects, apply `resources/shared-resources/chinese-output-policy.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/chinese-output-policy.md` when installed by a BMad module, or `../shared-resources/chinese-output-policy.md` from the module source.

# BNM Discover Novel Concept

## Metadata

- code: bnm-discover-novel-concept
- title: Discover Novel Concept
- description: Turns raw fiction ideas into a story brief, reader promise, and premise viability notes.

## Purpose

Help a writer move from raw inspiration to a usable fiction concept without forcing a full planning process.

## Roles Used

- Genre Strategist
- Premise Doctor
- Theme Critic
- Author Director

## Flow

1. Preserve the raw spark.
2. Identify likely genre promise.
3. Test story engine.
4. Identify thematic pressure if present.
5. Mark assumptions and approval points.
6. Produce story brief.

## Output

- Story brief
- Reader promise
- Central dramatic question
- Long-form viability risk
- Next best development path

## Gate

Do not recommend full outline until protagonist pressure, sustaining conflict, and reader promise exist.

