#!/bin/bash

config=$1
input=$2
output=$3

. $config

echo $fast_align/build/fast_align -i $input -d -o -v
$fast_align/build/fast_align -i $input -d -o -v > $output.forward

echo $fast_align/build/fast_align -i $input -d -o -v -r
$fast_align/build/fast_align -i $input -d -o -v -r > $output.backward

echo $fast_align/build/atools -i $output.forward -j $output.backward -c grow-diag-final-and
$fast_align/build/atools -i $output.forward -j $output.backward -c grow-diag-final-and > $output
