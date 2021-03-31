set -x

sudo apt install gcc
sudo apt install g++
sudo apt install make
sudo apt install build-essential
sudo apt install bison
sudo apt install flex
sudo apt install libgmp3-dev
sudo apt install libmpc-dev
sudo apt install libmpfr-dev
sudo apt install texinfo

sudo apt update
sudo apt upgrade

#the export command makes variables visible in the global scope
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

# let's build binutils
cd $HOME/src
mkdir build-binutils
cd build-binutils
# substitute "binutils-x.xx" with your actual version number
../binutils-2.36/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werrormake
make
make install

# now let's build GCC
cd $HOME/src
# this command should output the $TARGET directory we created before
which -- $TARGET-as || echo $TARGET-as is not in the PATH
mkdir build-gcc
cd build-gcc
# substitute "gcc-xx.x.x" with your actual version number
../gcc-10.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make #questo l'ho aggiunto io, fa un minifail, ma è OK
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

#now test all is properly installed and working:
$HOME/opt/cross/bin/$TARGET-gcc --version
# should yield something like
# i686-elf-gcc (GCC) 10.2.0
# ...blabla
#YEAH!!
