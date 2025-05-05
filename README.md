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

- [uv](https://github.com/astral-sh/uv) - The blazingly fast Python package installer and resolver (minimum version [`0.7.0`](https://github.com/astral-sh/uv/releases/tag/0.7.0))
- Git
- A relatively modern Python project with a `pyproject.toml` file that uses its `version` configuration option to store the project version

## Installation

1. Copy the `justfile` from this repository into your Python project root
2. No need to install `just` separately! Thanks to the magic of `uv`, you can run it directly with:

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

This tool exists to bridge a gap until uv implements its own task management system. The incredible team behind uv [is working on a comprehensive task manager](https://github.com/astral-sh/uv/issues/5903) - when that's released, this justfile will no longer be needed, and we'll all benefit from uv's superior performance and integrated workflow. Thanks to uv's `uvx` command, you don't even need to install `just` separately - another example of how uv is streamlining Python developer workflows!

## Additional Notes

### Simplicity by Design

This tool is intentionally dead simple, focusing only on version bumping and git tagging. Users needing more advanced release management with features like changelog generation, release notes, or complex CI/CD integration should consider other existing tools such as:

- [Python-Semantic-Release](https://github.com/python-semantic-release/python-semantic-release)
- [Bump2Version](https://github.com/c4urself/bump2version)
- [Release-It](https://github.com/release-it/release-it)

### Future uv Task Management

When uv's task management system is implemented, this project will be updated with instructions on how to migrate from the justfile approach to native uv tasks. Stay tuned for updates!

## License

MIT

## Contributing

Contributions welcome! Please feel free to submit a Pull Request.
