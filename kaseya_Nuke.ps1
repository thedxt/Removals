# kaseya Nuke
# Author: Daniel Keer
# Author URI: https://thedxt.ca
# Script URI: https://github.com/thedxt/Removals

# Check for 32 bit Kaseya and nuke if found
if (test-path "C:\Program Files (x86)\Kaseya")
    {
    write-host "Kaseya 32bit found"
    $32dir = dir "C:\Program Files (x86)\Kaseya"
    foreach ($line in $32dir)
        {
        $32name = $32dir.name
        cd "C:\Program Files (x86)\Kaseya\$32name"
        cmd /c "KASetup.exe /r /g $32name /l %TEMP%\kasetup.log /s"
        cd "C:\"     
        }
     start-sleep -s 240
     Remove-Item "C:\Program Files (x86)\Kaseya" -Recurse -Force -ErrorAction silentlycontinue
     write-host "Kaseya 32bit has been nuked"
    }
    Else
    {
    write-host "Kaseya 32bit was NOT found"
    }

# Check for 64 bit Kaseya and nuke if found
if (test-path "C:\Program Files\Kaseya")
    {
    write-host "Kaseya 64bit found"
    $64dir = dir "C:\Program Files\Kaseya"
    foreach ($line in $64dir)
        {
        $64name = $64dir.name
        cd "C:\Program Files\Kaseya\$name"
        cmd /c "KASetup.exe /r /g $64name /l %TEMP%\kasetup.log /s"
        cd "C:\"
        }
     start-sleep -s 240
     Remove-Item "C:\Program Files\Kaseya" -Recurse -Force -ErrorAction silentlycontinue
     write-host "Kaseya 64bit has been nuked"
    }
    Else
    {
    write-host "Kaseya 64bit was NOT found"
    }
    
# Check for Kaseya kworking and nuke if found
if (test-path "C:\kworking")
    {
    write-host "Kaseya kworking found"
    start-sleep -s 240
    Remove-Item "C:\kworking" -Recurse -Force -ErrorAction silentlycontinue
    write-host "Kaseya kworking has been nuked"
    }
    Else
    {
    write-host "Kaseya kworking was NOT found"
    }
