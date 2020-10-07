#!/bin/bash

version=2020R2
instdir=/data/opt/apps/ansys/$version
topdir=/data/opt/sources/ANSYS/$version
m1=$topdir/mount1
m2=$topdir/mount2
m3=$topdir/mount3

$m1/INSTALL -silent -install_dir $instdir -media_dir2 $m2  -media_dir3 $m3 
