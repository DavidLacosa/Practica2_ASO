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

echo "</br><h2> CREATE A USER </h2>"
echo "<h3><form action=\"/cgi-bin/user_manager/register_user.sh\" method=\"post\">
		<label for=\"pid\">Username: </label> 
		<input type=\"text\" name=\"pid\" value=\"\"></br></br>
		<label for=\"paswd\">Password: </label> 
		<input type=\"password\" name=\"paswd\" value=\"\"></br>
		</br><input type=\"submit\" value=\"Login user\">
	</form></h3></br>"
echo "<h2> DELETE A USER </h2>"
echo "<h3><form action=\"/cgi-bin/user_manager/remove_user.sh\" method=\"post\">
		<label for=\"pid\">Username: </label> 
		<input type=\"text\" name=\"pid\" value=\"\"></br></br>
		</br><input type=\"submit\" value=\"Remove user\">
	</form></h3>"
echo 	"</body></html>"
