#!/bin/bash
periode=7
foldername="tmp"
echo $periode $foldername
#Se placer sur le bureau
#tester si le repertoire $foldername existe
#sinon on le crée
cd ~/Desktop
if [ ! -d $foldername ]; then
  mkdir $foldername
fi
#on se place dans le répertoire $foldername
#on verifie si il existe un repertoire pour aujourd'hui
#sinon on le crée
cd  $foldername
today=$(date +%Y-%m-%d)

if [ ! -d $today ]; then
  mkdir $today
  echo "je creer $today"
fi
for file in ./*/ ; do

  if [ -d $file ]; then
    dir=${file%*/}
    #on test si la date est + ou -
    folderdate='date -j -f %Y-%m-%d '${dir##*/}' +%Y%m%d'
    folderdate=$(eval $folderdate)

     suppressdate='date -v -'$periode'd +%Y%m%d'
     suppressdate=$(eval $suppressdate)

        if [ $folderdate -lt $suppressdate ]
        then
         echo "je garde "${dir##*/}
         rm -R ${dir##*/}
        fi
  fi
done
