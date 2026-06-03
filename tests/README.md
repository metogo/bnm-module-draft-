# BNM Routing Tests

These cases verify the core product promise:

The user should not need to know BNM's internal roles or workflows. A natural-language request must route to the correct intent layers, commands, specialist roles, and durable artifacts.

## File

- `routing-cases.json`

## What Is Tested

- Every expected command exists in the module draft.
- Every expected role exists in the module draft.
- Each case has user request, mode, intent layers, expected commands, expected roles, expected artifacts, and forbidden behaviors.

## Why This Matters

Without routing tests, BNM can look professional on paper while behaving like a generic writing chatbot. These cases make the conductor's promise inspectable.

