#!/bin/bash
# use default home directory or replace it it's up to you..
dir=$HOME/ytdwn/
function head {
  echo "         __      __              "
  echo "  __  __/ /_____/ /      ______  "
  echo " / / / / __/ __  / | /| / / __ \ "
  echo "/ /_/ / /_/ /_/ /| |/ |/ / / / / "
  echo "\__, /\__/\__,_/ |__/|__/_/ /_/  "
  echo "/____/ Download any mp3 from ytb~"
  echo ""
  echo ":~\$ ./ytdwn.sh run (default-MULTI-DOWNLOADS)"
  echo ":~\$ ./ytdwn.sh -s <link-url> (Single-DOWNLOAD)"
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
      echo -e "For Multiple Download:"
      echo "1. just copy-paste ytb all video/music url to youtubevideolinks.txt"
      echo "2. ./ytdwn.sh run"
      echo -e "3. enjoy \U0001F601"
      echo -e "Single Download:"
      echo -e "1. ./ytdwn.sh -s <link-url>"
      echo -e "2. Enjoyy..."
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
    -s)
  	  link_vid=$2
  	  if [[ -z $link_vid ]];
  	  then
  	  	echo -e "Link not Found!!!"
  	  else
  		  head
  	    echo -e "\U0001F4E6 Downloading.."
  	    ENV_DIR=${dir}/env/bin/activate
  	    echo ${ENV_DIR}
  	    source ${ENV_DIR}
  		  cd ~/Music
  	    youtube-dl -f 18 -x --extract-audio --audio-format mp3 --audio-quality 0 "$link_vid"
  	    deactivate
  	    cd ${dir}
  	    echo -e "\U0001F4E6 Done~ saved on /home/$(whoami)/Music"
  	  fi
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
makeitrun $1 $2
