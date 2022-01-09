#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>CRON MANAGER</title>"
echo "<style>"
echo "h1 {text-align: center;}"
echo "h3 {text-align: center; }"
echo "h2 {text-align: center; }"
echo "</style>"
echo "</head><body>"
echo "<h1 style=\"color:#4863A0\";> CRON MANAGER </h1>"

echo "</br><h2> CRON TASKS: </h2>"
echo "<h3><form action=\"/cgi-bin/cron_tasks/add_task.sh\" method=\"post\">
	<label for=\"task\">Add cron task: </label> 
	<input type=\"text\" name=\"task\" value=\"\">
	<input type=\"submit\" value=\"Add\">
	</form></h3>"
echo "<h3><form action=\"/cgi-bin/cron_tasks/delete_task.sh\" method=\"post\">
	<label for=\"task\">Delete cron task: </label> 
	<input type=\"text\" name=\"task\" value=\"\">
	<input type=\"submit\" value=\"Delete\">
	</form></h3></br>"
IFS=$'\r\n' GLOBIGNORE='*' command eval  'tasks=($(crontab -l))'
echo "<h2><u> -- Six parameters entry type -- </u></h2>"
echo "<table style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">"
#The label of the table:
echo "<tr>
    <th><h3>Minut (0-59)	</h3></th>
    <th><h3>Hora (0-23)	  	</h3></th>
    <th><h3>Dia del mes (0-31)	</h3></th>
    <th><h3>Mes (1-12)	  	</h3></th>
    <th><h3>Dia de la setmana (0-7)</h3></th>
    <th><h3>Task to execute	 </h3></th>
  </tr>"

for i in "${tasks[@]}"
do
	if [[ "${i::1}" != "#" ]]
	then
		
		IFS=' ' read -a task <<< "$i"
		tLen=${#task[@]}
		if [[ ${#task[@]} -gt 5 ]]
		then
			echo "<tr>
    			<td>${task[0]}</td>
    			<td>${task[1]}</td>
    			<td>${task[2]}</td>
    			<td>${task[3]}</td>
    			<td>${task[4]}</td>"
    			echo "<td>"
    			#Les comandes poden tenir espai, mostrem la comanda completa
    			for (( c=5;c<=${#task[@]};c++ ));do
  				echo "${task[c]} "
  			done
  			echo "</td></tr>"
		fi
	fi
done	
echo "</table>"

#Case of an input of the cron with only 2 parameters
echo "<table style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">"
echo "</br</br><h2><u> -- Two parameters entry type -- </u></h2>"
echo "<tr>
    <th><h3>Date/Time		</h3></th>
    <th><h3>Task to execute  	</h3></th>
    </tr>"

for i in "${tasks[@]}"
do
	if [[ "${i:0:1}" == "@" ]]
	then
		IFS=' ' read -a task <<< "$i"
		#si el primer caracter comença per @, la comanda es diferent
		echo 	"<tr>
    			<td>${task[0]}</td><td>"
    		#Les comandes poden tenir espai, mostrem la comanda completa
    		for (( c=1;c<${#task[@]};c++ ));do
  			echo "${task[c]} "
  		done
  		echo "</td></tr>"
	fi
done	
echo 	"</table>"
echo 	"</body></html>"
