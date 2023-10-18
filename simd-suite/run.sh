#!/bin/bash

unset CFLAGS
unset CXXFLAGS
unset FFLAGS

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh
PTS_BIN=$SCRIPT_DIR/../pts-source/phoronix-test-suite

# make sure we don't re-use tests that were built with different flags
rm -rf $HOME/.phoronix-test-suite/installed-tests/

export TEST_RESULTS_IDENTIFIER=simd-suite-id 
export TEST_RESULTS_NAME=simd-suite-name 
export TEST_RESULTS_DESCRIPTION='Results for a test suite which targets more SIMD-heavy\ 
	benchmarks.'

PTS_SILENT_MODE=1 $PTS_BIN batch-benchmark simd-suite

$PTS_BIN result-file-raw-to-csv $TEST_RESULTS_NAME
