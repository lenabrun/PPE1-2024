#!/usr/bin/bash
chmod +x compte_par_type.sh
year=$1
month=$2
number=$3

if [ $# -ne 3 ];
then
    echo "Ce programme demande trois arguments : une année, un mois et un nombre."
    exit
fi
if [[ "$year" == "*" && "$month" == "*" ]];
then
    for all_years in 2016 2017 2018; do
        for all_months in 01 02 03 04 05 06 07 08 09 10 11 12; do
            echo -e "\nClassement de lieux en $all_years/$all_months :"
            echo $(grep "Location" ann/${all_years}_${all_months}*.ann | cut -f 3 | sort -n | uniq -c | sort -n | tail -n $number)
        done
    done
else
    if [[ "$year" == "*" ]];
    then
        for all_years in 2016 2017 2018; do
            echo -e "\nClassement de lieux en $all_years/$month :"
            echo $(grep "Location" ann/${all_years}_${month}*.ann | cut -f 3 | sort -n | uniq -c | sort -n | tail -n $number)
        done
    else
        if [[ "$month" == "*" ]];
        then
            for all_months in 01 02 03 04 05 06 07 08 09 10 11 12; do
                echo -e "\nClassement de lieux en $year/$all_months :"
                echo $(grep "Location" ann/${year}_${all_months}*.ann | cut -f 3 | sort -n | uniq -c | sort -n | tail -n $number)
            done
        else
            echo $(grep "Location" ann/${year}_${month}*.ann | cut -f 3 | sort -n | uniq -c | sort -n | tail -n $number)
        fi
    fi
fi
