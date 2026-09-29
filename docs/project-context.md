# Project Context

This document reconstructs the origin and purpose of the project from the evidence available in the repository. Each statement is tagged:

- **Confirmed** — directly supported by a file, comment, or commit.
- **Inferred** — a reasonable deduction from the available material, not proven.
- **Unknown** — the repository does not provide enough information to determine this.

## Sources examined

The original repository contained only:

- 55 MATLAB `.m` files (41 in the root, 14 in `Mini Problems/`)
- `LICENSE` (MIT, © 2021 Baruch Lopez)

There were **no** PDF, Word, PowerPoint, image, dataset, notebook, `.fig`, `.mat`, or README files. All context therefore comes from code, comments, file names, the GUIDE header, and git metadata.

## Classification

**Project origin: Coursework / Assignment (Academic)** — *Inferred, high confidence.*

| Evidence | Where | What it suggests |
|---|---|---|
| File name `Tarea 1.m` ("Homework 1") | `src/mini-problems/` | Graded homework |
| Comment `%asunto: codigo Tarea 1` ("subject: Homework 1 code") and `%2 PDF` | `src/mini-problems/T1.m` | The code was submitted (likely by e-mail) together with a PDF |
| File name `actividad en calase factorial.m` ("in-class activity") | `src/mini-problems/` | Exercise done during a class session |
| GUI named `Proyecto` ("Project") with three selectable algorithms | `src/gui/Proyecto.m` | Course project / final project |
| `alumnos.m` counts students who pass with a grade `> 59` | `src/matlab-fundamentals/` | Classic introductory programming exercise (0–100 grading scale) |
| Topic sequence: MATLAB basics → convolution → filters → histograms → derivatives → edges → Canny → Harris → Hough → camera & matching | Whole repository | Mirrors a typical introductory computer-vision syllabus |
| Repository name `Artifical-Vision` (sic) | GitHub | Likely a translation of the Spanish course name *Visión Artificial* |

## Timeline

| Date | Event | Status |
|---|---|---|
| ≤ 16‑Nov‑2018 00:36 | `Proyecto.m` last modified by GUIDE v2.5 | Confirmed (file header) |
| 2018 (approx.) | Development of the rest of the exercises | Inferred (same collection; exact dates unknown) |
| 20‑Feb‑2021 | Repository created (`Initial commit`) and all files uploaded via the GitHub web UI (`Add files via upload`) | Confirmed (git history) |
| Later | Repository reorganized and documented; source files moved but not modified | Confirmed (this change) |

## What is known

| Topic | Value | Status |
|---|---|---|
| Author | Baruch Lopez | Confirmed |
| Language | MATLAB | Confirmed |
| Natural language of identifiers/comments | Spanish | Confirmed |
| Platform used | Windows (the `winvideo` camera adaptor, CRLF line endings, Windows‑1252 encoding) | Inferred |
| Subject | Artificial / computer vision and digital image processing | Inferred |
| Level | Introductory undergraduate course | Inferred |
| University, course code, instructor, semester | — | Unknown |
| Original assignment statements and grading criteria | — | Unknown (not included) |
| Input images used | File names are known from the code (see [code-overview.md](code-overview.md#input-files-referenced-by-the-code)); the images themselves are missing | Confirmed (names) / Unknown (content) |
| Layout of the GUI (`Proyecto.fig`) | Only component tags are known: `axes3`, `axes4`, `pushbutton1`, `pushbutton2`, `popupmenu1`, `edit1`, `uibuttongroup1`, `radiobutton1..3` | Confirmed (tags) / Unknown (labels, layout) |
| Author of `supresionNoMaximos.m` | Its style (spaces around `=`, `elseif`, different variable naming) differs from the rest; may have come from class material or a teammate | Inferred, low confidence |

## Scope of the project

The collection covers, in roughly increasing difficulty:

1. **MATLAB fundamentals** — input/output, plotting (2‑D and 3‑D), loops, recursion, vectors, simple set operations, series, linear systems.
2. **1‑D signal operations** — convolution, correlation, and signal alignment by maximum correlation.
3. **2‑D filtering** — hand-written zero-padded convolution, binomial/Gaussian smoothing kernels, median filtering of salt-and-pepper noise, downsampling.
4. **Enhancement** — edge extraction by subtracting a smoothed image and sharpening by adding amplified edges back (unsharp masking), for grayscale and RGB.
5. **Histograms** — histogram, normalized histogram, cumulative frequency, histogram equalization (manual and on a toy 4×4 matrix).
6. **Derivatives and edges** — forward, backward and central discrete differences (1‑D and 2‑D), Sobel/Prewitt gradients, toolbox edge detectors combined.
7. **Canny** — complete manual pipeline: Sobel gradients, magnitude, orientation quantized to 0/45/90/135°, non‑maximum suppression, double threshold with hysteresis.
8. **Harris** — manual corner response `R = det(H) − k·trace(H)²` with Gaussian window, local-maximum suppression and threshold.
9. **Hough** — an incomplete manual accumulator plus a full toolbox-based line detection demo.
10. **Chroma key** — green-screen removal by thresholding the green channel.
11. **Live camera** — webcam configuration and Harris feature matching between two snapshots.
12. **GUI** — GUIDE application to load an image, apply one of three algorithms, and save the result.

## Contradictions and ambiguities

- `conv2dm.m` declares `function [ImC]=conv2dz(Im,h)`, i.e. its internal name is `conv2dz`, while the file is `conv2dm.m`. MATLAB calls it as `conv2dm` (the file name wins), and `conv2dz.m` is a separate file with the same body but two outputs. Which one was the "final" version cannot be determined.
- Four scripts call `conv2d(...)`, but no `conv2d.m` exists. It may have been an earlier name of `conv2dm`/`conv2dz` or a file that was not uploaded. Unknown.
- `corr1d.m` is named "correlation" but its `fliplr(h);` result is discarded, so it computes the same thing as `conv1d.m`. Whether this was intended cannot be confirmed.

See [possible-improvements.md](possible-improvements.md) for the full list of observed issues.
