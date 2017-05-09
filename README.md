# delete_folder
Ce Script crée un repertoire temporaire, (par défaut) tout élement de plus de 7 jours sera supprimé
## fonctionnement détaillé
* Chaque jour le script creer un repertoire à la date du jour
* si il existe des fichiers ou des répertoire à la racine ils seront déplacer dans le repertoire "date-du-jour/date-execution-du-script"
* Au bout de la periode définie (defaut 7 jour : $periode=7): le dossier de plus de 7 jours est supprimé 

# pour ordonnancer le ps1 sous windows (10)
planificateur de taches > "Démarrer un programme" > programme/script : powershell.exe > arguments : -ExecutionPolicy Bypass -file "C:\chemin\windows.ps1"
# quelle version pour le ps1
Le script Ps1 est fonctionnel sur la version suivante

PS C:\Users\>  $PSVersionTable.PSVersion

Major: 5  Minor:1  Build:14393  Revision:1066
