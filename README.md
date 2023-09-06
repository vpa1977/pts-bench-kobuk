# pts-bench-kobuk

A layer on top of PTS automation which simplifies the PTS install + run process for Kobuk

## Usage

For running on a device with a display connected, just run:\
`$ ./install-deps.sh`\
`$ ./<test suite>/run.sh`

To run headless, make sure you export DISPLAY:\
`$ ./install-deps.sh`\
`$ export DISPLAY=:0`\
`$ ./<test suite>/run.sh`
