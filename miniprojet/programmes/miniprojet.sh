#!/usr/bin/env bash

file=$1
line_count=1

if [ $# -ne 1 ];
then
    echo "Ce programme demande un argument : un fichier."
    exit
fi
echo -e "<!DOCTYPE html>
<html>
	<head>
		<meta charset=\"UTF-8\" />
		<title>Programmation et Projet Encadré</title>
		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
		<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/versions/bulma-no-dark-mode.min.css\">
	</head>
	<body>
		<section class=\"section has-background-success-90\">
		<div class=\"container has-background-white\">
			<div class=\"hero has-text-centered\">
				<div class=\"hero-body\">
					<h1 class=\"title\">Programmation et Projet Encadré</h1>
				<br/>
				</div>
				</div>
				<nav class=\"tabs is-centered\">
				<ul>
					<li><a href=\"https://lenabrun.github.io/PPE1-2024/miniprojet/index.html\">Accueil</a></li>
					<li><a href=\"scripts.html\">Scripts</a></li>
					<li class=\"is-active\"><a href=\"tableaux.html\">Tableaux</a></li>
				</ul>
				</nav>
				<div class=\"columns is-centered\">
					<div class=\"column is-half\">
						<div class=\"block\">
							<table class=\"table is-bordered is-hoverable is-striped\">
							<legend>En langue française :</legend>
							<thead>
								<tr>
									<th>Ligne</th>
									<th>Lien</th>
									<th>Code</th>
									<th>Encodage</th>
									<th>Mots</th>
								</tr>
							</thead>
							<tbody>"

while read -r line
do
    response=$(curl -s -L -w "%{content_type}\t%{http_code}" -o /tmp/test.html $line)
    http_code=$(echo "$response" | cut -f2)
    content_type=$(echo "$response" | cut -f1)
    encoding=$(echo "$content_type" | grep -P -o 'charset=\S+' | cut -d "=" -f2 | tail -n 1)
    words_count=$(lynx -dump -nolist /tmp/test.html | wc -w)
	echo -e "<tr>
				<td>$((line_count++))</td>
				<td><a href=$line>$line</a></td>
				<td>${http_code}</td>
				<td>${encoding:-Absent}</td>
				<td>${words_count}<td>
			</tr>"
done < $file
echo -e "			</tbody>
			</table>
			</div>
			</div>
			</div>
			</div>
		</section>
	</body>
</html>"
