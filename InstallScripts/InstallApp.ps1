#Install Application
if ((Get-ItemProperty -path $InstallPath)) {
    if ($msi) {
        # If MSI
        $MSIInstall="/I " + $InstallPath + " " + $Commands
        LogWrite ("Installing MSI  Start-Process msiexec.exe -Wait -ArgumentList " + $MSIInstall )
        $InstallProcess = Start-Process msiexec.exe -PassThru -Wait -NoNewWindow -ArgumentList $MSIInstall
        $ExitCode = $InstallProcess.ExitCode
        If ($ExitCode -eq 0){ 
            LogWrite ("Installation was successfull: Exit code " + $ExitCode)
        } Else {
            LogWrite ("Installation Failed with Exit Code " + $ExitCode)
        }
    } Else {
         # Not MSI
        
        LogWrite ("Installing NON MSI with command: Start-Process $InstallPath -PassThru -NoNewWindow -ArgumentList $Commands")
        
        # Run the install
        $InstallProcess = Start-Process $InstallPath -PassThru -NoNewWindow -ArgumentList $Commands
        
        # Wait for the $InstallProcess to finish before continuing
        while ($InstallProcess.HasExited -eq $false){
            start-sleep 5
        }
        LogWrite ("Installation : Exit Code " + $LASTEXITCODE)         
    }
}
