---
name: bnm-build-story-bible
description: Create the central control document for the novel promise conflict theme and constraints.
---

## BNM Runtime Contract

Before doing task work, read `resources/shared-resources/runtime-contract.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/runtime-contract.md` when installed by a BMad module, or `../shared-resources/runtime-contract.md` when running from the module source, and follow it. In particular:

- Load `{project-root}/_bmad/bnm/config.yaml` when available.
- Use `bnm_output_folder` for durable novel artifacts.
- Read every referenced prompt/resource/example file before executing the workflow.
- Treat listed prompt files as ordered workflow steps, not optional background.
- For Chinese projects, apply `resources/shared-resources/chinese-output-policy.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/chinese-output-policy.md` when installed by a BMad module, or `../shared-resources/chinese-output-policy.md` from the module source.

# BNM Build Story Bible

## Metadata

- code: bnm-build-story-bible
- title: Build Story Bible
- description: Creates the central control document for the novel's promise, conflict, theme, and constraints.

## Purpose

Create an operational story bible that future chapters can rely on.

## Roles Used

- Author Director
- Genre Strategist
- Premise Doctor
- Story Architect
- Theme Critic

## Flow

1. Confirm author intent.
2. Define reader promise.
3. Define protagonist pressure and antagonistic force.
4. Define central dramatic question.
5. Define theme as dramatic pressure.
6. Record open decisions separately from approved canon.

## Output

- Story bible
- Open decision list
- Approved constraints

## Gate

The story bible is not valid if it contains attractive language but no operational constraints.

