#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh

# make sure we don't re-use tests that were built with different flags
rm -rf $HOME/.phoronix-test-suite/installed-tests/

# get the download cache for the short test suite
wget https://people.canonical.com/~mckeesh/short-dl-cache.tar.xz
tar xvf short-dl-cache.tar.xz
mv download-cache $HOME/.phoronix-test-suite

export TEST_RESULTS_IDENTIFIER=short-v3-id 
export TEST_RESULTS_NAME=short-v3-name 

# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-march=x86-64-v3'
export CXXFLAGS='-march=x86-64-v3'
export FFLAGS='-march=x86-64-v3'

export QMAKE_CXXFLAGS += $(CXXFLAGS)
export QMAKE_CFLAGS += $(CFLAGS)

export TEST_RESULTS_DESCRIPTION='A test suite which avoids Python wheels or prebuilt bins. Builds are optimized for x86-64-v3'

PTS_SILENT_MODE=1 phoronix-test-suite batch-benchmark short

phoronix-test-suite result-file-raw-to-csv short-name
