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
username=`echo $dades | awk -F "=" '{print $2}'`
error=`sudo userdel -r "$username"`
#we check if the user has been added successfully
if [[ $? != 0 ]]; then  
	echo "<h2> User $username cound not be removed</h2>"
	echo "<h2> ERROR MESSAGE: $error</h2>"
	logger -p user.notice "[USER MANAGER]:User failed to remove user $username"
else 
	echo "<h2> User $username removed successfully</h2>"
	logger -p user.notice "[USER MANAGER]:User removed user $username"
fi
echo    "</form>
	<form action=\"/cgi-bin/user_manager/user_manager.sh\">
	<h2><input type=\"submit\" value=\"Go back\"></h2>
	</form>"
echo 	"</body></html>"
