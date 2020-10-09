#!/bin/bash

version=6.0.4
instdir=/data/opt/apps/fsl/$version
srcdir=/data/opt/sources/fsl/$version

# build VTK and install in fsl location
cd $instdir
cd VTK-7.1.1/
mkdir -p builddir
cd builddir/
export FSLDIR=$instdir
module load foundation
cmake -DCMAKE_INSTALL_PREFIX=$FSLDIR --prefix=$FSLDIR ..
make -j 4
cmake -DCMAKE_INSTALL_PREFIX=$FSLDIR -P cmake_install.cmake
module unload foundation
cd ../../ #now in topdir for fsl

# build fsl 
cd $instdir
patch -p0 < $srcdir/fsl.patch 
export FSLDIR=$instdir
export LD_LIBRARY_PATH="$FSLDIR/lib"
module load OpenBLAS/0.3.6 
module load cuda/10.1.243 
export CUDAVER=10.1
export VTKVER=7.1
# this step takes long time
./build 
# this step makes conda install
$FSLDIR/etc/fslconf/post_install.sh -f $FSLDIR 
