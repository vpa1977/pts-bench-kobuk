#!/bin/bash
set -ex

unset CFLAGS
unset CXXFLAGS
unset FFLAGS

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh
PTS_BIN=$SCRIPT_DIR/../pts-source/phoronix-test-suite

# make sure we don't re-use tests that were built with different flags
#rm -rf $HOME/.phoronix-test-suite/installed-tests/

# PTS grabs these flags in pts_test_installer.php
#export CFLAGS='-Wall'
#export CXXFLAGS='-Wall'
#export FFLAGS='-Wall'

# Required to avoid some tests from building with extra flags
#export CFLAGS_OVERRIDE=$CFLAGS

#export QMAKE_CXXFLAGS=$CXXFLAGS
#export QMAKE_CFLAGS=$CFLAGS
export OMIT_POINTER=-fno-omit-frame-pointer
# PTS grabs these flags in pts_test_installer.php
export CFLAGS='-fno-omit-frame-pointer'
export CXXFLAGS='-fno-omit-frame-pointer'
export FFLAGS='-fno-omit-frame-pointer'

# Required to avoid some tests from building with extra flags
export CFLAGS_OVERRIDE=$CFLAGS

export QMAKE_CXXFLAGS=$CXXFLAGS
export QMAKE_CFLAGS=$CFLAGS

host=`hostname`
export TEST_RESULTS_IDENTIFIER=$host-fp-py-id
export TEST_RESULTS_NAME=$host-fp-py-name
export TEST_RESULTS_DESCRIPTION='fp mantic result'
export LD_LIBRARY_PATH=/lib/x86_64-linux-gnu/openblas-pthread/ 
#DISPLAY=:0 NO_FILE_HASH_CHECKS=1 PTS_SILENT_MODE=1 $PTS_BIN finish-run $TEST_RESULTS_NAME
DISPLAY=:0 NO_FILE_HASH_CHECKS=1 PTS_SILENT_MODE=1 $PTS_BIN batch-benchmark pts/scikit-learn pts/numpy pts/pyhpc pts/pybench pts/pyperformance pts/pytorch


$PTS_BIN result-file-raw-to-csv $TEST_RESULTS_NAME	
