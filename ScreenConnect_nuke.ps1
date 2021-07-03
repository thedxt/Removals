# ScreenConnect Nuke
# Author: Daniel Keer
# Author URI: https://thedxt.ca
# Script URI: https://github.com/thedxt/Removals

# tell what you are doing
write-host "Searching for ScreenConnect Installs"

# finds all instances of ScreenConnect
$app = Get-WmiObject -Class Win32_Product | Where-Object { 
    $_.Name -match "ScreenConnect Client" 
}
# run the uninstall
$app.Uninstall()

# tell that you are done
Write-host "ScreenConnect Nuke is completed"
