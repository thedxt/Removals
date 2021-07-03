# N-Able Nuke
# Author: Daniel Keer
# Author URI: https://thedxt.ca
# Script URI: https://github.com/thedxt/Removals

# find the version uninstall string
$VersionFinder = Get-ChildItem -Path HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match 'Windows Agent'}

# remove it
msiexec.exe /x $VersionFinder.PSChildName /qn

# wait for the uninstall to be done
start-sleep -s 240

# kill processes
Get-Process | Where {$_.ProcessName -Like "BASup*"} | Stop-Process -force

# nuke left over folder
Remove-Item "C:\Program Files (x86)\BeAnywhere Support Express" -Recurse -Force -ErrorAction silentlycontinue
Remove-Item "C:\Program Files (x86)\N-able Technologies" -Recurse -Force -ErrorAction silentlycontinue

# nuke left over reg keys
Remove-Item -Path 'HKLM:\SOFTWARE\WOW6432Node\N-able Technologies' -Recurse
Remove-Item -Path 'HKLM:\SOFTWARE\N-able Technologies' -Recurse

# output
write-host "N-Able Nuke is completed"
