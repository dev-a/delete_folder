#Periode pour garder le repertoire
$periode=7
$foldername="tmp"
#Se placer sur le bureau
#tester si le repertoire $foldername existe 
#sinon on le crée
$DesktopPath = [Environment]::GetFolderPath("Desktop")
cd $DesktopPath
if(!(Test-Path -Path $foldername )){
    New-Item -ItemType directory -Path $foldername
}

#on se place dans le répertoire $foldername
#on verifie si il existe un repertoire pour aujourd'hui
#sinon on le crée
cd $foldername
$today = date -format yyyy-MM-dd
if(!(Test-Path -Path $today )){
    New-Item -ItemType directory -Path $today
}

#on liste les repertoires existant 
#on les compare avec la date du jour-$periode (jours)
#on supprime ceux qui sont plus vieux que date du jour-$periode
$table = Get-ChildItem -dir
foreach($file in $table){
	$folderdate=([datetime]::ParseExact($file.Name.ToString(),”yyyy-MM-dd”,$null))
	$suppressdate=Get-Date (get-date).addDays(-$periode)
	if($folderdate -lt $suppressdate)
	{
	 Remove-Item -Recurse -Force $file.Name
	}

}
