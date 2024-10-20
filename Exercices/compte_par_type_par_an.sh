#!/usr/bin/bash
chmod +x compte_par_type.sh
entity=$1
if [ $# -ne 1 ];
then
    echo "Ce programme demande un argument : un type d'entité."
    exit
fi
for year in 2016 2017 2018; do
    count=$(./compte_par_type.sh $year $entity)
    echo "Annotations en ${year} : $count"
done
