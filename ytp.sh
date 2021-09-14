#!/bin/bash
terminal=`tty`
exec < ~/erhost/youtubevideolinks.txt

while read -r line
do
    cd ~/Music
    youtube-dl -f 18 -x --extract-audio --audio-format mp3 --audio-quality 0 "$line"
done
exec < "$terminal"
