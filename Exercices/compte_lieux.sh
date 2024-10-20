#!/usr/bin/bash
chmod +x compte_par_type.sh
year=$1
month=$2
number=$3

echo $(grep "Location" ann/${year}_${month}*.ann | cut -f 3 | sort -n | uniq -c | sort -n | tail -n $number)
