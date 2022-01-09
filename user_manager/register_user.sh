#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>PROCESS MANAGER</title>"
echo "<style>"
echo "h1 {text-align: center;}"
echo "h3 {text-align: center; }"
echo "h2 {text-align: center; }"
echo "</style>"
echo "</head><body>"
echo "<h1 style=\"color:#4863A0\";> USER MANAGER </h1>"
read dades
username=`echo $dades | awk -F "&" '{print $1}' | awk -F "=" '{print $2}'`
PASSWD=`echo $dades | awk -F "&" '{print $2}' | awk -F "=" '{print $2}'`
crypted=`openssl passwd -$ALGO $PASSWD` #We generate the encripted password
ALGO=6 #algorisme d'encriptacio(6->sha-512)
#we add the user to the server
error=`sudo useradd -m -p "$crypted" "$username"`
#we check if the user has been added successfully
if [[ $? != 0 ]]; then  
	echo "<h2> User $username cound not be added</h2>"
	echo "<h2> ERROR MESSAGE: $error"
	logger -p user.notice "[USER MANAGER]:User failed to create user $username"
else 
	echo "<h2> User $username added successfully</h2>"
	logger -p user.notice "[USER MANAGER]:User successfully created user $username"
fi
echo    "</form>
	<form action=\"/cgi-bin/user_manager/user_manager.sh\">
	<input type=\"submit\" value=\"Go back\">
	</form>"
echo 	"</body></html>"
