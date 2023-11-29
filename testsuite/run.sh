#!/bin/bash

unset CFLAGS
unset CXXFLAGS
unset FFLAGS

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh
PTS_BIN=$SCRIPT_DIR/../pts-source/phoronix-test-suite

# make sure we don't re-use tests that were built with different flags
rm -rf $HOME/.phoronix-test-suite/installed-tests/

# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-Wall'
export CXXFLAGS='-Wall'
export FFLAGS='-Wall'

# Required to avoid some tests from building with extra flags
export CFLAGS_OVERRIDE=$CFLAGS

export QMAKE_CXXFLAGS=$CXXFLAGS
export QMAKE_CFLAGS=$CFLAGS

host=`hostname`
export TEST_RESULTS_IDENTIFIER=$host-testsuite-id 
export TEST_RESULTS_NAME=$host-testsuite-name 
export TEST_RESULTS_DESCRIPTION='A short test just to make sure the pipeline is intact'

PTS_SILENT_MODE=1 $PTS_BIN batch-benchmark testsuite

$PTS_BIN result-file-raw-to-csv $TEST_RESULTS_NAME
