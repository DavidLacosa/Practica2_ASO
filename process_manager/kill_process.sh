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
echo "<h1 style=\"color:#4863A0\";> PROCESS MANAGER </h1>"
read dades
pid=`echo $dades | awk -F "=" '{print $2}'`

echo "</br><h2><div>
	killing process with pid = $pid ...
	</div></h2>"
echo "	<h3> Redirecting back..."
echo "<meta http-equiv=\"refresh\" content=\"5; URL=/cgi-bin/process_manager/process_manager.sh\" />"
echo "</body></html>"
kill -9 "$pid"
#We execute a script to make the pid sleep a number of seconds

