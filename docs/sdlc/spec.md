# Specification (As-Built)

This is a **descriptive** specification: it records what the original code does, reconstructed from the source, rather than prescribing new behaviour. It follows from [intent.md](intent.md) and is implemented as described in [plan.md](plan.md).

Status values:

- **Implemented** — the code implements the capability as described.
- **Partial** — implemented with a known limitation or defect.
- **Not runnable as-is** — code exists, but a missing file/symbol prevents it from running without changes.
- **Incomplete** — the author did not finish it.

All statuses come from reading the code; nothing was executed. Details for each limitation are in [possible-improvements.md](../possible-improvements.md).

## 1. Scope

- **In scope:** the 55 MATLAB files in `src/`, their inputs, outputs and interactions.
- **Out of scope:** assignment statements, grading, and the missing assets, which are not in the repository.

## 2. Environment requirements

| ID | Requirement | Source |
|---|---|---|
| ENV‑1 | MATLAB (release unknown; R2016b+ for scripts with local functions) | `fib.m`, `factorial.m` |
| ENV‑2 | Image Processing Toolbox | `imfilter`, `edge`, `hough`, `corner`, … |
| ENV‑3 | Computer Vision Toolbox | `Correspondencia.m` |
| ENV‑4 | Image Acquisition Toolbox with `winvideo` adaptor (Windows) and a webcam | `ConfigurarLaCamara_.m` |
| ENV‑5 | Symbolic Math Toolbox | `ecm.m` (`vpa`) |
| ENV‑6 | GUIDE and `Proyecto.fig` | `Proyecto.m` |
| ENV‑7 | Input images in the current folder | see [code-overview.md](../code-overview.md#input-files-referenced-by-the-code) |

## 3. Functional capabilities

### 3.1 Filtering (`src/image-processing/filtering/`)

| ID | Capability | Files | Status |
|---|---|---|---|
| FLT‑1 | Manual 2‑D convolution with zero padding, output same size as input | `conv2dm.m`, `conv2dz.m` | Partial (`uint8` clipping, square kernel assumed) |
| FLT‑2 | Grayscale smoothing with a 3×3 binomial kernel using FLT‑1 | `AplicarFiltroGrises.m` | Implemented |
| FLT‑3 | Per-channel RGB smoothing with a 4×4 binomial kernel; save `newImage.jpg` | `AplicarFiltrosColor.m` | Not runnable as-is (`conv2d` missing) |
| FLT‑4 | Salt & pepper noise generation and median filtering | `filtroMediana.m` | Implemented |
| FLT‑5 | 2× downsampling by pixel decimation; save `newImage2.jpg` | `Reducir_imagen.m` | Implemented |

### 3.2 Enhancement (`src/image-processing/enhancement/`)

| ID | Capability | Files | Status |
|---|---|---|---|
| ENH‑1 | Grayscale unsharp masking `I + a·(I − smooth(I))`, `a = 16` | `RealzeGrises.m` | Not runnable as-is (`conv2d` missing) |
| ENH‑2 | RGB unsharp masking, `a = 4`; save `newImage.jpg` | `RealzeColor.m` | Not runnable as-is (`conv2d` missing) |

### 3.3 Histograms (`src/image-processing/histograms/`)

| ID | Capability | Files | Status |
|---|---|---|---|
| HIS‑1 | 256-bin histogram with plot | `histograma.m` | Implemented |
| HIS‑2 | Normalized histogram with plot | `histogramanormalizado.m` | Implemented |
| HIS‑3 | Equalization mapping from cumulative distribution | `histogramaecualizado.m` | Partial (scales by 256) |
| HIS‑4 | Worked equalization example on a 4×4, 10-level matrix | `HistogramaFrecuenciaAcumulada.m` | Implemented |

### 3.4 Derivatives and edges (`src/image-processing/derivatives-and-edges/`)

| ID | Capability | Files | Status |
|---|---|---|---|
| EDG‑1 | Forward/backward/central 1‑D derivatives compared with the analytic derivative | `DerivadasDeVectoresDiscretos.m` | Implemented |
| EDG‑2 | 2‑D discrete-derivative edge maps (`[-1 1]` vs `[1 0 -1]`) | `DerivadasDeMatrizesDiscretas.m` | Partial (`conv2` on `uint8`, verify) |
| EDG‑3 | Sobel derivatives, gradient magnitude and orientation | `derivadaImagen.m`, `magnitudGradiente.m`, `orientacionGradiente.m` | Implemented |
| EDG‑4 | Edges as original minus smoothed (gray / RGB) | `bordesGrises.m`, `bordesColor.m` | Gray: Partial (`uint8` clipping); RGB: Not runnable as-is |
| EDG‑5 | Combination of Prewitt, Sobel, LoG and Canny edge maps | `deteccionDeBordes.m` | Implemented |

### 3.5 Canny (`src/image-processing/canny/`)

| ID | Capability | Files | Status |
|---|---|---|---|
| CAN‑1 | End-to-end manual Canny: Sobel → magnitude/orientation → quantization → NMS → double threshold (17.5 % / 7.5 % of max) → hysteresis | `algoritmoCanny.m` | Partial (see possible-improvements §2) |
| CAN‑2 | Non-maximum suppression as a reusable function | `supresionNoMaximos.m` | Implemented |
| CAN‑3 | Double threshold + hysteresis as a reusable function | `filtradoHisteresis.m` | Implemented |

### 3.6 Corners (`src/image-processing/corners/`)

| ID | Capability | Files | Status |
|---|---|---|---|
| COR‑1 | Manual Harris detector (k = 0.04, 5×5 Gaussian σ = 1, 3×3 NMS, 1 % threshold) | `algoritmoHarris.m` | Implemented |
| COR‑2 | Toolbox corner detection and plot | `DetecciondeEsquinas.m` | Implemented |

### 3.7 Hough (`src/image-processing/hough/`)

| ID | Capability | Files | Status |
|---|---|---|---|
| HOU‑1 | Manual Hough accumulator | `Hough.m` | Incomplete |
| HOU‑2 | Toolbox Canny + Hough line detection, longest segment highlighted | `CanyHoughLIneas.m` | Implemented |

### 3.8 Segmentation, camera and matching

| ID | Capability | Files | Status |
|---|---|---|---|
| SEG‑1 | Green-screen removal by thresholding the green channel (> 180) | `pantallaVerde.m` | Partial (background not loaded) |
| CAM‑1 | Webcam discovery, `videoinput` creation and preview | `ConfigurarLaCamara_.m` | Implemented (Windows only) |
| CAM‑2 | Harris feature matching between two snapshots, 10 matches displayed | `Correspondencia.m` | Implemented (needs CAM‑1 workspace) |

### 3.9 GUI (`src/gui/`)

| ID | Capability | Files | Status |
|---|---|---|---|
| GUI‑1 | Load an image from disk and display it | `Proyecto.m` | Not runnable as-is (`Proyecto.fig` missing) |
| GUI‑2 | Apply one of: Canny; custom 3×3 filter `[1 3 1;3 3 3;1 3 1]/19`; Gaussian sharpening ×20 | `Proyecto.m` | Not runnable as-is |
| GUI‑3 | Save the processed image | `Proyecto.m` | Not runnable as-is |

### 3.10 Fundamentals and mini problems

| ID | Capability | Files | Status |
|---|---|---|---|
| FUN‑1 | Vector utilities: pass/fail count, differences, MSE, remove negatives, min/max | `alumnos`, `diferencia`, `ecm`, `eliminaNegativos`, `minMax` | Implemented |
| FUN‑2 | Set operations without built-ins | `union`, `interseccion` | Implemented |
| FUN‑3 | Series and linear systems | `serie`, `sumSerie`, `solucionEcuacion` | Implemented |
| MIN‑1 | I/O and plotting basics (2‑D, 3‑D) | `Sumita`, `Graficar`, `Apuntes`, `Ecuacion`, `T1`, `Tarea 1`, `Imagen1` | Implemented |
| MIN‑2 | Recursion | `factorial`, `fib`, `actividad en calase factorial` | Partial / Not runnable as-is |
| MIN‑3 | 1‑D convolution, correlation and signal alignment | `conv1d`, `corr1d`, `ejempCorr` | `conv1d`: Implemented; `corr1d`/`ejempCorr`: Partial |
| MIN‑4 | Image subtraction with a mask image | `mask.m` | Implemented |

## 4. Data contracts

- **Images** are read as `uint8` (grayscale via `rgb2gray` when needed) from hard-coded file names in the current folder.
- **Outputs** are figure windows; `newImage.jpg` / `newImage2.jpg` are written to the current folder by some scripts.
- **Functions** take MATLAB arrays and return arrays; none validate their inputs.

## 5. Repository-level requirements (restructuring)

| ID | Requirement | Status |
|---|---|---|
| REPO‑1 | Original `.m` files byte-identical, names unchanged | Done |
| REPO‑2 | Code grouped by topic under `src/` | Done |
| REPO‑3 | README with overview, context, structure, technologies, how-to and historical note | Done |
| REPO‑4 | Context, code overview and improvement notes under `docs/` | Done |
| REPO‑5 | `.gitignore` for generated outputs and MATLAB temp files; `.gitattributes` so GitHub detects MATLAB | Done |
| REPO‑6 | `AGENTS.md` defining contribution rules (read-only `src/`) | Done |
