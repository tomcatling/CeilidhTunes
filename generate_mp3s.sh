cd ./abc/

rm ../mp3s/*.mp3
rm *.mp3
rm *.mid

for tune in *.abc
do 

	abc2midi $tune

done

for tune in *.mid
do 
	timidity $tune -Ow -K -2 -o - | ffmpeg -i - -acodec libmp3lame -ab 64k "${tune%'.mid'}.mp3"
done

rm *.mid
mv *.mp3 ../mp3s/