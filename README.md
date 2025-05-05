I'll update the README to highlight that you don't even need to install `just` thanks to uv's capabilities:

```markdown
# uv-version-bumper

A simple tool to automate Python project version bumping and git tagging using [uv](https://github.com/astral-sh/uv).

## Overview

This tool provides a streamlined workflow for:

1. Checking if your git repository is clean
2. Bumping your project version (major, minor, or patch)
3. Updating your dependency lock file
4. Committing changes
5. Creating git tags automatically

## Prerequisites

- [uv](https://github.com/astral-sh/uv) - The blazingly fast Python package installer and resolver
- Git

## Installation

1. Copy the `justfile` from this repository into your Python project root
2. No need to install `just` separately! You can run it directly with:
   ```bash
   uvx --from just-bin just
   ```

## Usage

```bash
# Run commands using uv to execute just
uvx --from just-bin just bump-patch   # Bump patch version (0.1.0 -> 0.1.1)
uvx --from just-bin just bump-minor   # Bump minor version (0.1.1 -> 0.2.0)
uvx --from just-bin just bump-major   # Bump major version (0.2.0 -> 1.0.0)
uvx --from just-bin just version      # Check current version
uvx --from just-bin just push-all     # Push commit and tag to remote
```

## How It Works

The workflow:

1. Verifies your git repository is clean (no uncommitted changes)
2. Records your current version
3. Bumps the version in pyproject.toml
4. Runs `uv sync` to update the lock file
5. Commits all changes in a single commit
6. Creates an annotated git tag

## Note on the Future

This tool exists to bridge a gap until uv implements its own task management system. The incredible team behind uv is working on a comprehensive task manager - when that's released, this justfile will no longer be needed, and we'll all benefit from uv's superior performance and integrated workflow. Thanks to uv's `uvx` command, you don't even need to install `just` separately - another example of how uv is streamlining Python developer workflows!

## License

MIT

## Contributing

Contributions welcome! Please feel free to submit a Pull Request.
