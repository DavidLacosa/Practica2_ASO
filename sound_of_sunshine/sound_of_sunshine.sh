#!/bin/bash

#Importem els noms de les cançons
songs=(`ls /usr/lib/cgi-bin/playlist/Desktop/*.mp3 | awk -F "/" '{print $7}'`) 

#Mirem al fitxer quina es la canço actual, si no hi ha res assumim que es la primera
indexCurrentSong=$(head -n 1 currentSongID)
if [ -z $indexCurrentSong ]
then 
	indexCurrentSong=0
	#Escrivim en el fitxer per guardar quina es la canço actual
	`sudo echo "$indexCurrentSong" > /usr/lib/cgi-bin/sound_of_sunshine/currentSongID`
fi

#Pàgina HTML
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Main page</title>"
echo "<style>"
echo "h1 {text-align: center;}"
echo "h2 {text-align: center;}"
echo "h3 {text-align: center; }"
echo ".notbold{
    font-weight:normal
}"
echo "</style>"
echo "</head><body>"

echo "<h1 style=\"color:#4863A0\";> SOUND OF SUNSHINE </h1>"

echo "<h3><form action=\"/cgi-bin/sound_of_sunshine/play_pause.sh\">
	<input type=\"submit\" value=\"Play/Pause\">
	</form>"
echo "<form action=\"/cgi-bin/sound_of_sunshine/next_song.sh\">
	<input type=\"submit\" value=\"Next\">
	</form>"
echo "<form action=\"/cgi-bin/sound_of_sunshine/shuffle_song.sh\">
	<input type=\"submit\" value=\"Shuffle\">
	</form>"
echo "<form action=\"/cgi-bin/sound_of_sunshine/replay_song.sh\">
	<input type=\"submit\" value=\"Replay\">
	</form>"

#Mostrem les diferents cansons que hi ha en el fitxer
echo "</br><h2>CURRENT PLAYLIST</h2>"

#Mostrem amb negreta la canço actual
for song in ${!songs[@]} 
do
  if [[ $song == $indexCurrentSong ]]
  then
  	echo "<h3>${songs[$song]}</h3>"
  else
  	echo "<h3><span class='notbold'>${songs[$song]}</span></h3>"
  fi
done

#`mpg123 --remote --fifo /home/pi/audioControl >> /dev/null &`


echo "</body></html>"
