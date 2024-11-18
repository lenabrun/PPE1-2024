#!/usr/bin/env bash

file=$1
line_count=1

if [ $# -ne 1 ];
then
    echo "Ce programme demande un argument : un fichier."
    exit
fi
echo -e "<html>
	<head>
		<meta charset="UTF-8" />
	</head>
	<body>
		<table>
			<tr>
				<th>Ligne</th>
				<th>Lien</th>
				<th>Code HTTP</th>
				<th>Encodage</th>
				<th>Mots</th>
			</tr>"

while read -r line
do
    http_code=$(curl -s -I -L -w '%{http_code}' -o/dev/null $line)
    encoding=$(curl -s -I -L -w '%{content_type}' -o/dev/null $line | grep -P -o 'charset=\S+' |cut -d "=" -f2)
    words_count=$(lynx -dump -nolist $line | wc -w)
	echo -e "<tr>
				<td>$((line_count++))</td>
				<td>{$line}</td>
				<td>${http_code}</td>
				<td>${encoding:-Absent}</td>
				<td>${words_count}<td>
			</tr>"
done < $file
echo -e "</table>
	</body>
</html>"
