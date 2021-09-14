# python script download list ytdl
import os
# tujuan="~/Documents"
print("its ytb-dl\nis it Many file?(y/n)")
mn=input()
if mn == 'y':
    print("\n\nBentar ya nyet...\n\n")
    filepath = 'youtubevideolinks.txt'
    with open(filepath, "r") as fp:
       filas = fp.readlines()
       for row in filas:
              os.system("youtube-dl -o '/home/rusagaib/Music.%(ext)s' -x --extract-audio --audio-format mp3 --audio-quality 0 "+row)
    print("Finished~~")
    fp.close()
else:
    inp=input("link-vid: ")
    print("\n\nOkke Bentar ya nyet...\n\n")
    os.system("youtube-dl -x --extract-audio --audio-format mp3 --audio-quality 0 "+inp)
    print("Finished~~")

# github.com/rusagaib
