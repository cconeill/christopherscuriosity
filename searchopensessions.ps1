##Finds and emails all open sessions on servers

#variables
$today = get-date
$subject = “ACTIVE SERVER SESSIONS REPORT `- ” + $today
$priority = “Normal”
$smtpServer = “10.102.165.2"
$emailFrom = “sessionsreport@wildhorseresort.com”
$emailTo = “chris.oneill@wildhorseresort.com”
$Servers = Get-ADComputer -LDAPFilter "(name=*)" -SearchBase "OU=WRC Servers,DC=wrc,DC=net"
$user = read-host -Prompt "Input user name"

#Queries each server in OU WRC Servers for open session with the above username. Sends email with positive result.
ForEach ($Server in $Servers) {
$ServerName = $Server.Name
Write-Host “Querying $ServerName”
$results = qwinsta $user /server:$servername
if ($results -eq $null) {
write-host "$user not logged in to $servername"
}
else {
Send-MailMessage -To $emailTo -Subject $subject -Body "$servername is logged in by $user" -SmtpServer $smtpServer -From $emailFrom -Priority $priority
}
}