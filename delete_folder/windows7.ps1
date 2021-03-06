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
$today = Get-Date -format yyyy-MM-dd
$working_folder = Get-Date –format ‘yyyy-mm-dd_HH-mm-ss’
if(!(Test-Path -Path $today )){
    New-Item -ItemType directory -Path $today
}

#on liste les repertoires existant 
#on les compare avec la date du jour-$periode (jours)
#on supprime ceux qui sont plus vieux que date du jour-$periode
$table = Get-ChildItem
foreach($folder in $table){
	if((Get-Item $folder) -is [System.IO.DirectoryInfo])
	{
	#on teste si le dossier corresponds à un repertoire de date sinon on le deplace
	if($folder.Name.ToString() -match "[0-9]{4}\-[0-9]{2}\-[0-9]{2}"){
		$folderdate=([datetime]::ParseExact($folder.Name.ToString(),”yyyy-MM-dd”,$null))
		$suppressdate=Get-Date (get-date).addDays(-$periode)
		if($folderdate -lt $suppressdate)
		{
		 Remove-Item -Recurse -Force $folder.Name
		}
		
		#Nouveau on supprime les dossiers vides créé par plantage qui ne servent a rien 	
		if((Get-Item $folder) -is [System.IO.DirectoryInfo])
		{
		Get-ChildItem $folder | where {$_.mode -like 'd*' } | where { @(gci $_.Fullname).count -eq 0} | remove-item
		echo $folder
		}
	
	}else{
	if(!(Test-Path -Path $today/$working_folder )){
		New-Item -ItemType directory -Path $today/$working_folder
	}
		
	
		Move-Item  -Force $folder.Name $today/$working_folder
	}
	}else{
	if(!(Test-Path -Path $today/$working_folder )){
		New-Item -ItemType directory -Path $today/$working_folder
	}

	Move-Item  -Force $folder.Name  $today/$working_folder
	}
}
