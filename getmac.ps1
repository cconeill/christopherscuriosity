# Create empty hash table
$macHash=@{}
# Load a list of machine names
Get-ADComputer -SearchBase 'OU=WRC Subnet,OU=WRC Workstations, DC=wrc,DC=net' -Filter '*' | Select -Expand Name | set-content C:\users\chris.oneill\desktop\hostnames.txt
$servers=get-content c:\users\chris.oneill\desktop\hostnames.txt

#checks each hostname for mac
foreach ($server in $servers) {
   if (Test-Connection $server -quiet) {   # if it responds to a Ping
      # Call the GetMac utility
      $getmac=getmac /nh /fo csv /s $server
      $macAddresses=$getmac -split ","
      $interface = 1
      $macAddresses | foreach {
         if ($_ -ne ""){
            # check for a '-' to see if we have a mac address
            if ($_.substring(3,1) -eq "-") {
               # Remove quotes
               $addr = $_.replace("""","")
               $adapter = $interface/2
               Echo "$server  Adapter:$adapter  $addr"
               # Save in the hash variable
               $macHash.add("$server Adapter:$adapter",$addr)
            }
         }
      $interface += 1
      }
   }
}
# Export the hash table to a spreadsheet
$macHash.GetEnumerator() | select name, value | Sort-Object Name | Export-CSV -Path "c:\users\chris.oneill\desktop\mac.csv" -NoTypeInformation