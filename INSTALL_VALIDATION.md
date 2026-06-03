# Install Validation Plan

This module draft has local structural validation. Live BMad CLI validation still requires explicit user approval because `npx bmad-method` may fetch and execute an npm package from the network.

## Already Verified Locally

```bash
ruby scripts/validate_module.rb
```

Expected:

```text
BNM module draft validation passed
registered skills: 24
```

This proves:

- `module.yaml` parses as YAML.
- `module-help.csv` parses as strict CSV.
- Every registered command has a matching skill directory.
- Every skill directory has `SKILL.md`.
- `.claude-plugin/marketplace.json` parses as JSON.
- Marketplace skills match local skill directories.

## Live CLI Validation

Only run after explicit approval:

```bash
npx bmad-method --version
```

Then:

```bash
npx bmad-method install --directory . --custom-source /absolute/path/to/bnm-module-draft --tools claude-code --yes
```

## What Live Validation Must Prove

- BMad installer can discover the local custom source.
- BMad installer accepts the setup skill and module assets.
- The command list exposes `bnm-novel-conductor`.
- Specialist skills can be selected or installed.
- Generated files land in the expected BMad target directory.

## Known Risk

The exact live installer schema may require small adjustments after the first install attempt. That is expected for a module draft built without running the installer.
