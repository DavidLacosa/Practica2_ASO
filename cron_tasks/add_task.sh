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
#El metode post ens ha canviat alguns caracters:
taskToAdd=`echo $data | awk -F "=" '{print $2}'`
taskToAdd=`echo "$taskToAdd" | sed -r 's/[+]+/ /g'` # + -> ' ' 
taskToAdd=${taskToAdd//"%2F"/"/"}   #%2F ->/ 
taskToAdd=${taskToAdd//"%40"/"@"} # %40-> @
echo "<h2>Adding task: $taskToAdd </h2>"
#Afegim la nova tasca a cron
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "$taskToAdd" >> mycron
#install new cron file
crontab mycron
rm mycron
echo "<h2>Task successfully added.</h2>"
echo 	"</body></html>"
