# **************************************
# Variables that should not need editing
# **************************************

# MSI $true if it is an MSI file or $false for an exe
If ($Install.Substring($install.Length -3)-eq "msi") {
    [bool]$Global:msi=$true
} else {
    [bool]$Global:msi=$false
}

# Set Software Directory
$Global:SoftwareRepo="\\" + $MDTServer + "\Software$"

# Set Date for logging
$Global:Date=Get-Date

# Path to C:\Users\Public
$Global:public = $env:PUBLIC

# Path to C:\Users\Public\Desktop
$Global:publicDesktop=$public+"\Desktop\"

# Run at startup RegKey
$Global:HKLocalRun="HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"

# Log Path
$Global:LogPath="C:\Windows\Company"
$Global:LogFile=$LogPath + "\" + $FriendlyName + "_" + $Version +".log"

# Create Install Path
$Global:InstallPath = $SoftwareRepo + "\" + $Folder + "\" + $Install

# Company Software Registry Key
$Global:CompanySoftRegKey = "HKLM:\Software\Company"

# Apps Registry key
$Global:AppsRegKey = $CompanySoftRegKey + "\Apps"

# Application RegistryKey
$Global:ApplicationRegKey = $AppsRegKey + "\" + $FriendlyName