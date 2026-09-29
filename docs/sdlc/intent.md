# Intent

This document captures the **why** behind the repository. It is the first artifact of the spec-driven workflow used for this repository (`intent.md` → [`spec.md`](spec.md) → [`plan.md`](plan.md)). Because the project already exists, the intent is reconstructed from the code rather than written up-front, and each claim follows the Confirmed / Inferred / Unknown convention used in [project-context.md](../project-context.md).

## 1. Original project intent (reconstructed)

**Problem.** *Inferred.* Learn the foundations of computer vision by implementing classical image-processing algorithms, understanding them from the inside instead of treating toolbox functions as black boxes.

**Who it was for.** *Inferred.* The author, as a student, and the course instructor who reviewed the homework, in-class activities and final project.

**Desired outcomes.** *Inferred from the code produced.*

1. Being able to write 1‑D and 2‑D convolution by hand and use it for smoothing.
2. Understanding enhancement, noise removal and histograms (including equalization) numerically.
3. Deriving edges from discrete derivatives and gradients, up to a complete Canny implementation.
4. Detecting corners (Harris) and lines (Hough).
5. Working with real input: a webcam and feature correspondence between frames.
6. Delivering a small interactive application (GUI) that applies selected algorithms to any image.

**Constraints.** *Confirmed / Inferred.*

- MATLAB with the Image Processing, Computer Vision, Image Acquisition and Symbolic Math toolboxes (Confirmed from function calls).
- Windows workstation with a webcam using the `winvideo` adaptor (Inferred).
- Coursework time frame around 2018 (GUI timestamp Confirmed; the rest Inferred).

**Non-goals.** *Inferred.* Production quality, performance, reusability as a library, or automated testing were not goals of the original work.

## 2. Intent of the repository restructuring

**Problem.** The repository was a flat dump of 55 `.m` files with Spanish names, no README and no explanation, which made it hard for a reader (for example, someone reviewing a portfolio) to understand what it contains or why.

**Outcome wanted.**

- A reader understands what the project is, where it came from and what each file does within a few minutes.
- The repository shows the original work honestly: same code, same comments, same mistakes.
- Facts, inferences and unknowns are clearly separated.

**Hard constraints.**

- `src/` content must stay **byte-for-byte identical** to the original upload (no edits, reformatting, re-encoding or line-ending changes).
- File names must not change (MATLAB resolves functions by file name).
- No new infrastructure: no CI, containers, package managers, linters or test frameworks.
- Do not invent context (university, course, dates, requirements) that the repository does not support.

**Non-goals.**

- Fixing bugs, completing unfinished algorithms, or recreating missing assets (`Proyecto.fig`, input images, `conv2d.m`).
- Translating the code or its comments.

## 3. Success criteria

| ID | Criterion | Verification |
|---|---|---|
| I‑1 | Every original file is present, unchanged | Git blob hashes before and after are identical (see [plan.md](plan.md#verification)) |
| I‑2 | Repository has a README explaining project, context, structure, technologies and limitations | Review of [README.md](../../README.md) |
| I‑3 | Each source file is described | [code-overview.md](../code-overview.md) covers all 55 files |
| I‑4 | Observed defects are documented, not fixed | [possible-improvements.md](../possible-improvements.md) |
| I‑5 | Inferences are labelled as such | Confirmed/Inferred/Unknown tags in the docs |
