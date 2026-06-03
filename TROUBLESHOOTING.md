# BNM Module Troubleshooting

## Installer Does Not Find The Module

Check:

- The `--custom-source` path points to `./bnm-module-draft` or an absolute path. A bare `bnm-module-draft` value can be rejected by BMad 6.8.0 as "Not a valid Git URL or local path".
- `bnm-setup/assets/module.yaml` exists.
- `bnm-setup/assets/module-help.csv` exists.
- `.claude-plugin/marketplace.json` exists if using discovery mode.

Run:

```bash
ruby scripts/validate_module.rb
```

## Commands Do Not Appear

Check:

- Command exists in `bnm-setup/assets/module-help.csv`.
- Matching folder exists in the module root.
- Matching folder has `SKILL.md`.

## `bnm-setup` Appears In Skills After Update

This usually means an older experimental `bnm` module was preserved by the BMad installer during update. It does not block the callable BNM writing skills, but it pollutes the user menu.

Use a clean project for release validation, or remove the stale preserved module through the BMad-supported uninstall/update path before reinstalling the current package.

## Conductor Gives Generic Writing Advice

Check:

- `bnm-novel-conductor/resources/routing-matrix.md` exists.
- `bnm-novel-conductor/resources/routing-test-policy.md` exists.
- `shared-resources/chinese-output-policy.md` exists for Chinese projects.
- User request is being routed through `bnm-novel-conductor`, not a generic assistant prompt.

## Output Sounds Like AI

Use:

- `shared-resources/anti-ai-prose-rules.md`
- `shared-resources/anti-ai-prose-checklist.md`
- `bnm-style-guardian`
- `bnm-dialogue-editor`

Hard rule:

If the failure is structural, do not line-edit first.

## Continuity Breaks

Use:

- `bnm-continuity-audit`
- `shared-resources/templates/continuity-ledger-template.md`

Check whether new facts were marked:

- approved canon
- working assumption
- requires author decision
- rejected
