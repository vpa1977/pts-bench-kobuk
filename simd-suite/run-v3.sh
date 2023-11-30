#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh
PTS_BIN=$SCRIPT_DIR/../pts-source/phoronix-test-suite

# make sure we don't re-use tests that were built with different flags
rm -rf $HOME/.phoronix-test-suite/installed-tests/

# get the download cache for the simd test suite
if [ ! -f $SCRIPT_DIR/../simd-suite-dl-cache.tar.xz ]; then
    echo "Download cache not found. Downloading..."
    wget https://people.canonical.com/~mckeesh/simd-suite-dl-cache.tar.xz
fi

tar xvf $SCRIPT_DIR/../simd-suite-dl-cache.tar.xz
mv download-cache $HOME/.phoronix-test-suite

# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-march=x86-64-v3'
export CXXFLAGS='-march=x86-64-v3'
export FFLAGS='-march=x86-64-v3'

# Required to avoid some tests from building with extra flags
export CFLAGS_OVERRIDE=$CFLAGS

export QMAKE_CXXFLAGS=$CXXFLAGS
export QMAKE_CFLAGS=$CFLAGS

host=`hostname`
export TEST_RESULTS_IDENTIFIER=$host-simd-suite-v3-id
export TEST_RESULTS_NAME=$host-simd-suite-v3-name
export TEST_RESULTS_DESCRIPTION='A test suite which avoids Python wheels or prebuilt bins. Builds are optimized for x86-64-v3'

PTS_SILENT_MODE=1 $PTS_BIN batch-benchmark simd-suite

$PTS_BIN result-file-raw-to-csv $TEST_RESULTS_NAME
