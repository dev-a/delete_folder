# delete_folder
Ce Script crée est un gestionnaire de répertoire temporaire: (par défaut) tout élement de plus de 7 jours sera supprimé
## Fonctionnement détaillé
* Chaque jour le script creer un répertoire à la date du jour
* si il existe des fichiers ou des répertoire à la racine ils seront déplacer dans le répertoire "date-du-jour/date-execution-du-script"
* Au bout de la periode définie (defaut 7 jour : $periode=7): le dossier de plus de 7 jours est supprimé 

## Version Windows
### Contrainte d'utilisation
Ce script powershell est devellopé sur la version 5 de powershell

Pour connaitre Votre version de PowerShell : 
> PS C:\Users\>  $PSVersionTable.PSVersion
Major: 5  Minor:1  Build:14393  Revision:1066
### pour ordonnancer le ps1 sous windows (10)
Planificateur de taches > "Démarrer un programme" > programme/script : powershell.exe > arguments : -ExecutionPolicy Bypass -file "C:\chemin\windows.ps1"


la version windows7.ps1 fonctionne sur windows7 avec powershell version

> Major:2  Minor:0  Build:-1  Revision:-1

## Debug
Si vous rencontrez de probleme lors de l'execution du script verifier l'encodage : ANSI
