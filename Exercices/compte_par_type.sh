#!/usr/bin/bash
year=$1
entity=$2
count=$(grep $entity ann/${year}*.ann | wc -l)
echo $count
