---
name: bnm-validate-premise
description: Stress test whether a premise can sustain a novel novella series or short story.
---

## BNM Runtime Contract

Before doing task work, read `resources/shared-resources/runtime-contract.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/runtime-contract.md` when installed by a BMad module, or `../shared-resources/runtime-contract.md` when running from the module source, and follow it. In particular:

- Load `{project-root}/_bmad/bnm/config.yaml` when available.
- Use `bnm_output_folder` for durable novel artifacts.
- Read every referenced prompt/resource/example file before executing the workflow.
- Treat listed prompt files as ordered workflow steps, not optional background.
- For Chinese projects, apply `resources/shared-resources/chinese-output-policy.md` when bundled with the skill, `{project-root}/_bmad/bnm/shared-resources/chinese-output-policy.md` when installed by a BMad module, or `../shared-resources/chinese-output-policy.md` from the module source.

# BNM Validate Premise

## Metadata

- code: bnm-validate-premise
- title: Validate Premise
- description: Stress-tests whether a premise can sustain a novel, novella, series, or short story.

## Purpose

Separate a strong story engine from a mood, setting, or cool fragment.

## Roles Used

- Premise Doctor
- Genre Strategist
- Story Architect
- Author Director

## Flow

1. Identify protagonist, pressure, obstacle, stakes, and cost.
2. Separate aesthetic from engine.
3. Test escalation capacity.
4. Check genre promise.
5. Recommend proceed, reframe, shrink, expand, or abandon.

## Output

- Premise diagnosis
- Story engine
- Central dramatic question
- Viability recommendation

## Gate

Fail the premise if the protagonist can walk away without cost or the conflict needs arbitrary new events to continue.

