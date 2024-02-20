# pts-bench-kobuk

A layer on top of PTS automation which simplifies the PTS install + run process for Kobuk

## Installation
`$ git clone --recurse-submodules git@github.com:mckees/pts-bench-kobuk.git`\
`$ ./install-deps.sh`

## Usage
Current supported test suites:
* short
* simd-suite

For running on a device with a display connected, just run:\
`$ ./<test suite>/run.sh`

To run headless, make sure you export DISPLAY:\
`$ export DISPLAY=:0`\
`$ ./<test suite>/run.sh`

### x86-64-v3 benchmarking
Note that each run.sh file has an equivalent run-v3.sh script, which should be used when benchmarking with x86-64-v3 optimizations. This script sets up the run to use x86-64-v3 optimized installations of the software built in each test's install.sh script (when possible).


### Notes on image manipulation

Deploy qcow2 image to external drive:

```
sudo qemu-img convert -p -O raw <image>.qcow <your-device>
```

The partition will need adjusting (e.g. with gparted if more space is needed)

Backup to qcow2 image

```
sudo qemu-img convert -c -p -f raw -O qcow2 <device> <image>.qcow2
```

Mount qcow2

```
modprobe nbd max_part=8
qemu-nbd --connect=/dev/nbd0 /var/lib/vz/images/100/vm-100-disk-1.qcow2
fdisk /dev/nbd0 -l
mount /dev/nbd0p1 /mnt/somepoint/
```
Umount qcow2
```
umount /mnt/somepoint/
qemu-nbd --disconnect /dev/nbd0
rmmod nbd
```

Livecd rootfs does not contain ubuntu user, it needs to be created.
