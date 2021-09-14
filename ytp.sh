#!/bin/bash
terminal=`tty`
dir=$(pwd)
ENV_DIR=${dir}/env/bin/activate
echo ${ENV_DIR}
source ${ENV_DIR}
exec < ${dir}/youtubevideolinks.txt
while read -r line
do
    cd ~/Music
    youtube-dl -f 18 -x --extract-audio --audio-format mp3 --audio-quality 0 "$line"
done
deactivate
cd ${dir}
exec < "$terminal"
