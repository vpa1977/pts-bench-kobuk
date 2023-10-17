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
