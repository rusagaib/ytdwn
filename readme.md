### Quickstart :sparkles:

1. Clone or download rusagaib/ytdwn on your Home dir
    ```
    git clone https://github.com/rusagaib/ytdwn.git
    ``` 

2. cd to your-home-dir/ytdwn 
    ```
    cd ~/ytdwn
    ``` 

3. give executable permission
    ```
    sudo chmod +x ~/ytdwn/ytdwn.sh
    ``` 

4. installing ytdwn dependencies
    ```
    ./ytdwn.sh -init
    ```

5. paste some yt urls in ~/ytdwn/youtubevideolinks.txt 
you can also put many vid urls line by line on youtubevideolinks.txt file

5. for downloading mp3 from yt urls  
    ```
    ./ytdwn.sh run
    ```

6. music.mp3 will automaticaly on your ~/Music 

### Single download :musical_note: 
#### You can download single url by passing on args 

1. By giving -s command and yt urls
    ```
    ./ytdwn.sh -s yt-vids-url
    ```

2. Enjoy

### **New Features :tada:**  
#### You can now download yt playlist url :scream:

1. By giving -p command and add yt playlist urls (Public playlist url Only!)
    ```
    ./ytdwn.sh -p yt-playlist-url
    ```

2. All download playlist saved on `~/Music/playlist/<name - playlist>` with archive file.txt with given source url link :wave:


### For Better Usage:

You source-ing ./ytdwn.sh to your ~/.bashrc so you can run it by simply call ytdwn in your terminal :)

1. put this following line to your ~/.bashrc 

    ```
    export PATH=$PATH:$HOME/ytdwn
    export PATH=$PATH:$HOME/ytdwn/env/bin
    alias ytdwn='$HOME/ytdwn/ytdwn.sh'
    ```
2. re-run your ~/.bashrc config
    ```
    source ~/.bashrc
    ```
3. then you can run ytdwn without ./ sign
    ```
    ytdwn -h
    ```
    
