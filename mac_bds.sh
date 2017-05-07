#!/bin/bash
clear;
periode=7
foldername="tmp"
now=''
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
for file in ./* ; do

  if [ -d "$file" ]; then
    echo "$file est un dossier"
    dir=${file%*/}
    if [[ $dir =~ [0-9]{4}\-[0-9]{2}\-[0-9]{2} ]]; then # echo 'cest une date';
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
      else
             echo "$file est un dossier sans date";
           if [[ $now == "" ]];  then
             now=$(date +%s)
             mkdir $now
           fi
          mv  "$file" ./$today/$now/

       fi
  else
    if [[ $now == "" ]];  then
      now=$(date +%s)
      mkdir $now
    fi
    mv $file ./$today/$now/
  fi
done
