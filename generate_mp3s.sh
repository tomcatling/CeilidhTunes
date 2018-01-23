#!/usr/local/bin/bash

transpose="0"
if [ -n "$1" ]
then
	transpose=$1
fi


timidityConfig="dir /usr/local/Cellar/timidity/2.14.0/share/timidity/Tone_000/\nbank 0\n0 046_Harp.pat \n1 042_Cello.pat"

echo "Transposing by $transpose semitones."

cd ./abc/

rm ../mp3s/*.mp3

echo "MIDI"
echo "###"

for tune in *.abc
do 
	echo "Midifying $tune" 
	abc2midi $tune -RS -o "${tune%'.abc'}.mid" &>/dev/null

done

echo "MP3"
echo "###"

for tune in *.mid
do 
    echo "Creating ${tune%'.mid'}.mp3" 
	timidity $tune -Ow -K "$transpose" -x"$timidityConfig" -o - 2>/dev/null | ffmpeg -i - -acodec libmp3lame -ab 64k "${tune%'.mid'}.mp3" &>/dev/null
done

rm *.mid
mv *.mp3 ../mp3s/

echo "Done."