# Possible Improvements (Not Applied)

> **Important.** Nothing in this document has been applied to the code. The source files in `src/` are kept exactly as originally written to preserve the historical implementation. This list exists only to help a reader understand the code's limitations and what a modern version might change.

Findings come from reading the code; MATLAB was not executed during the review. Items marked *(verify)* are likely but were not confirmed by running them.

## 1. Issues that prevent files from running as-is

| # | File(s) | Observation |
|---|---|---|
| 1.1 | `AplicarFiltrosColor.m`, `RealzeColor.m`, `RealzeGrises.m`, `bordesColor.m` | Call `conv2d(...)`, which does not exist in the repository nor in MATLAB. Probably an earlier name of `conv2dm`/`conv2dz`. |
| 1.2 | `src/gui/Proyecto.m` | The layout file `Proyecto.fig` was never uploaded; GUIDE cannot open the GUI without it. |
| 1.3 | Most scripts | Input images (`Capture.JPG`, `chess.png`, `clonetrooper.jpg`, …) are missing. See [code-overview.md](code-overview.md#input-files-referenced-by-the-code). |
| 1.4 | `src/mini-problems/fib.m` | The recursive calls use `bif(...)` instead of `fib(...)`. The script also sets `n=3` but never calls the function. |
| 1.5 | `src/mini-problems/factorial.m` | Sets `n=5` but never calls the local function; `factorial(0)` would return `0` instead of `1`. |
| 1.6 | `src/mini-problems/actividad en calase factorial.m` | Uses `a` without defining it; the loop computes `a*a` repeatedly rather than a factorial. |
| 1.7 | `Correspondencia.m` | Depends on `vid` from `ConfigurarLaCamara_.m`; fails if fewer than 10 matches are found (`indexPairs(1:10, …)`). |
| 1.8 | `Hough.m` | Uses the image size `x, y` instead of the pixel coordinates `i, j`, passes degrees to `cos`/`sin` (which expect radians), and `p` can be `0`, which is not a valid index. The algorithm is unfinished. |
| 1.9 | `pantallaVerde.m` | `im2` (the background) is never loaded because `fondo.jpg` is commented out; `im1(i,j)` only checks the first channel. |
| 1.10 | `algoritmoCanny.m`, `DerivadasDeMatrizesDiscretas.m` | Call `conv2` directly on `uint8` images; depending on the MATLAB version this can raise a type error — `double(...)` would be needed *(verify)*. |

## 2. Correctness and numerical observations

- **`uint8` arithmetic saturates.** Enhancement and edge scripts (`RealzeGrises`, `RealzeColor`, `bordesGrises`, `bordesColor`, `mask`, GUI option 3) subtract/add `uint8` images, so negative values clip to 0 and large values to 255. Edges become one-sided.
- **`conv2dm`/`conv2dz`** accumulate into a `uint8` output (clipping) and pad by `floor(m/2)` in both directions, which assumes a square kernel.
- **`corr1d.m`** calls `fliplr(h);` without assigning the result, so it computes a convolution — identical to `conv1d.m`. `ejempCorr.m` later overwrites the computed delay with a hard-coded `ret=1085`.
- **`histogramaecualizado.m`** scales the cumulative distribution by 256 instead of 255, which can produce level 256.
- **Canny orientation quantization** uses strict `<`/`>` comparisons, so angles exactly at 22.5°, 67.5°, 112.5° or 157.5° are left unquantized and skipped by non-maximum suppression. Hysteresis is a single pass over direct neighbours, not a full connectivity trace.
- **`algoritmoCanny.m`** stores gradient magnitudes into a `uint8` image (`Im1`), clipping values above 255.
- **`DerivadasDeVectoresDiscretos.m`** adds/subtracts 1 to align discrete derivatives with the continuous one for the plot, a visual correction rather than a general method.
- **`sumSerie.m`** simply returns `n·2/x`; the "series" does not depend on `i`.
- **`minMax.m`** uses `size(vect)` column 2, so it only works for row vectors.

## 3. Naming and structure

- `conv2dm.m` declares `function ... conv2dz(...)`; the internal name and file name should match (MATLAB warns about this).
- `union.m` and `factorial.m` shadow built-in MATLAB functions when on the path.
- File names mix Spanish and casing styles, contain spaces (`Tarea 1.m`) and typos (`CanyHoughLIneas`, `DerivadasDeMatrizes`, `actividad en calase`, `Realze`).
- Heavy use of `clear`, `clear all`, `close all`, `clc` inside scripts and functions (`interseccion`, `minMax`, `solucionEcuacion`) clears the user's workspace or console.
- Global variables (`global img`) are used in the GUI; `guidata`/`handles` would avoid them.
- The Canny stages exist twice (inline in `algoritmoCanny.m` and as separate functions) with slight differences.

## 4. Performance

- Most algorithms use nested loops over every pixel (and over the kernel), which is slow in MATLAB compared with vectorized code, `conv2`, `imfilter`, or logical indexing.
- Vectors grow inside loops (`vec2=[vec2 num]`, `u=[u;y]`) instead of being preallocated.
- `ecm.m` uses `vpa` (Symbolic Math Toolbox) for a simple numeric mean.

## 5. Modernization ideas

- Add the missing sample images (or synthetic generators) so each script is reproducible.
- Recreate `Proyecto.fig` or port the GUI to App Designer (`.mlapp`), since GUIDE is deprecated in recent MATLAB releases.
- Convert scripts into functions that accept an image instead of reading hard-coded file names.
- Add comparison tests between the manual implementations and toolbox equivalents (`conv2`, `imhistmatch`/`histeq`, `edge(...,'canny')`, `detectHarrisFeatures`, `hough`).
- Translate comments or add English help text (`%` H1 lines) for `help`/`lookfor` support.
- Save files as UTF-8 to avoid garbled accents on GitHub.

Again: these are suggestions for a hypothetical future version. They were deliberately **not** applied.
