#!/bin/bash

sudo apt install -y meson php-cli php-xml build-essential xterm p7zip-full nasm yasm libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev freeglut3-dev libssl-dev openssl php-cli php-xml autoconf mesa-utils vulkan-tools unzip apt-file cmake ninja-build gawk bison qtbase5-dev qt5-qmake libfftw3-dev fftw-dev freeglut3-dev python3-pip python3-yaml gfortran libopenmpi-dev openmpi-bin libmpich-dev opencl-headers ocl-icd-libopencl1 clinfo ocl-icd-opencl-dev

# Running any PTS command creates ~/.phoronix-test-suite
./pts-source/phoronix-test-suite list-available-tests

# Copy our custom test suites to the Phoronix Test Suite dir
cp -r phoronix-custom-suites/* $HOME/.phoronix-test-suite/test-suites/local/
cp ./config/user-config.xml $HOME/.phoronix-test-suite/

# Enables the mixbench test
sudo ln -s /usr/lib/x86_64-linux-gnu/libOpenCL.so.1 /usr/lib/libOpenCL.so
