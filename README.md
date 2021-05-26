# BlackHat-Repaired
Forked from [https://blackhat.hepforge.org/](https://blackhat.hepforge.org/) and repaired. 

## Description

The [`BlackHat`](https://blackhat.hepforge.org/) library implements on-shell methods for one-loop amplitudes numerically [(arXiv:0912.4927)](https://arxiv.org/pdf/0912.4927.pdf). 

But the original project has not been updated for a long time, and it cannot compile normally under modern `GCC`. This project patched the last version of the [`BlackHat`](https://blackhat.hepforge.org/) code so that it can be compiled normally under modern `GCC`.

## Build & Install

```bash
./build [install_path]
```