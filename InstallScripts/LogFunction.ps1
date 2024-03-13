# Write to log
Function LogWrite
{
    Param([string]$logstring)
    $Date = (Get-Date).ToString("d.M.yyyy hh:mm:ss")
    $Log = $Date + " : " + $logstring
    Add-Content $LogFile -value $Log
}

# Check Company Log folder exists
if (Test-Path -Path $LogPath) {
    LogWrite "..."
} else {
    New-Item -Path $LogPath -ItemType Directory
    LogWrite "Created Company Log Folder"
}

# Start Logging
LogWrite "Application:"
LogWrite $FriendlyName
LogWrite "Version:"
LogWrite $Version
LogWrite "Install Date:"
LogWrite $Date
LogWrite