# BNM Runtime Contract

Every callable BNM skill must follow this contract.

## 1. Load BNM Config

Before doing task work, read `{project-root}/_bmad/bnm/config.yaml` when it exists.

Resolve:

- `bnm_output_folder`
- `bnm_default_language`
- `bnm_default_mode`
- `communication_language`
- `document_output_language`

If the config file is unavailable, use:

- `bnm_output_folder`: `{project-root}/docs/novel`
- `bnm_default_language`: `Chinese`
- `bnm_default_mode`: `professional`

## 2. Use BNM Output Folder

All durable fiction artifacts should be written or recommended under `bnm_output_folder`, not generic `{output_folder}/novel`.

Use:

- `{bnm_output_folder}` for bibles and core artifacts
- `{bnm_output_folder}/chapters` for chapter briefs and drafts
- `{bnm_output_folder}/reviews` for audits and revision reports

## 3. Load Referenced Resources

Before executing a workflow, read every referenced file under:

- `prompts/`
- `resources/`
- `examples/`
- `resources/shared-resources/` when bundled inside an installed skill
- `{project-root}/_bmad/bnm/shared-resources/` when installed as a BMad module
- `../shared-resources/` when running directly from the module source

When a skill lists prompt files, read them in the listed order and execute them as workflow steps, not optional background material.

## 4. Respect Chinese Defaults

If `bnm_default_language` is Chinese, manuscript-facing output should follow `resources/shared-resources/chinese-output-policy.md` when bundled inside an installed skill, `{project-root}/_bmad/bnm/shared-resources/chinese-output-policy.md` when installed as a BMad module, or `../shared-resources/chinese-output-policy.md` from the module source.

## 5. Preserve Canon Status

Mark durable story facts as:

- approved canon
- working assumption
- requires author decision
- rejected
