# Artificial Vision — MATLAB Coursework Collection

A collection of MATLAB scripts and functions exploring the fundamentals of **computer vision / digital image processing**: convolution, smoothing filters, image enhancement, histograms and equalization, discrete derivatives, edge detection (including a hand-written **Canny** detector), corner detection (hand-written **Harris** detector), the **Hough** transform, chroma-key background removal, webcam capture with feature matching, and a small **GUIDE-based GUI** that applies filters to an image.

> **Original implementation.** This repository preserves the original implementation of the project. The source code has intentionally not been refactored or modernized in order to retain the historical context and original development approach. All `.m` files are byte-for-byte identical to the versions first uploaded in February 2021; only their location in the repository changed.

---

## Project Context

| Item | Value | Status |
|---|---|---|
| Project origin | **Coursework / Assignment** (academic) | Inferred |
| Subject area | Artificial / computer vision, image processing ("Visión Artificial") | Inferred from repository name and content |
| Language of code and comments | Spanish | Confirmed |
| Development period | Around 2018 (GUI last modified by GUIDE on 16‑Nov‑2018); uploaded to GitHub on 20‑Feb‑2021 | Confirmed (dates) |
| Author | Baruch Lopez | Confirmed (`LICENSE`, commit history) |
| University / course name / instructor | — | Unknown |

The academic classification is based on evidence inside the code: files named `Tarea 1.m` ("Homework 1") and `actividad en calase factorial.m` ("in‑class activity"), a comment in `T1.m` reading `asunto: codigo Tarea 1` ("subject: Homework 1 code") and `2 PDF` (suggesting a deliverable format), a final‑project style GUI named `Proyecto.m` ("Project"), and a progression of topics that follows a typical introductory computer‑vision syllabus. No assignment statements, reports or PDFs are included in the repository, so the exact course and requirements cannot be confirmed. See [docs/project-context.md](docs/project-context.md).

The source code represents the original implementation developed during my studies; the specific institution and course are not recorded in the repository.

## Problem Statement

*Inferred.* The files are learning exercises: each one implements or demonstrates a classical image‑processing technique, often twice — once "by hand" with explicit loops (to understand the algorithm) and once with the corresponding MATLAB toolbox function (to compare results).

## Objective

*Inferred.* To practise and understand, through implementation, the core building blocks of computer vision:

1. Linear filtering and 2‑D convolution.
2. Image enhancement (unsharp masking) and noise removal.
3. Intensity histograms, normalization, cumulative frequency and equalization.
4. Discrete derivatives, image gradients, and edge detection.
5. Canny edge detection, Harris corner detection and the Hough transform.
6. Working with a live camera and feature correspondence between images.
7. Packaging image operations in a simple graphical interface.

## Repository Structure

```
.
├── README.md
├── AGENTS.md                         # Rules for anyone (human or AI) changing this repo
├── LICENSE                           # MIT, © 2021 Baruch Lopez (original)
├── docs/
│   ├── project-context.md            # Origin, evidence, timeline, scope
│   ├── code-overview.md              # File-by-file description and dependency map
│   ├── possible-improvements.md      # Observed issues & ideas — NOT applied
│   └── sdlc/
│       ├── intent.md                 # Why this project (and this restructuring) exists
│       ├── spec.md                   # As-built specification of the original code
│       └── plan.md                   # Reconstructed implementation + restructuring plan
└── src/                              # Original MATLAB code (unchanged)
    ├── image-processing/
    │   ├── filtering/                # 2-D convolution, smoothing, median filter, downsampling
    │   ├── enhancement/              # Unsharp-mask style sharpening (gray & color)
    │   ├── histograms/               # Histogram, normalized, cumulative, equalized
    │   ├── derivatives-and-edges/    # Discrete derivatives, Sobel gradient, edge maps
    │   ├── canny/                    # Hand-written Canny detector and its stages
    │   ├── corners/                  # Hand-written Harris detector, toolbox corner()
    │   ├── hough/                    # Hough transform (manual attempt + toolbox)
    │   ├── segmentation/             # Green-screen (chroma key) removal
    │   └── camera-and-matching/      # Webcam setup and Harris feature matching
    ├── gui/                          # GUIDE application Proyecto.m
    ├── matlab-fundamentals/          # General MATLAB exercises (vectors, series, sets)
    └── mini-problems/                # Early short exercises (formerly "Mini Problems/")
```

File names were **not** changed: in MATLAB a function file name is how the function is called, so renaming would alter behaviour. Only the folders were reorganized by topic.

## Technologies

Identified from the function calls in the code:

| Technology | Used for | Evidence |
|---|---|---|
| **MATLAB** | Everything | `.m` files |
| Image Processing Toolbox | `imfilter`, `edge`, `imgaussfilt`, `medfilt2`, `imnoise`, `rgb2gray`, `imshowpair`, `corner`, `hough`, `houghpeaks`, `houghlines` | Multiple scripts |
| Computer Vision Toolbox | `detectHarrisFeatures`, `extractFeatures`, `matchFeatures`, `showMatchedFeatures` | `Correspondencia.m` |
| Image Acquisition Toolbox (`winvideo` adaptor, Windows) | `imaqhwinfo`, `videoinput`, `preview`, `getsnapshot` | `ConfigurarLaCamara_.m`, `Correspondencia.m` |
| Symbolic Math Toolbox | `vpa` | `ecm.m` |
| GUIDE (GUI Development Environment) v2.5 | `Proyecto.m` | File header |

The exact MATLAB release used is **unknown**. Two files (`fib.m`, `factorial.m`) define local functions inside scripts, which requires MATLAB R2016b or later.

## How It Works

Most files are **standalone scripts** that follow the same pattern: `clear`/`clc`, load an image with `imread`, convert to grayscale, apply a filter or algorithm, and display the result with `imshow` (sometimes also saving `newImage.jpg`). A smaller set of files are **reusable functions** called by those scripts or from the command window:

- `conv2dm` / `conv2dz` — manual 2‑D convolution with zero padding (used by `AplicarFiltroGrises.m`).
- `derivadaImagen`, `magnitudGradiente`, `orientacionGradiente`, `supresionNoMaximos`, `filtradoHisteresis` — the individual stages of the Canny detector, also implemented inline in `algoritmoCanny.m`.
- `histograma`, `histogramanormalizado`, `histogramaecualizado` — histogram computation and plotting.

The GUI (`src/gui/Proyecto.m`) lets the user load an image, pick one of three operations with radio buttons (Canny edges, a custom 3×3 smoothing filter, or Gaussian‑based sharpening), and save the result.

A full description of every file, including the dependency map, is in [docs/code-overview.md](docs/code-overview.md).

## Inputs and Outputs

**Inputs (not included in the repository).** The scripts read these images from the current folder; none of them were uploaded, so they are **missing**:

`Capture.JPG`, `Capture2.JPG`, `Capture3.JPG`, `Capture.PNG`, `KDGf2Nkg.png`, `clonetrooper.jpg`, `chess.png`, `negra.png` (and the commented‑out `fondo.jpg`).

`Proyecto.m` also needs its companion layout file **`Proyecto.fig`**, which was not uploaded either.

**Outputs.** Results are shown in figure windows. Some scripts write `newImage.jpg` or `newImage2.jpg` to the working folder; these are ignored by `.gitignore`.

## Running the Project

Only what can be determined reliably from the code:

1. Open MATLAB with the Image Processing Toolbox (plus the other toolboxes listed above for the specific scripts that need them).
2. Make the helper functions visible, e.g. from the repository root:
   ```matlab
   addpath(genpath('src/image-processing'))
   ```
   Originally all files lived in one folder, so helpers such as `conv2dm` were found automatically. Adding only `src/image-processing` is recommended: `src/matlab-fundamentals/union.m` and `src/mini-problems/factorial.m` share names with built‑in MATLAB functions and would shadow them if placed on the path.
3. Place a suitable input image with the expected file name in the current folder, then run a script, for example `algoritmoHarris` (expects `chess.png`) or `algoritmoCanny` (expects `clonetrooper.jpg`).

Known limitations that prevent some files from running as‑is — for instance, four scripts call a `conv2d` function that is not in the repository, and `Proyecto.m` has no `.fig` — are listed in [docs/possible-improvements.md](docs/possible-improvements.md). They were intentionally **not** fixed.

## Documentation

| Document | Contents |
|---|---|
| [docs/project-context.md](docs/project-context.md) | Origin, evidence, timeline, scope, confirmed vs. inferred vs. unknown facts |
| [docs/code-overview.md](docs/code-overview.md) | What each file does, execution model, dependency map |
| [docs/possible-improvements.md](docs/possible-improvements.md) | Observed bugs, technical debt and modernization ideas (not applied) |
| [docs/sdlc/intent.md](docs/sdlc/intent.md) | Intent: purpose of the original project and of this restructuring |
| [docs/sdlc/spec.md](docs/sdlc/spec.md) | As-built specification with capability-level requirements and status |
| [docs/sdlc/plan.md](docs/sdlc/plan.md) | Reconstructed learning/implementation plan and the restructuring plan |
| [AGENTS.md](AGENTS.md) | Contribution rules — most importantly, `src/` is read-only |

## Historical Note

This repository was later reorganized and documented to improve readability and preserve the historical context of the original project. The original source code remains unchanged: files were only moved into topic folders (`git log --follow <file>` shows their full history), and their contents — including Spanish comments, typos, Latin‑1 encoding, CRLF line endings, commented‑out experiments and known bugs — are kept exactly as written.

> **Encoding note.** A few files (`algoritmoCanny.m`, `filtradoHisteresis.m`, `conv2dm.m`, `conv2dz.m`, `Correspondencia.m`) are encoded in ISO‑8859‑1 / Windows‑1252, as saved by MATLAB on Windows. Accented characters in their comments may look garbled on GitHub; the files themselves are intact.

## License

[MIT](LICENSE) © 2021 Baruch Lopez.
