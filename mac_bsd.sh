#!/bin/bash
periode=7
foldername="tmp"
now=''
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
fi

#On parcours les repertoires existants
#Si un repertoire est trop ancien on le supprime
#si un repertoire n'est pas une date on le deplace dans le repertoire "date du jour/timestamp"
#si il y a des fichiers on les deplacent dans  "date du jour/timestamp"
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
			if [[ $now == "" ]];  then
				now=$(date +%s)
				mkdir ./$today/$now
			fi
			  mv  "$file" ./$today/$now/
			fi
		else
			if [[ $now == "" ]];  then
			  now=$(date +%s)
			  mkdir ./$today/$now
		fi
    mv "$file" "./$today/$now/"
	fi
done
