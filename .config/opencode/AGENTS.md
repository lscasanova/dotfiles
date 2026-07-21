# Global Development Best Practices

## Core Principles

- Read existing code before editing — understand imports, conventions, and already-used libraries
- Follow the project's existing patterns; do not introduce new libraries unless necessary
- Mimic code style, use existing utilities, and follow established patterns
- Prefer editing existing files over creating new ones
- Never assume a library is available — check package.json, requirements.txt, go.mod, Cargo.toml, etc.

## Pre-Edit Checklist

- Inspect neighboring files for conventions (same directory or similar components)
- Check the project manifest (package.json, pyproject.toml, go.mod, etc.) before using any library
- Look at existing tests to understand the testing framework and style
- For known libraries (React, Express, Django, etc.), verify the actual version used in the project

## MCP Context7 Usage (Up-to-Date Documentation)

- **Always** use Context7 before relying on internal knowledge about a library or framework
- Workflow: `resolve-library-id` → `query-docs`
- One query per concept — never combine multiple topics (e.g., auth + caching + routing)
- Maximum 3 Context7 calls per question
- Prefer Context7 documentation over outdated internal knowledge or guessing APIs
- Use the resolved library ID in the format `/org/project` or `/org/project/version`

## Post-Implementation Verification

- Run lint and typecheck (npm run lint, ruff, tsc, go vet, cargo check, etc.)
- Discover the test command from the project's README, Makefile, or scripts section
- Run tests after any code change
- If the project lacks an AGENTS.md, ask the user for the test/lint command and persist it there

## Git & Commits

- Only commit, amend, push, or create PRs when **explicitly requested**
- Before committing: inspect `git status`, `git diff`, and recent `git log`
- Stage only intended files; never commit secrets or credentials
- Write concise commit messages matching the repository's style
- Do not update git config, skip hooks, use `-i`, force-push, or create empty commits unless explicitly requested
- If a commit fails or hooks reject it, fix the issue and create a new commit (do not amend the failed commit)

## Security

- Never log, expose, or commit secrets, API keys, tokens, or passwords
- Never commit `.env` files or credential files
- Validate `.gitignore` before staging files
- Follow security best practices for the language/framework in use

## Testing

- Use the project's existing test framework — never switch to a different one
- New tests must follow the same patterns as existing tests
- Look at neighboring test files to determine naming conventions, setup patterns, and assertion styles
- Run the full test suite or the relevant subset before considering a task done

## Performance & Refactoring

- Do not pre-optimize — only optimize when a performance issue is identified
- Only refactor when explicitly requested
- Never break public APIs or contracts during refactoring
- Prefer clear, readable code over clever or overly abstract solutions

## Response Style

- Be concise, direct, and to the point — avoid preamble, postamble, or unnecessary explanation
- When referencing code, use the `file_path:line_number` format
- Do not add comments to code unless explicitly asked
- Avoid emojis unless the user requests them
- Answers should be as short as possible (1-3 sentences unless detail is requested)
