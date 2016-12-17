##replace oasis hostname in Oasis app config files

$computer = get-content env:computername

##Administrator 

    #hostname
    $file = "C:\Program Files (x86)\Aristocrat\OASIS PRIME\Administrator\Oasisadm.exe.config"
    $xml = [xml](Get-Content $file)
    $Target1 = "net.tcp://" + $computer + ":9567/OasisAdmin"
    $xml.configuration.'system.servicemodel'.services.service.endpoint.address = $Target1
    $xml.save($file)



##BonusPoints 

    #hostname
    $file = "C:\Program Files (x86)\Aristocrat\OASIS PRIME\BonusPoints\bp.exe.config"
    $xml = [xml](Get-Content $file)
    $Target2 = "net.tcp://" + $computer + ":9724/OasisAdmin"
    $xml.configuration.'system.servicemodel'.services.service.endpoint.address = $Target2
    $xml.save($file)



##Diagnostic Monitor 
    
    #hostname
    $file = "C:\Program Files (x86)\Aristocrat\OASIS PRIME\DiagnosticMonitor\DiagMon.exe.config"
    $xml = [xml](Get-Content $file)
    $Target3 = "net.tcp://" + $computer + ":9800/DiagnosticMonitor"
    $xml.configuration.'system.servicemodel'.services.service.endpoint.address = $Target3
    $xml.save($file)



##Marketing Manager 
    
    #hostname
    $file = "C:\Program Files (x86)\Aristocrat\OASIS PRIME\Marketing Manager\MarketingManager.exe.config"
    $xml = [xml](Get-Content $file)
    $Target4 = "net.tcp://" + $computer + ":9500/MarketingManager"
    $xml.configuration.'system.servicemodel'.services.service.endpoint.address = $Target4
    $xml.save($file)


##PitBOSS 

    #hostname
    $file = "C:\Program Files (x86)\Aristocrat\OASIS PRIME\PitBOSS\PitBOSS.exe.config"
    $xml = [xml](Get-Content $file)
    $Target5 = "net.tcp://" + $computer + ":9566/PitBOSS"
    $xml.configuration.'system.servicemodel'.services.service.endpoint.address = $Target5
    $xml.save($file)



##SuperPlaymate 

    #hostname
    $file = "C:\Program Files (x86)\Aristocrat\OASIS PRIME\Super-PlayMate\Super.exe.config"
    $xml = [xml](Get-Content $file)
    $Target6 = "net.tcp://" + $computer + ":9565/SuperPlayMate"
    $xml.configuration.'system.servicemodel'.services.service.endpoint.address = $Target6
    $xml.save($file)





