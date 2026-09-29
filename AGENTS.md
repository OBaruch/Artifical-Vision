# Contribution Rules

Guidelines for anyone — human or AI coding agent — working in this repository.

## What this repository is

A historical archive of MATLAB computer-vision coursework (circa 2018). The value is in preserving the original work as it was written. Start with [README.md](README.md) and [docs/project-context.md](docs/project-context.md).

## Hard rules

1. **`src/` is read-only.** Do not edit, reformat, re-encode, translate, rename, or delete any `.m` file. This includes whitespace, CRLF line endings, and the Latin‑1 encoding of some files.
2. **Do not fix bugs in place.** Record findings in [docs/possible-improvements.md](docs/possible-improvements.md) instead.
3. **Moving files is allowed only with `git mv`**, and only if the documentation (README structure tree, `docs/code-overview.md`) is updated in the same change.
4. **Do not invent context.** Label claims as Confirmed, Inferred, or Unknown, as in the existing docs.
5. **No new infrastructure** (CI, containers, package managers, linters, test frameworks) unless explicitly requested.
6. **Do not add line-ending or encoding rules** to `.gitattributes`; they would rewrite the original files.

## Workflow for changes

Follow the spec-driven flow in [`docs/sdlc/`](docs/sdlc/):

1. Update or add an **intent** (why) in [intent.md](docs/sdlc/intent.md).
2. Describe the expected result in [spec.md](docs/sdlc/spec.md).
3. Record steps and verification in [plan.md](docs/sdlc/plan.md).
4. Before opening a pull request, run the byte-integrity check from [plan.md § Verification](docs/sdlc/plan.md#verification) and confirm there is no content diff under `src/`:

   ```bash
   git diff --numstat -M origin/main | grep '\.m'   # each .m line must show 0 added, 0 deleted
   ```

## Writing style for docs

- English, concise, with relative links between Markdown files.
- Keep original Spanish identifiers as they are; add an English translation in parentheses when helpful.
