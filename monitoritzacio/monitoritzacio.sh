#!/bin/bash

# Capçalera HTML
echo "Content-type: text/html"
echo ""
echo "<html>
	<head>
	<title>Main page</title>
 	<style>
		h1 {text-align: center;}
		h3 {text-align: left; }
	</style>
	</head>
	<body>"

###### PART DE CÀRREGA DE CPU, MEMÒRIA I DISC ######

### Variables

pid=`top -b -n 1 | tail +7 | awk '{print $1}'`
nom=`top -b -n 1 | tail +7 | awk '{print $2}'`
cpu=`top -b -n 1 | tail +7 | awk '{print $9}'`
mem=`top -b -n 1 | tail +7 | awk '{print $10}'`

### Codi

echo "<table><h3>Informacio d'us del servidor</h3>"

# Ensenyem la informació de tots els usuaris en una taula.
for i in "${!pid[@]}"; do
	echo "<tr>
		<td>${pid[i]}</td>
		<td>${nom[i]}</td>
		<td>${cpu[i]}</td>
		<td>${mem[i]}</td>
	      </tr>"
done
 
echo "</table>"

# Deixo això per si donés temps de fer-ho com intentava fer-ho. Intentava guardar tots els noms dels usuaris a una array i després fer un grep amb cada un dels noms trobats i després calcular la suma de cpu i memoria que tenen. El problema està amb la part de treure solament el nom (linia on surt la variable "b"), no entenc perquè no esguarda com s'hauria (si intento accedir a una altre posició de memòria que no sigui la 0 no surt res).

#a=`getent passwd` #Llegim tots els usuaris que hi ha en el sistema.
#b=`${a%%:*}` #Eliminem tot el que hi hagi després dels primers ":" (per quedar-nos amb el nom).
#c="a"

#for i in "${!a[@]}"; do
#	$c=${a[i]}
#	echo "<p>$c</p>"
#done

#echo "<p>${a%%:*}</p>"

#for i in "${!a[@]}"; do
#	echo "<p>${a[i]}</p>"
#done



######      PART DELS USUARIS CONNECTATS      ######

### Variables
connUsr=`netstat | grep tcp6` # | awk '{print $1}'`
i=0

# Depenenet del numero d'usuaris imprimim un missatge o un altre per pantalla.

if [ ${#connUsr[@]} == 1]; then
	echo "<h3>Hi ha un usuari connectat</h3>"
else
	echo "<h3>Hi ha ${#connUsr[@]} usuaris connectats</h3>"
fi

# Mirem si hi ha més de 10 usuaris connectats, si n'hi ha més de 10 solament ensenyem 10 i si n'hi ha menys de 10 els ensenyem tots.
if [ ${#connUsr[@]} == 9 ] ; then
	
	for (( i = 0 ; i < 10 ; i++ )); do
		echo "<p>${#connUsr[i]}</p>"		
	done

else

	for i in "${!connUsr[@]}"; do
		echo "<p>${connUsr[i]}</p>"		
	done

fi


######        PART D'INFORMACIÓ EXTRA         ######

echo "<h3>Informacio del servidor:</h3>"
echo `cat /proc/cpuinfo | grep Model`
echo "<p>Memoria utilitzada: `cat /proc/meminfo | grep MemFree | awk '{print $2 $3}'`/`cat /proc/meminfo | grep MemTotal | awk '{print $2 $3}'`</p>"

# Tanquem la capçalera HTML
echo "</body></html>"

