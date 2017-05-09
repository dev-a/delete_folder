# delete_folder
Ce Script crée un repertoire temporaire, tout élements de plus de 7 jours par défaut sera supprimé

(En réalité ce script crée des sous repertoire à la date du jour c'est c'est répertoires qui seront supprimer apres 7 jours)

# pour ordonnancer le ps1 sous windows (10)
planificateur de taches > "Démarrer un programme" > programme/script : powershell.exe > arguments : -ExecutionPolicy Bypass -file "C:\chemin\windows.ps1"
# quelle version pour le ps1
Le script Ps1 est fonctionnel sur la version suivante

PS C:\Users\>  $PSVersionTable.PSVersion

Major  Minor  Build  Revision

-----  -----  -----  --------

5      1      14393  1066
