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

FILE=/home/pi/audioControl

#Importem els noms de les cançons de la playlist
songs=(`ls /usr/lib/cgi-bin/playlist/Desktop/*.mp3 | awk -F "/" '{print $7}'`) 

#Marquem l'index de la canço de shuffle
indexShuffleSong=$(( $RANDOM % ${#songs[@]} ))

#parem la reproduccio actual i reproduim la canço especificada
`echo "s" >> $FILE`
`echo "l /home/pi/playlists/Desktop/${songs[$indexShuffleSong]}" >> $FILE`
#Escrivim al fitxer el id de la canço actual:
`echo "$indexShuffleSong" > /usr/lib/cgi-bin/sound_of_sunshine/currentSongID`

#redirigim al menu de song
echo "<meta http-equiv=\"refresh\" content=\"0; URL=/cgi-bin/sound_of_sunshine/sound_of_sunshine.sh\" />"
echo "</body></html>"
