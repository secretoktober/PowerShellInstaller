# Set Application Folder Permissions
if ($InstDir.Count -gt 0) {
    foreach($InstDirValue in $InstDir) {
        if (Test-Path -Path $InstDirValue) {
            LogWrite ("Application Path Exists. Setting folder permissions for " + $ADGroup + " for path " + $InstDirValue)
            # Add AD group
            $Command = '"'+$InstDirValue+'"' + " /inheritance:d /grant " + $ADGroup + ":(OI)(CI)(M) /T"
            $SetPermissions = Start-Process icacls -PassThru -Wait -NoNewWindow -ArgumentList $Command
            #Remove Local Users
            $Command = '"'+$InstDirValue+'"' + " /remove:g .\Users /T"
            $SetPermissions = Start-Process icacls -PassThru -Wait -NoNewWindow -ArgumentList $Command
        } else {
            LogWrite ("Unable to find Application path : " + $InstDirValue)
        }
    }
}