#Fichier a surveiller
$watch_file = "C:\Users\user\Desktop\modele.txt"
#nom a surveiller
$watch_file_name = "modele.txt"
#Fichier de travail de travail
$work_file = "C:\Users\user\Desktop\workdir\md5.txt"
#repertoire de copy
$copy_folder = "C:\Users\user\Desktop\workdir"

while($true)
{

	$hash_b = Get-Content $work_file


	$someFilePath = $watch_file
	$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
	$hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($someFilePath)))

	$hash | Out-File $work_file

	if($hash -eq $hash_b )
	{
		echo "meme fichier"
	}else{
		echo "fichier different"
		$var = $((Get-Date).ToString('yyyy-MM-dd HH-mm-ss'))
		New-Item -ItemType Directory -Path $copy_folder\$var
		cp $watch_file $copy_folder\$var\$watch_file_name
	}
	write-host "Waiting: .. " -nonewline
	Start-Sleep -s 10
	write-host " .. " -nonewline
	Start-Sleep -s 10
	write-host " .. " -nonewline
	Start-Sleep -s 10
	write-host " .. " -nonewline
	Start-Sleep -s 10
	write-host " .. " -nonewline
	Start-Sleep -s 10
	write-host " .. " -nonewline
	Start-Sleep -s 10
	write-host " .. "
}
