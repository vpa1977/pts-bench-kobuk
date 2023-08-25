#!/bin/bash

unset CFLAGS
unset CXXFLAGS
unset FFLAGS

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh

export TEST_RESULTS_IDENTIFIER=no-py-wheels-id 
export TEST_RESULTS_NAME=no-py-wheels-name 
export TEST_RESULTS_DESCRIPTION='A test suite which avoids Python wheels or prebuilt bins'

PTS_SILENT_MODE=1 phoronix-test-suite batch-benchmark no-py-wheels

phoronix-test-suite result-file-to-csv no-py-wheels-name
