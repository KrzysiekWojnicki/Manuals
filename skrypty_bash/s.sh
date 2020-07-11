#!/bin/bash

Techlinked=https://www.youtube.com/channel/UCeeFfhMcJa1kjtfZAGskOCA/featured 
Trillseeker=https://www.youtube.com/channel/UCSbdMXOI_3HGiFviLZO6kNA/featured
Seeker=https://www.youtube.com/user/DNewsChannel/videos

# Techliked
 cd techlinked/ ;
 youtube-dl -q -f 18 $Techlinked --dateafter now-6days  --playlist-items 1-10 --download-archive archive ;
 cd /home/$USER ;


# Trill seeker
 cd trillseeker/ ;
  youtube-dl -q -f 18 $Trillseeker --dateafter now-3weeks --playlist-items 1-10 --download-archive archive ;
 cd /home/$USER

# Seeker
 cd Seeker/ ;
 youtube-dl -q -f 18 $Seeker --dateafter now-6days  --playlist-items 1-2 --download-archive archive ;
 cd /home/$USER ;


# co jeszcze
# - automatyczne tworzenie pliku archive
# - niech mi wysyła powiaomienia co ogląłem a co nie
# - kasownie starych
# - jedna funkcja?
# - tworzy katalog jeśli go niema, może jako chanel name?
