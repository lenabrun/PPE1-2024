#!/usr/bin/env bash

file=$1

if [ $# -ne 1 ];
then
    echo "Ce programme demande un argument : un fichier."
    exit
fi

cat $file | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | grep -o '\w\+'
