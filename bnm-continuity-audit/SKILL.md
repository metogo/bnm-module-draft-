---
name: bnm-continuity-audit
description: Detect contradictions canon drift timeline errors reveal order problems and missing payoffs.
---

## BNM Runtime Contract

Before doing task work, read `resources/shared-resources/runtime-contract.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/runtime-contract.md` when installed by a BMad module, or `../shared-resources/runtime-contract.md` when running from the module source, and follow it. In particular:

- Load `{project-root}/_bmad/bnm/config.yaml` when available.
- Use `bnm_output_folder` for durable novel artifacts.
- Read every referenced prompt/resource/example file before executing the workflow.
- Treat listed prompt files as ordered workflow steps, not optional background.
- For Chinese projects, apply `resources/shared-resources/chinese-output-policy.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/chinese-output-policy.md` when installed by a BMad module, or `../shared-resources/chinese-output-policy.md` from the module source.

# BNM Continuity Audit

## Metadata

- code: bnm-continuity-audit
- title: Continuity Audit
- description: Detects contradictions, canon drift, timeline errors, reveal-order problems, and missing payoffs.

## Purpose

Protect long-form reader trust by checking accumulated facts against project canon.

## Roles Used

- Continuity Editor
- Story Architect
- Character Architect
- Worldbuilding Editor

## Flow

1. Extract facts from target manuscript range.
2. Compare against canon.
3. Check character knowledge boundaries.
4. Check timeline, injuries, objects, locations, and relationships.
5. Check foreshadowing and reveal obligations.
6. Rank contradictions by severity.

## Output

- Contradiction report
- Continuity ledger update
- Foreshadowing-register update

## Severity

- S1: breaks story logic or reader trust
- S2: visible contradiction
- S3: minor inconsistency
- S4: cleanup or style consistency

