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
echo "<h3><form action=\"/cgi-bin/user_manager/register_user.sh\" method=\"post\">
	<label for=\"Filter\">Filter: </label> 
	<input type=\"text\" name=\"Filter\" value=\"\">
	<input type=\"submit\" value=\"Filter field\">
	</form></h3></br>"
echo 	"</body></html>"
