#!/usr/bin/env bash

file=$1
line_count=1

if [ $# -ne 1 ];
then
    echo "Ce programme demande un argument : un fichier."
    exit
fi

while read -r line
do
    http_code=$(curl -o /dev/null -s -w '%{http_code}' "$line")
    encoding=$(curl -sI "$line" | grep -i "Content-Type" | awk -F 'charset'= '{print $2}' | tr -d '\r' | tr -d '\n')
    words_count=$(curl -s "$line" | wc -w | tr -d '\n')
    echo -e "$((line_count++))\t${line}\t${http_code}\t${encoding:-Absent}\t${words_count}"
done < $file
