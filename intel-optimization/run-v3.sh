#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh
PTS_BIN=$SCRIPT_DIR/../pts-source/phoronix-test-suite

# make sure we don't re-use tests that were built with different flags
rm -rf $HOME/.phoronix-test-suite/installed-tests/

# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-march=x86-64-v3'
export CXXFLAGS='-march=x86-64-v3'
export FFLAGS='-march=x86-64-v3'

# Required to avoid some tests from building with extra flags
export CFLAGS_OVERRIDE=$CFLAGS

export QMAKE_CXXFLAGS=$CXXFLAGS
export QMAKE_CFLAGS=$CFLAGS

host=`hostname`
export TEST_RESULTS_IDENTIFIER=$host-intel-opt-v3-id
export TEST_RESULTS_NAME=$host-intel-opt-v3-name
export TEST_RESULTS_DESCRIPTION='A test suite'

PTS_SILENT_MODE=1 $PTS_BIN batch-benchmark intel-optimization

$PTS_BIN result-file-raw-to-csv $TEST_RESULTS_NAME
