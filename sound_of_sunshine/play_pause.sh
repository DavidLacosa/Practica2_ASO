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
read dades
playSong=`echo $dades | awk -F "=" '{print $2}'` 
#loading and playing specified song
#`echo "l /home/pi/playlists/Desktop/$playSong" >> $FILE`
echo "`echo "p" >> $FILE`"

echo "<meta http-equiv=\"refresh\" content=\"0; URL=/cgi-bin/sound_of_sunshine/sound_of_sunshine.sh\" />"
echo "</body></html>"
