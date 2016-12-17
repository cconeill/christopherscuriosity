#Find a folder

#Generates hostnames.txt from AD for hosts you want to search
Get-ADComputer -SearchBase 'OU=WRC Servers, DC=wrc,DC=net' -Filter '*' | Select -Expand Name | set-content C:\users\chris.oneill\desktop\hostnames.txt

#Variables, the folder to find
$foldertofind = "C:\Windows\dver"
$hostnamestxt = 'C:\users\chris.oneill\desktop\hostnames.txt'
$computers = get-content "$hostnamestxt"

#Will ping each computer in hostnames.txt, if ping is successful it will search for the folder. Fails if no ping or returns look again if file not found.
foreach($computer in $computers)
{
ping -n 1 $computer >$null
if($LASTEXITCODE -eq 0)
{ 
if (test-path $foldertofind)
{    
    write-host -ForegroundColor Green "$computer Match!"
}
else
{   
    write-host "Look again"
}
}

else 
{  
    write-host "$computer OFFLINE"
}
}
