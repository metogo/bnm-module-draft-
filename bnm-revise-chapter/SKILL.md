---
name: bnm-revise-chapter
description: Diagnose an existing chapter at the correct layer before rewriting or polishing.
---

## BNM Runtime Contract

Before doing task work, read `resources/shared-resources/runtime-contract.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/runtime-contract.md` when installed by a BMad module, or `../shared-resources/runtime-contract.md` when running from the module source, and follow it. In particular:

- Load `{project-root}/_bmad/bnm/config.yaml` when available.
- Use `bnm_output_folder` for durable novel artifacts.
- Read every referenced prompt/resource/example file before executing the workflow.
- Treat listed prompt files as ordered workflow steps, not optional background.
- For Chinese projects, apply `resources/shared-resources/chinese-output-policy.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/chinese-output-policy.md` when installed by a BMad module, or `../shared-resources/chinese-output-policy.md` from the module source.

# BNM Revise Chapter

## Metadata

- code: bnm-revise-chapter
- title: Revise Chapter
- description: Diagnoses an existing chapter at the correct layer before rewriting or polishing.

## Purpose

Improve a chapter without mistaking line polish for structural repair.

## Roles Used

- Developmental Editor
- Pacing Doctor
- Character Architect
- Dialogue Editor
- Style Guardian
- Continuity Editor

## Flow

1. Identify failure layer.
2. State reader-facing impact.
3. Recommend keep, cut, merge, reorder, rewrite, or line edit.
4. Apply revision at the correct layer.
5. Register continuity changes if any.

## Output

- Chapter diagnosis
- Rewrite plan
- Revised passage or targeted notes

## Gate

Do not line-edit a chapter whose scene purpose is broken unless the user explicitly asks for surface cleanup.

