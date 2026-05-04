<h1 align="center">uv-version-bumper</h1>

<p align="center">
  <strong>Version bumping and git tagging for <a href="https://github.com/astral-sh/uv">uv</a>-managed Python projects.</strong><br>
  A single justfile. Drop it in, run <code>just bump-patch</code>.
</p>

<p align="center">
  <a href="https://alltuner.com/sponsor">Sponsor</a>
</p>

<p align="center">
  <img src="https://img.shields.io/github/license/alltuner/uv-version-bumper?color=5B2333" alt="License">
  <img src="https://img.shields.io/github/stars/alltuner/uv-version-bumper?color=5B2333" alt="Stars">
</p>

---

## Get Started

1. Copy the [`justfile`](justfile) from this repository into your Python project root.
2. Run any of the bump commands directly via `uvx`:

   ```bash
   uvx --from just-bin just bump-patch
   ```

No need to install `just` globally — `uvx` handles the binary on the fly.

---

## What is uv-version-bumper?

A small justfile that automates the boring half of releasing a Python project: bumping the version in `pyproject.toml`, refreshing the lockfile, committing, and tagging. It's intentionally minimal: no changelog generation, no release notes, no CI integration. If you need any of those, see [Other tools](#other-tools).

### Workflow

1. Verify the git repository is clean (no uncommitted changes).
2. Record the current version.
3. Bump the version in `pyproject.toml`.
4. Run `uv sync` to refresh the lockfile.
5. Commit the change and the lockfile in a single commit.
6. Create an annotated git tag.

## Usage

```bash
uvx --from just-bin just bump-patch   # 0.1.0 -> 0.1.1
uvx --from just-bin just bump-minor   # 0.1.1 -> 0.2.0
uvx --from just-bin just bump-major   # 0.2.0 -> 1.0.0
uvx --from just-bin just version      # Print the current version
uvx --from just-bin just push-all     # Push the bump commit and tag
```

## Requirements

- [uv](https://github.com/astral-sh/uv) ≥ [`0.7.0`](https://github.com/astral-sh/uv/releases/tag/0.7.0).
- Git.
- A `pyproject.toml` that uses the `[project] version` field.

## Other tools

If you need changelog generation, release notes, or CI/CD integration, look at:

- [python-semantic-release](https://github.com/python-semantic-release/python-semantic-release)
- [bump2version](https://github.com/c4urself/bump2version)
- [release-it](https://github.com/release-it/release-it)

## Future

uv [is tracking native task support](https://github.com/astral-sh/uv/issues/5903). Once that lands, this justfile becomes redundant; this README will be updated with the migration path.

## License

[MIT](LICENSE)

## Support the project

uv-version-bumper is an open source project built by [David Poblador i Garcia](https://davidpoblador.com/) through [All Tuner Labs](https://www.alltuner.com/).

If this project was useful to you, [consider supporting its development](https://alltuner.com/sponsor).

---

<p align="center">
  Built by <a href="https://davidpoblador.com">David Poblador i Garcia</a> with the support of <a href="https://alltuner.com">All Tuner Labs</a>.<br>
  Made with ❤️ in Poblenou, Barcelona.
</p>
