#!/bin/bash

unset CFLAGS
unset CXXFLAGS
unset FFLAGS

# make sure we don't re-use tests that were built with different flags
rm -rf $HOME/.phoronix-test-suite/installed-tests/

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh

export TEST_RESULTS_IDENTIFIER=non-python-optimizable-id 
export TEST_RESULTS_NAME=non-python-optimizable-name 
export TEST_RESULTS_DESCRIPTION='A test suite which avoids Python wheels or prebuilt bins'

PTS_SILENT_MODE=1 phoronix-test-suite batch-benchmark non-python-optimizable

phoronix-test-suite result-file-to-csv non-python-optimizable-name
