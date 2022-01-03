#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>bash as CGI"
echo "</title></head><body>"
echo "<h1>Script rebre</h1>"
dateTime=`echo -e "Today is $(date)"`
echo -e "<h3>$dateTime</h3>"
read dades	#Reads logging and password data
echo "Les dades enviades: $dades <br/>"
echo "Fixem-nos que conte tant el nom del parametre com el contingut.
<br />Caldra manipular la cadena per a obtenir el valor.
Emprarem awk o sed:<br />"
username=`echo $dades | awk -F "&" '{print $1}' | awk -F "=" '{print $2}'`
password=`echo $dades | awk -F "&" '{print $2}' | awk -F "=" '{print $2}'`
echo -e "Username: $username"
echo -e "<br/>Password: $password" 
echo -e "<br/>"
id -u $username > /dev/null
if [ $? -ne 0 ]
then
        echo "User $username is not valid"
        echo "<br/> <a href=\"/\">Go back</a>"
else
	echo "user $username is valid"
	export password
	ORIGPASS=`grep -w "$username" /etc/shadow | cut -d: -f2`
        export ALGO=`echo $ORIGPASS | cut -d'$' -f2`
        export SALT=`echo $ORIGPASS | cut -d'$' -f3`
        GENPASS=$(perl -le 'print crypt("$ENV{password}","\$$ENV{ALGO}\$$ENV{SALT}\$")')
        echo " $ALGO and $SALT and $GENPASS and $ORIGPASS "
        if [ "$GENPASS" == "$ORIGPASS" ]
        then
                echo "Valid Username-Password Combination"
        else
                echo "Invalid Username-Password Combination"
        fi
IFS=$password
sudo -k
if sudo -lS &> /dev/null << EOF
$password
EOF
then
    echo 'Correct password.'
else 
    echo 'Wrong password.'
fi
fi
echo "</body></html>"
