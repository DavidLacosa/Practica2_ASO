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
echo "<h3><form action=\"/cgi-bin/cron_tasks/cron_tasks.sh\" method=\"post\">
	<label for=\"pid\">Select cron task: </label> 
	<input type=\"text\" name=\"task\" value=\"\">
	<input type=\"submit\" value=\"Select task\">
	</form></h3></br>"
echo 	"</body></html>"
