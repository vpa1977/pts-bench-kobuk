#!/bin/bash
args="$*"
#args=`echo $args | sed 's/-fomit-frame-pointer//g'`
#args="$args"
echo /usr/bin/g++-13 $OMIT_POINTER $args
/usr/bin/g++-13 $OMIT_POINTER $args
