PTS_DEB_FILE=phoronix-test-suite_10.8.4_all.deb
PTS_DEB_URL=https://phoronix-test-suite.com/releases/repo/pts.debian/files/$PTS_DEB_FILE

sudo apt update
sudo apt install -y php-cli php-xml build-essential xterm p7zip-full nasm yasm libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libopencv-dev freeglut3-dev libssl-dev openssl php-cli php-xml autoconf mesa-utils vulkan-tools unzip apt-file cmake ninja-build meson gawk bison qtbase5-dev qt5-qmake libfftw3-dev fftw-dev

pip3 install meson

wget $PTS_DEB_URL
sudo dpkg -i $PTS_DEB_FILE

# Prevents benchmark upload
sudo rm /usr/share/phoronix-test-suite/pts-core/objects/pts_openbenchmarking_upload.php

# Running any PTS command creates ~/.phoronix-test-suite
phoronix-test-suite list-available-tests

cp -r phoronix-custom-suites/* $HOME/.phoronix-test-suite/test-suites/local/
cp ./config/user-config.xml $HOME/.phoronix-test-suite/

# A bit of a hack to fix the gl-vs-vk test
sudo ln -s /usr/lib/x86_64-linux-gnu/libGLEW.so /usr/lib/x86_64-linux-gnu/libGLEW.so.1.13

# Enables the mixbench test
sudo ln -s /usr/lib/x86_64-linux-gnu/libOpenCL.so.1 /usr/lib/libOpenCL.so

# This checks if a device has a display and installs a dummy display if not
if [ -z $DISPLAY ]; then
    sudo apt install -y xserver-xorg-video-dummy
    $(sudo X -config config/dummy-xorg.conf &)
    echo 'Configured a headless X server for graphics tests'
    echo 'Please run "export DISPLAY=:0"'
fi
