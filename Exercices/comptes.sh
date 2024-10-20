#!/usr/bin/bash
for year in 2016 2017 2018; do
    count=$(grep "Location" ann/${year}*.ann | wc -l)
    echo "Annotations en $year : $count"
done
