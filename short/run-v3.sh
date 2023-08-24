#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
$SCRIPT_DIR/../set_test_env.sh

# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-march=x86-64-v3'
export CXXFLAGS='-march=x86-64-v3'
export FFLAGS='-march=x86-64-v3'

# NOTE: Python wheels are still not optimized, so this test suite is not optimal

export TEST_RESULTS_IDENTIFIER=kobuk-short-id
export TEST_RESULTS_NAME=kobuk-short-name 
export TEST_RESULTS_DESCRIPTION='The short version of the full Kobuk test suite with builds optimized for x86-64-v3'

PTS_SILENT_MODE=1 phoronix-test-suite benchmark kobuk-bench-short

phoronix-test-suite result-file-to-csv kobuk-bench-short
