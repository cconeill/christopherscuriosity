#Find Jackpot fill station with Booth 10 Window 05

#Generates hostnames.txt from AD
Get-ADComputer -SearchBase 'OU=WRC Workstations, DC=wrc,DC=net' -Filter '*' | Select -Expand Name | set-content C:\users\chris.oneill\desktop\hostnames.txt

#Variables
$filetofind = "C$\Program Files (x86)\Aristocrat\Oasis PRIME\JackpotFill\Aristocrat.OASIS.Presentation.JackpotFill.exe.config"
$hostnamestxt = 'C:\users\chris.oneill\desktop\hostnames.txt'
$computers = get-content "$hostnamestxt"

#Will ping each computer in hostnames.txt, if ping is successful it will search for the string. Fails if no ping or returns look again if file not found.
foreach($computer in $computers)
{
ping -n 1 $computer >$null
if($LASTEXITCODE -eq 0)
{ 
if (Select-String -Pattern 'boothNumber="14" window="24"' -Path \\$computer\$filetofind)
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
