#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>PROCESS MANAGER</title>"
echo "<style>"
echo "h1 {text-align: center;}"
echo "h3 {text-align: center; }"
echo "</style>"
echo "</head><body>"
echo "<h1 style=\"color:#4863A0\";> PROCESS MANAGER </h1>"

echo "<h3><form action=\"/cgi-bin/process_manager/pid_manager.sh\" method=\"post\">
		<label for=\"pid\">PID: </label> 
		<input type=\"text\" name=\"pid\" value=\"\">
		<input type=\"submit\" value=\"Select process\">
	</form></h3>"


#Agafem els users, pids i programes dels diferents processos
users=( `ps aux | awk '{print $1}'` )
PIDs=(`ps aux | awk '{print $2}'`)
programs=(`ps aux | awk '{print $11}'`)
echo "<table style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">"
for index in "${!users[@]}"
do
  echo "<tr>
    <td>${users[index]}</td>
    <td>${PIDs[index]}</td>
    <td>${programs[index]}</td>
  </tr>"
  
done
echo "</table>"
echo "$users"
echo "</body></html>"
