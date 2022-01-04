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
echo "<h3><form action=\"/cgi-bin/process_manager.sh\" method=\"post\">
		<label for=\"pid\">PID: </label> 
		<input type=\"text\" name=\"pid\" value=\"\">
		<input type=\"submit\" value=\"Go back\">
	</form></h3>"
read dades
pid=`echo $dades | awk -F "=" '{print $2}'`

#Agafem les diferents stats:
users=( `ps aux | awk '{print $1}'` )
PIDs=(`ps aux | awk '{print $2}'`)
CPUs=(`ps aux | awk '{print $3}'`)
MEMs=(`ps aux | awk '{print $4}'`)
VSZs=(`ps aux | awk '{print $5}'`)
RSSs=(`ps aux | awk '{print $6}'`)
TTYs=(`ps aux | awk '{print $7}'`)
STATs=(`ps aux | awk '{print $8}'`)
STARTs=(`ps aux | awk '{print $9}'`)
TIMEs=(`ps aux | awk '{print $10}'`)
programs=(`ps aux | awk '{print $11}'`)
echo "<table style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">"
#The label of the table:
echo "<tr>
    <td>USER</td>
    <td>PID</td>
    <td>CPU</td>
    <td>MEMORY</td>
    <td>VSZ</td>
    <td>RSS</td>
    <td>TTY</td>
    <td>STAT</td>
    <td>START</td>
    <td>TIME</td>
    <td>COMMAND</td>
  </tr>"
for index in "${!users[@]}"
do
  if [ ${PIDs[index]} == $pid ]
  then
  echo "<tr>
    <td>${users[index]}</td>
    <td>${PIDs[index]}</td>
    <td>${CPUs[index]}</td>
    <td>${MEMs[index]}</td>
    <td>${VSZ[index]}</td>
    <td>${RSSs[index]}</td>
    <td>${TTYs[index]}</td>
    <td>${STATs[index]}</td>
    <td>${STARTs[index]}</td>
    <td>${TIMEs[index]}</td>
    <td>${programs[index]}</td>
  </tr>"
  fi
done
echo "</table>"
echo "</body></html>"
