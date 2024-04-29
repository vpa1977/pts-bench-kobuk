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
export CFLAGS='-fno-omit-frame-pointer -frecord-gcc-switches -O2'
export CXXFLAGS='-fno-omit-frame-pointer -frecord-gcc-switches -O2'
export FFLAGS='-fno-omit-frame-pointer -frecord-gcc-switches -O2'

# Required to avoid some tests from building with extra flags
export CFLAGS_OVERRIDE=$CFLAGS

export QMAKE_CXXFLAGS=$CXXFLAGS
export QMAKE_CFLAGS=$CFLAGS
host=`hostname`
export TEST_RESULTS_IDENTIFIER=server-rockman-mantic2-with-no-omit-framepointer
export TEST_RESULTS_NAME=server-rockman-mantic2-with-no-omit-framepointer
export TEST_RESULTS_DESCRIPTION='--with-no-omit-framepointer'
#DISPLAY=:0 NO_FILE_HASH_CHECKS=1 PTS_SILENT_MODE=1 $PTS_BIN finish-run $TEST_RESULTS_IDENTIFIER
DISPLAY=:0 NO_FILE_HASH_CHECKS=1 PTS_SILENT_MODE=1 $PTS_BIN batch-benchmark cractus-missing
#pts-system pts/workstation pts/server-cpu-tests pts/hpc

#$PTS_BIN result-file-raw-to-csv $TEST_RESULTS_NAME
