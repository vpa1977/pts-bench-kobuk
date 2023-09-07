#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh

# make sure we don't re-use tests that were built with different flags
rm -rf $HOME/.phoronix-test-suite/installed-tests/

export TEST_RESULTS_IDENTIFIER=non-python-optimizable-id 
export TEST_RESULTS_NAME=non-python-optimizable-name 

# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-march=x86-64-v3'
export CXXFLAGS='-march=x86-64-v3'
export FFLAGS='-march=x86-64-v3'

export QMAKE_CXXFLAGS += $(CXXFLAGS)
export QMAKE_CFLAGS += $(CFLAGS)

export TEST_RESULTS_DESCRIPTION='A test suite which avoids Python wheels or prebuilt bins. Builds are optimized for x86-64-v3'

PTS_SILENT_MODE=1 phoronix-test-suite batch-benchmark non-python-optimizable

phoronix-test-suite result-file-raw-to-csv non-python-optimizable
