#!/bin/bash

unset CFLAGS
unset CXXFLAGS
unset FFLAGS

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/../set_test_env.sh

export TEST_RESULTS_IDENTIFIER=kobuk-short-id
export TEST_RESULTS_NAME=kobuk-short-name 
export TEST_RESULTS_DESCRIPTION='The short version of the full Kobuk test suite'

PTS_SILENT_MODE=1 phoronix-test-suite benchmark kobuk-bench-short

phoronix-test-suite result-file-to-csv kobuk-bench-short
