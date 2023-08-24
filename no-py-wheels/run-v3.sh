#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh

export TEST_RESULTS_IDENTIFIER=no-py-wheels-id 
export TEST_RESULTS_NAME=no-py-wheels-name 

# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-march=x86-64-v3'
export CXXFLAGS='-march=x86-64-v3'
export FFLAGS='-march=x86-64-v3'
export TEST_RESULTS_DESCRIPTION='A test suite which avoids Python wheels or prebuilt bins. Builds are optimized for x86-64-v3'

PTS_SILENT_MODE=1 phoronix-test-suite benchmark no-py-wheels

phoronix-test-suite result-file-to-csv no-py-wheels-name
