param ( $Show )
if ( !$Show ) 
{
    PowerShell -NoExit -File $MyInvocation.MyCommand.Path 1
    return
}

$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://exchangembx.wrc.net/PowerShell/ -Authentication Kerberos -Credential $UserCredential

Import-PSSession $Session

$a = new-object -comobject wscript.shell
$b = $a.popup("Don't forget to Remove-PSSession $session after you're done.",5,"Reminder",1)

