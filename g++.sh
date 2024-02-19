#!/bin/bash
args="$*"
#args=`echo $args | sed 's/-fomit-frame-pointer//g'`
#args="$args"
/usr/bin/g++-13 $OMIT_POINTER $args
