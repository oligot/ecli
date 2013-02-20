#!/bin/sh

echo "Building ECLI..."
cd $ECLI/src/spec/ise
rm -f unix
ln -s linux unix
cd $ECLI
geant compile_libs
