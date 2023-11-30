#!/bin/bash

unset CFLAGS
unset CXXFLAGS
unset FFLAGS

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
export CFLAGS='-Wall'
export CXXFLAGS='-Wall'
export FFLAGS='-Wall'

# Required to avoid some tests from building with extra flags
export CFLAGS_OVERRIDE=$CFLAGS

export QMAKE_CXXFLAGS=$CXXFLAGS
export QMAKE_CFLAGS=$CFLAGS

host=`hostname`
export TEST_RESULTS_IDENTIFIER=$host-simd-suite-id
export TEST_RESULTS_NAME=$host-simd-suite-name
export TEST_RESULTS_DESCRIPTION='Results for a test suite which targets more SIMD-heavy\ 
	benchmarks.'

PTS_SILENT_MODE=1 $PTS_BIN batch-benchmark simd-suite

$PTS_BIN result-file-raw-to-csv $TEST_RESULTS_NAME
