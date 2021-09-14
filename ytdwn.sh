#!/bin/bash
dir=$(pwd)
function head {
  echo "         __      __              "
  echo "  __  __/ /_____/ /      ______  "
  echo " / / / / __/ __  / | /| / / __ \ "
  echo "/ /_/ / /_/ /_/ /| |/ |/ / / / / "
  echo "\__, /\__/\__,_/ |__/|__/_/ /_/  "
  echo "/____/ Download any mp3 from ytb~"
  echo ""
  echo ":~\$ ./ytdwn.sh run (default)"
  echo ":~\$ ./ytdwn.sh -h  (Usage)"
}

function makeitrun() {
  opt="$1"
  # while getopts "h:minimal:default:dev:" opt; do
  case "${opt}" in
    -h)
      head
      echo ""
      echo -e "\U0001F4E6 Help function is given.."
      echo -e "\U0001F4E6 Configuration:"
      echo "1. instaling python3 and virtualenv"
      echo "2. sudo chmod +x ${dir}/ytdwn.sh"
      echo "3. ./ytdwn.sh -init"
      echo -e "\U0001F4E6 Usage:"
      echo "1. just copy-paste ytb all video/music url to youtubevideolinks.txt"
      echo "2. ./ytdwn.sh run"
      echo -e "3. enjoy \U0001F601"
      ;;
    -init)
      head
      echo -e "\U0001F4E6 Installing lib dependency.."
      python3 -m venv env
      source env/bin/activate && pip install -r requirements.txt
      touch youtubevideolinks.txt
      deactivate
      echo -e "\U0001F4E6 Done~"
      ;;
    run)
      terminal=`tty`
      head
      echo -e "\U0001F4E6 Downloading.."
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
      echo -e "\U0001F4E6 Done~ saved on /home/$(whoami)/Music"
      exec < "$terminal"
      ;;
    *)
      head
      ;;
  esac
}

# main script
makeitrun $1
