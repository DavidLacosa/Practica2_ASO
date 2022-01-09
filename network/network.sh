#!/bin/bash

echo "Content-type: text/html"
echo ""
echo "<html>
	<head>
	  <title>Main page</title>
	  <style>
		h1 {text-align: center;}
		h3 {text-align: center; }
          </style>
	</head>
	<body>"


### Títol de la pàgina
echo "<h1>GESTIO DE XARXA</h1>"

### Ensenyem les trames que hi ha

taula=( `netstat -al | tail +3 | awk '{print $1}'` )
tcp=( `netstat -al | tail +3 | grep tcp` )
tcp6=( `netstat -al | tail +3 | grep tcp6` )
udp=( `netstat -al | tail +3 | grep udp` )
udp6=( `netstat -al | tail +3 | grep udp6` )
raw=( `netstat -al | tail +3 | grep raw` )
raw6=( `netstat -al | tail +3 | grep raw6` )

#Imprimim la taula amb la informació de la taula de routing

######IMPRIIR TOTES LES TAULES SUMADES

echo "<h1>PIPO</h1>"
echo "<table style=\"border:1px solid black;margin-left:auto;margin-right:auto;\">"
for i in "${!taula[@]}"; do

	# Separem les trames
	if [ ${tcp[i]}  == "LISTEN" ]; then
		echo "</tr>"
	elif [ ${tcp[i]} == "ESTABLISHED" ]; then
		echo "</tr>"
	fi
	echo "<tr>
		<td>${tcp[i]}</td>
		<td>${udp[i]}</td>"
done

echo "</table>"

echo "  </body>
      </html>"

