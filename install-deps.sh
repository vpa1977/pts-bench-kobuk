#!/bin/bash

# downgrade packages if accidently ran upgrade
#sudo apt --fix-broken install
#sudo apt install -y --allow-downgrades libc6=2.38-1ubuntu6 libssl3=3.0.10-1ubuntu2 libsndfile1=1.2.2-1 libsqlite3-0=3.42.0-1  libsystemd0=253.5-1ubuntu6 libudev1=253.5-1ubuntu6 \
#    systemd-sysv=253.5-1ubuntu6 systemd=253.5-1ubuntu6 libpam-systemd=253.5-1ubuntu6 libsystemd0=253.5-1ubuntu6 systemd-sysv=253.5-1ubuntu6 polkitd policykit-1 libsystemd-shared=253.5-1ubuntu6 \
#    libudev1=253.5-1ubuntu6 \
#    initramfs-tools-bin=0.142ubuntu15

sudo apt install -y bash php-cli php-xml build-essential xterm p7zip-full nasm yasm libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev freeglut3-dev libssl-dev openssl php-cli php-xml autoconf mesa-utils vulkan-tools unzip apt-file cmake ninja-build gawk bison qtbase5-dev qt5-qmake libfftw3-dev fftw-dev freeglut3-dev python3-pip python3-yaml gfortran libopenmpi-dev openmpi-bin libmpich-dev opencl-headers ocl-icd-libopencl1 clinfo ocl-icd-opencl-dev

# Installing a non-optimized version for the dav1d benchmark
# Shouldn't be an issue since a build tool shouldn't be involved in the measurement
if [-f meson_1.0.1-5ubuntu1_all.deb];
then
    echo "File meson_1.0.1-5ubuntu1_all.deb found, not resinstalling"
else
    wget https://people.canonical.com/~mckeesh/meson_1.0.1-5ubuntu1_all.deb
fi
sudo dpkg -i meson_1.0.1-5ubuntu1_all.deb

# Running any PTS command creates ~/.phoronix-test-suite
./pts-source/phoronix-test-suite list-available-tests

# Copy our custom test suites to the Phoronix Test Suite dir
sudo cp -r phoronix-custom-suites/* /var/lib/phoronix-test-suite/test-suites/local

cp -r phoronix-custom-suites/* $HOME/.phoronix-test-suite/test-suites/local/
cp ./config/user-config.xml $HOME/.phoronix-test-suite/

# Enables the mixbench test
sudo ln -s /usr/lib/x86_64-linux-gnu/libOpenCL.so.1 /usr/lib/libOpenCL.so

# system-pts dependencies
sudo apt install libpcre3-dev redis libtiff-tools libjpeg-progs libxml2 libxml2-utils blender clpeak pbzip2 cryptsetup gegl gmic gnuradio hugin inkscape \
    rawtherapee libreoffice tesseract-ocr sqlite3 librsvg2-bin octave openscad ocrmypdf nginx mpv gimp \
    lightdm dbus-x11 darktable

# disable lightdm shudown
sudo -u lightdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
sudo -u lightdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
sudo -u lightdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
sudo -u lightdm dbus-launch gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
sudo -u lightdm dbus-launch gsettings set com.canonical.unity.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
sudo -u lightdm dbus-launch gsettings set com.canonical.unity.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
sudo -u lightdm dbus-launch gsettings set com.canonical.unity.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
sudo -u lightdm dbus-launch gsettings set com.canonical.unity.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

sudo ln -sf `pwd`/g++.sh /usr/bin/g++
sudo ln -sf `pwd`/gcc.sh /usr/bin/gcc

