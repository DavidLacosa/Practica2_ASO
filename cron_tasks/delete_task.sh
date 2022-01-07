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


read data
#Necessitem subtituir els '+' per ' ' i els '2%F' per '/'
#El metode post ens ha canviat alguns caracters
taskToDelete=`echo $data | awk -F "=" '{print $2}'`
taskToDelete=`echo "$taskToDelete" | sed -r 's/[+]+/ /g'` 
taskToDelete=${taskToDelete//"%2F"/"/"} # %2F-> /
taskToDelete=${taskToDelete//"%40"/"@"} # %40-> @
IFS=$'\r\n' GLOBIGNORE='*' command eval  'tasks=($(crontab -l))'
taskDeleted=0
echo "" > mycron
#Busquem la tasca amb la mateixa entrada
for i in "${tasks[@]}"
do
	if [[ "$i" != "$taskToDelete" ]]
	then	
		echo "$i" >> mycron
	else 
		echo "<h2>Task found!</h2>"
		echo "<h3>Task successfully deleted.</h3>"
		taskDeleted=$((taskDeleted+1))
	fi
done
crontab mycron
rm mycron
#Si no hem eliminat cap tasca:
if [ $taskDeleted == 0 ]
then 
	echo "<h2>No task found!</h2>"
	echo "<h3>Failed to remove task.</h3>"
fi
echo 	"</body></html>"
