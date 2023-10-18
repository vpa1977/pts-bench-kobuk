# Installing a non-optimized version for the dav1d benchmark
# Shouldn't be an issue since a build tool shouldn't be involved in the measurement
wget https://people.canonical.com/~mckeesh/meson_1.0.1-5ubuntu1_all.deb
sudo dpkg -i meson_1.0.1-5ubuntu1_all.deb

sudo apt install -y php-cli php-xml build-essential xterm p7zip-full nasm yasm libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev freeglut3-dev libssl-dev openssl php-cli php-xml autoconf mesa-utils vulkan-tools unzip apt-file cmake ninja-build gawk bison qtbase5-dev qt5-qmake libfftw3-dev fftw-dev freeglut3-dev python3-pip python3-yaml gfortran libopenmpi-dev openmpi-bin libmpich-dev opencl-headers ocl-icd-libopencl1 clinfo ocl-icd-opencl-dev

# Prevents benchmark upload
sudo rm /usr/share/phoronix-test-suite/pts-core/objects/pts_openbenchmarking_upload.php

# Running any PTS command creates ~/.phoronix-test-suite
./pts-source/phoronix-test-suite list-available-tests

cp -r phoronix-custom-suites/* $HOME/.phoronix-test-suite/test-suites/local/
cp ./config/user-config.xml $HOME/.phoronix-test-suite/

# A bit of a hack to fix the gl-vs-vk test
sudo ln -s /usr/lib/x86_64-linux-gnu/libGLEW.so /usr/lib/x86_64-linux-gnu/libGLEW.so.1.13

# Enables the mixbench test
sudo ln -s /usr/lib/x86_64-linux-gnu/libOpenCL.so.1 /usr/lib/libOpenCL.so

# This checks if a device has a display and installs a dummy display if not
if [ -z $DISPLAY ]; then
    sudo apt install -y xserver-xorg-video-dummy
    sudo Xorg --configure
    mv /root/xorg.conf.new /etc/X11/xorg.conf
    echo 'Configured a headless X server for graphics tests'
    echo 'Please run "export DISPLAY=:0"'
fi
