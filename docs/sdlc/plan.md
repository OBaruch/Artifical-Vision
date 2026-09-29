# Plan

This document describes **how** the specification in [spec.md](spec.md) was realized. It has two parts:

1. The original implementation plan, reconstructed from the order and dependencies of the code (*Inferred*).
2. The plan executed for the repository restructuring (*Confirmed*), including how it was verified.

## Part 1 — Original implementation plan (reconstructed)

The code suggests the work progressed in the following phases. The ordering is inferred from topic difficulty and from dependencies between files; the repository does not contain dates per file.

| Phase | Focus | Representative files | Builds on |
|---|---|---|---|
| 0 | MATLAB basics: input, plotting, loops, recursion, vectors | `mini-problems/*`, `matlab-fundamentals/*` | — |
| 1 | 1‑D signals: convolution, correlation, alignment | `conv1d`, `corr1d`, `ejempCorr` | 0 |
| 2 | 2‑D convolution and smoothing | `conv2dz`, `conv2dm`, `AplicarFiltroGrises`, `AplicarFiltrosColor`, `Reducir_imagen` | 1 |
| 3 | Enhancement and noise | `bordesGrises`, `bordesColor`, `RealzeGrises`, `RealzeColor`, `filtroMediana`, `mask` | 2 |
| 4 | Histograms and equalization | `HistogramaFrecuenciaAcumulada`, `histograma*` | 0 |
| 5 | Derivatives and gradients | `DerivadasDeVectoresDiscretos`, `DerivadasDeMatrizesDiscretas`, `derivadaImagen`, `magnitudGradiente`, `orientacionGradiente`, `deteccionDeBordes` | 2 |
| 6 | Canny | `algoritmoCanny`, `supresionNoMaximos`, `filtradoHisteresis` | 5 |
| 7 | Corners | `DetecciondeEsquinas` (toolbox + first manual attempt), `algoritmoHarris` | 5 |
| 8 | Lines | `Hough` (manual, unfinished), `CanyHoughLIneas` (toolbox) | 6 |
| 9 | Applied work: chroma key, camera, matching | `pantallaVerde`, `ConfigurarLaCamara_`, `Correspondencia` | 3, 7 |
| 10 | Course project GUI | `Proyecto` | 3, 6 |

A recurring pattern appears in several phases: first implement the algorithm manually with loops, then compare with the toolbox function (`conv2dm` vs `imfilter`, `algoritmoCanny` vs `edge(...,'canny')`, `algoritmoHarris` vs `corner`, `Hough` vs `hough`).

## Part 2 — Repository restructuring plan (executed)

### Guiding principle

Modernize the repository, not the project: change the organization and documentation, never the code.

### Steps

| # | Step | Result |
|---|---|---|
| 1 | Inventory every file; read all code, comments, the GUIDE header, `LICENSE` and git history | 55 `.m` files + `LICENSE`; no documents, images or data found |
| 2 | Classify origin with evidence | Coursework / Assignment (Inferred) — see [project-context.md](../project-context.md) |
| 3 | Record blob hashes of every original file | Baseline for verification |
| 4 | Group files by topic with `git mv` (history preserved, names unchanged) | `src/image-processing/<topic>/`, `src/gui/`, `src/matlab-fundamentals/`, `src/mini-problems/` |
| 5 | Write `README.md` | Overview, context, structure, technologies, running notes, historical note |
| 6 | Write `docs/project-context.md`, `docs/code-overview.md`, `docs/possible-improvements.md` | Context, per-file docs, issues (not applied) |
| 7 | Write `docs/sdlc/intent.md`, `spec.md`, `plan.md` | This set of documents |
| 8 | Add `AGENTS.md`, `.gitignore`, `.gitattributes` | Contribution rules; ignore generated `newImage*.jpg` and MATLAB temp files; MATLAB language detection on GitHub |
| 9 | Verify (below) and open a pull request | — |

### Decisions

| Decision | Rationale |
|---|---|
| Keep original file names (Spanish, typos, spaces) | MATLAB calls functions by file name; renaming would change behaviour and history |
| Topic folders instead of a flat `src/` | 55 files are easier to navigate by subject; still no artificial layers |
| No `data/`, `assets/` or `docs/original/` folders | The repository contains no data, images or original documents |
| No `architecture.md` | The project is a set of independent exercises; the dependency map in [code-overview.md](../code-overview.md#dependency-map) is sufficient |
| No `assignment.md` | No assignment statement exists in the repository |
| `.gitattributes` sets only `linguist-language` | Avoids any line-ending normalization that could alter the original bytes |
| Recommend `addpath(genpath('src/image-processing'))` | Restores helper lookup after moving files, without shadowing built-ins with `union.m` / `factorial.m` |

### Verification

1. **Byte integrity.** The sorted list of Git blob hashes of all `.m` files before the change equals the list after the change (paths differ, hashes do not):

   ```bash
   git ls-tree -r <original-commit> | grep '\.m$' | awk '{print $3}' | sort > before
   git ls-tree -r HEAD              | grep '\.m$' | awk '{print $3}' | sort > after
   diff before after   # no output
   ```

2. **Completeness.** 55 `.m` files before and after; every one is listed in [code-overview.md](../code-overview.md).
3. **Links.** All relative Markdown links resolve to existing files.
4. **No code diff.** `git diff --numstat -M <original-commit> HEAD` reports `0 0` for every `.m` file (renames only).

### Out of scope / follow-ups

Any item in [possible-improvements.md](../possible-improvements.md) would be a separate change with its own intent/spec/plan, and should be done on a copy or a clearly labelled branch so the historical version stays intact.
