##This script is meant to allow hotel personnel to restart visualone-int01 upon first report of a problem with this server.
##Only positions designated as local admins on visualone-int01 will be able to successfully run this script.
##This .ps1 has been compiled into an .exe for a more transparent experience for the end user, \\wrc\dfs\installs\scripts\RestartVisualOneInt01.exe

##Try will attempt to restart visualone-int01, any error will result in a stop of the script.
##If the restart-computer command is sent a success message will be displayed, solarwinds sends an email noting a restart.
try
{
    Restart-Computer -ComputerName visualone-int01 -force -ErrorAction Stop
  
    $wshell1 = New-Object -ComObject wscript.shell
    $wshell1.popup("visualone-int01 has been restarted. `n`nYou will receieve an email confirmation shortly",0,"Success",0x0)
}

##Catch will display a message for user to call MIS and a description of the specific error encountered.
Catch
{
    $wshell2 = New-Object -ComObject wscript.shell
    $ErrorMessage = $_.Exception.Message
    $wshell2.popup("That didn't work, please call MIS. `n`n$errormessage",0,"Error",0x0)
}
