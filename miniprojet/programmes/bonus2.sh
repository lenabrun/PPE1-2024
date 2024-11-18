#!/usr/bin/env bash

file=$1
nb_words=${2:-25}

./bonus1.sh $file | sort | uniq -c | sort -n -r | head -n $nb_words
