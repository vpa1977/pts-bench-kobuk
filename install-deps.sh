PTS_DEB_FILE=phoronix-test-suite_10.8.4_all.deb
PTS_DEB_URL=https://phoronix-test-suite.com/releases/repo/pts.debian/files/$PTS_DEB_FILE

sudo apt update
sudo apt install -y php-cli php-xml build-essential xterm p7zip-full nasm yasm libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libopencv-dev freeglut3-dev libssl-dev openssl php-cli php-xml autoconf mesa-utils vulkan-tools unzip apt-file cmake ninja-build meson

pip3 install meson

wget $PTS_DEB_URL
sudo dpkg -i $PTS_DEB_FILE

# Prevents benchmark upload
sudo rm /usr/share/phoronix-test-suite/pts-core/objects/pts_openbenchmarking_upload.php

# Running any PTS command creates ~/.phoronix-test-suite
phoronix-test-suite list-available-tests

cp -r phoronix-custom-suites/* $HOME/.phoronix-test-suite/test-suites/local/
cp ./user-config.xml $HOME/.phoronix-test-suite/
