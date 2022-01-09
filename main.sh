#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Main page</title>"
echo "<style>"
echo "h1 {text-align: center;}"
echo "h3 {text-align: center; }"
echo "</style>"
echo "</head><body>"

read dades	#Llegeix la informacio passada amb el metode post
username=`echo $dades | awk -F "&" '{print $1}' | awk -F "=" '{print $2}'`
PASSWD=`echo $dades | awk -F "&" '{print $2}' | awk -F "=" '{print $2}'`
id -u $username > /dev/null
if [ $? -ne 0 ]
then
	#Username doesn't exist in the server:
        echo "<h1>User $username doesn't exist.<h1/>"
      	echo "<br/><h3><a href=\"/\">Go back</a><h3/>"
else
	#Username exists, checking for password...
	export PASSWD
	ORIGPASS=`grep -w "$username" /etc/shadow | cut -d: -f2`
	#Hash algorithm:
        export ALGO=`echo $ORIGPASS | cut -d'$' -f2`
        #Key needed to generate the hash output
        export SALT=`echo $ORIGPASS | cut -d'$' -f3`
        #Encripted key of the password that the user 
        GENPASS=`openssl passwd -$ALGO -salt $SALT $PASSWD`
        #If both keys are equal the password is correct
        if [ "$GENPASS" == "$ORIGPASS" ]
        then
           	echo "<h1>Loged in as $username<h1/>"
           	dateTime=`echo "<h3>Today is $(date)"`
		echo "$dateTime</h3><br/><br/>"
		echo "<h3><a href=\"/cgi-bin/process_manager/process_manager.sh\">PROCESS MANAGER</a><h3/><br/>"
		echo "<h3><a href=\"/cgi-bin/log_manager/log_manager.sh\">LOG MANAGER</a><h3/><br/>"
		echo "<h3><a href=\"/cgi-bin/user_manager/user_manager.sh\">USER MANAGER</a><h3/><br/>"
		echo "<h3><a href=\"/cgi-bin/monotoritzacio/monotoritzacio.sh\">MONITORING</a><h3/><br/>"
		echo "<h3><a href=\"/cgi-bin/network/network.sh\">NETWORK</a><h3/><br/>"
		echo "<h3><a href=\"/cgi-bin/cron_tasks/cron_tasks.sh\">CRON TASKS</a><h3/><br/>"
		echo "<h3><a href=\"/cgi-bin/sound_of_sunshine/sound_of_sunshine.sh\">SOUND OF SUNSHINE</a><h3/><br/>"
        else
                #The password is incorrect:
                echo "<h1>Invalid password<h1/>"
        	echo "<br/><h3><a href=\"/\">Go back</a><h3/>"
        fi
fi
echo "</body></html>"
