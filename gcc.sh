#!/bin/bash
args="$*"
args=`echo $args | sed 's/-fomit-frame-pointer//g'`
args="$args"
echo /usr/bin/gcc-13 -fno-omit-frame-pointer $args
/usr/bin/gcc-13 -fno-omit-frame-pointer $args
