# BNM Module Draft

This folder is the installable-module draft for BMad Novel Method.

It contains:

- `bnm-setup`: module registration assets
- `bnm-novel-conductor`: primary user entry point
- specialist agent skills
- workflow skills
- `.claude-plugin/marketplace.json`: discovery manifest
- `scripts/validate_module.rb`: local structure validator

## Local Validation

```bash
ruby scripts/validate_module.rb
```

Expected:

```text
BNM module draft validation passed
registered skills: 24
```

The setup skill is not counted as a registered user command by the validator, so the folder has 25 `SKILL.md` files and 24 registered callable skills.

## Intended Install Path

When tested against a real BMad installation:

```bash
npx bmad-method install --directory . --custom-source /absolute/path/to/bnm-module-draft --tools claude-code --yes
```

If installing from the parent directory, use `./bnm-module-draft`; do not use bare `bnm-module-draft`, which BMad 6.8.0 can reject as an invalid source path.

## Current Status

This is a module draft, not a final published module. It has local structural validation, YAML validation, CSV validation, marketplace-manifest validation, and live installer validation against BMad 6.8.0 in this workspace.

Installer behavior: `bnm-setup` must remain listed in `.claude-plugin/marketplace.json` so BMad chooses the setup-skill strategy and installs the module as `bnm`. Because `bnm-setup/SKILL.md` has no YAML frontmatter, it is not exposed as a callable user skill.

See `INSTALL_VALIDATION.md` for the exact live validation procedure and approval boundary.
