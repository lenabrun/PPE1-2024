#!/usr/bin/bash
year=$1
entity=$2

if [ $# -ne 2 ];
then
    echo "Ce programme demande deux arguments : une année et un type d'entité."
    exit
fi
if [[ "$year" == "*" ]];
then
    for all_years in 2016 2017 2018; do
        echo $(grep $entity ann/${all_years}*.ann | wc -l)
    done
else
    echo $(grep $entity ann/${year}*.ann | wc -l)
fi
