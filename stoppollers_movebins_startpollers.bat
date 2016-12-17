:: This batch file stops poller services, moves bins to created folder then starts poller services. :: 

for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
for /f "tokens=1-2 delims=/: " %%a in ("%TIME%") do (set mytime=%%a%%b)

psexec -accepteula \\oa-poller01 net stop ATI.FloorLogix.Poller.Client.Service
timeout /t 2
psexec -accepteula \\oa-poller02 net stop ATI.FloorLogix.Poller.Client.Service
timeout /t 2
psexec -accepteula \\oa-poller03 net stop ATI.FloorLogix.Poller.Client.Service
timeout /t 2
psexec -accepteula \\oa-pmt net stop ATI.FloorLogix.Poller.MidTier.Service
timeout /t 2
psexec -accepteula \\oa-mmt net stop ATI.FloorLogix.Meter.MidTier.Service
timeout /t 10

mkdir "\\oa-mmt\C$\Program Files (x86)\Aristocrat\OASIS PRIME\FloorLogix\Services\FloorLogix Meter Mid Tier Service\OldBin\%mydate%_%mytime%"

move "\\oa-mmt\C$\Program Files (x86)\Aristocrat\OASIS PRIME\FloorLogix\Services\FloorLogix Meter Mid Tier Service\*.bin" "\\oa-mmt\C$\Program Files (x86)\Aristocrat\OASIS PRIME\FloorLogix\Services\FloorLogix Meter Mid Tier Service\OldBin\%mydate%_%mytime%"
timeout /t 2

psexec -accepteula \\oa-mmt net start ATI.FloorLogix.Meter.MidTier.Service
timeout /t 2
psexec -accepteula \\oa-pmt net start ATI.FloorLogix.Poller.MidTier.Service
timeout /t 2
psexec -accepteula \\oa-poller01 net start ATI.FloorLogix.Poller.Client.Service
timeout /t 2
psexec -accepteula \\oa-poller02 net start ATI.FloorLogix.Poller.Client.Service
timeout /t 2
psexec -accepteula \\oa-poller03 net start ATI.FloorLogix.Poller.Client.Service

