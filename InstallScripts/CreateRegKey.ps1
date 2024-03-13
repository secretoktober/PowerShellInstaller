# Create Registry key
# Check hklm\software\Company exists
$CheckPath = test-path -path $CompanySoftRegKey
if(-not($CheckPath)){
    LogWrite ($CompanySoftRegKey + " does not exist. Creating.")
    New-Item -Path "HKLM:\Software" -Name "Company"
}
# Check hklm\software\Company\Apps exists
$CheckPath = test-path -path $AppsRegKey
if(-not($CheckPath)){
    LogWrite ($AppsRegkey + " does not exist. Creating.")
    New-Item -Path $CompanySoftRegKey -Name "Apps"
}
# Create key for Application being installed
# Check if key exists
$CheckPath = test-path -path $ApplicationRegKey
if(-not($CheckPath)){
    LogWrite ($ApplicationRegKey + " does not exist. Creating key.")
    New-Item -Path $AppsRegKey -Name $FriendlyName
}
# Check Value name exists
If ((Get-Item $ApplicationRegKey -EA Ignore).Property -contains "Version") {
    # If it exists delete it and create a new
    LogWrite ($ApplicationRegKey + " already exists. Deleting and Creating new entry.")
    Remove-ItemProperty -Path $ApplicationRegKey -Name "Version"
    New-ItemProperty -Path $ApplicationRegKey -Name "Version" -Value $Version -PropertyType "String"
} else {
    LogWrite ($ApplicationRegKey + " does not exist. Creating Value.")
    New-ItemProperty -Path $ApplicationRegKey -Name "Version" -Value $Version -PropertyType "String"
}