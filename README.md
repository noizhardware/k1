from: https://wiki.osdev.org/GCC_Cross-Compiler

- create the directory $HOME/src/

- download the latest .tar.gz from:
  https://ftp.gnu.org/gnu/binutils/
  and unzip into $HOME/src/

- download the latest .tar.gz from:
  https://ftp.gnu.org/gnu/gcc/
  and unzip into $HOME/src/

- run xc.sh to install and setup the cross-compiler environment

- TODO:
  - try  printf 'yes yes .....' | apt install....
    to automatically say YES(or no) to installers
  - use wget and tar to automate download and unzip of binutils and gcc

## Kernel:
from https://wiki.osdev.org/Bare_Bones#Building_a_Cross-Compiler
run mak.sh, it will spit out "myKernel.bin"