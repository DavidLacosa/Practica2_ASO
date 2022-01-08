#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Main page</title>"
echo "<style>"
echo "h1 {text-align: center;}"
echo "h2 {text-align: center;}"
echo "h3 {text-align: center; }"
echo "</style>"
echo "</head><body>"

#Fifo per controlar l'audio
FILE=/home/pi/audioControl

#Mirem al fitxer quina és la canço actual, si no hi ha res assumim que es la primera
indexCurrentSong=$(head -n 1 currentSongID)
if [ -z $indexCurrentSong ]
then 
	indexCurrentSong=0
	#Escrivim en el fitxer per guardar quina es la canço actual
	`sudo echo "$indexCurrentSong" > /usr/lib/cgi-bin/sound_of_sunshine/currentSongID`
fi

#importem les cançons
songs=(`ls /usr/lib/cgi-bin/playlist/Desktop/*.mp3 | awk -F "/" '{print $7}'`) 

#parem la reproduccio actual i reproduim la canço especificada
`echo "s" >> $FILE`
`echo "l /home/pi/playlists/Desktop/${songs[$indexCurrentSong]}" >> $FILE`
#Escrivim al fitxer el id de la canço actual, per si de cas:
`echo "$indexCurrentSong" > /usr/lib/cgi-bin/sound_of_sunshine/currentSongID`

#Ens redirigim al menu de sound
echo "<meta http-equiv=\"refresh\" content=\"0; URL=/cgi-bin/sound_of_sunshine/sound_of_sunshine.sh\" />"
echo "</body></html>"
