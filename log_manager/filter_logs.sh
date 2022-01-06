#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>LOG_MANAGER</title>"
echo "<style>"
echo "h1 {text-align: center;}"
echo "h3 {text-align: center; }"
echo "h2 {text-align: center; }"
echo "</style>"
echo "</head><body>"
echo "<h1 style=\"color:#4863A0\";> LOG_MANAGER </h1>"

echo "</br><h2> WEB USER LOGS </h2>"
echo "<h3><form action=\"/cgi-bin/log_manager/filter_logs.sh\" method=\"post\">
	<label for=\"Filter\">Filter: </label> 
	<input type=\"text\" name=\"Filter\" value=\"\">
	<input type=\"submit\" value=\"Filter field\">
	</form></h3></br>"

#Llegim el fixer sunshine.log (on estan guardats tots els logs relatius a la web) i els guardem en un array. Cada linia del fitxer sera un slot del array
IFS=$'\r\n' GLOBIGNORE='*' command eval  'logs=($(cat /var/log/sunshine.log))'

read data
filter=`echo $data | awk -F "=" '{print $2}'`
echo "<h2>Showing logs filtering $filter (newest to oldest)</h2>"

#Invertim el for loop per tal de mostrar primer els logs més nous
for ((i=${#logs[@]}-1; i>=0; i--))
do
	if [[ "${logs[$i]}" == *"PROCESS MANAGER"* || "${logs[$i]}" == *"USER MANAGER"* ]]; then
		
		if [[ "${logs[$i]}" == *"$filter"* ]]
		then
  			echo "<h3>${logs[$i]}</h3>"
  		fi
  	fi
done	
echo 	"</body></html>"
