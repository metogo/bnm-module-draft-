# Routing Test Policy

Use `tests/routing-cases.json` as executable design evidence for the conductor.

## Required Behavior

For each user request:

1. Identify intent layers.
2. Select mode.
3. Select commands and specialist roles.
4. Identify expected artifacts.
5. Identify forbidden shortcuts.

## Forbidden Shortcuts

- Asking the user to select an agent.
- Drafting without a chapter purpose.
- Rewriting style when the failure is structural.
- Treating worldbuilding as plot.
- Treating character adjectives as character design.
- Inventing canon silently.

## Interpretation

The conductor is allowed to choose fewer roles for fast mode, but it must preserve the reason for the route. If it skips a role, it should not skip the role's responsibility.

