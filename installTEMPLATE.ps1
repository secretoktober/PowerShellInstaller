# Software Install script
# Steven Brown
# v0.11
# 26th May 2022

# **************************************
# Variables to edit
# **************************************

# Application Folder, Name of application folder
$Folder="Google_Chrome"

# Install exe or msi
$Install="googlechromestandaloneenterprise64.msi"

# Additonal Command switches
$Commands ="/qn"

# Installation Directory @()=NONE
$InstDir=@()

# AD Management Group @()=NONE
$ADGroup = @()

# Application Friendly Name for logging
$FriendlyName="Google_Chrome"

# Application Version
$Version="92.0.4515.131"

# Registry Values To Delete to remove Windows StartUp Entries. @()=NONE
$delRegValues = @()

# Scheduled task names to delete. @()=NONE
$delTasks = "GoogleUpdateTaskMachineCore","GoogleUpdateTaskMachineUA","MicrosoftEdgeUpdateTaskMachineCore","MicrosoftEdgeUpdateTaskMachineUA"


##########################################################################################

# Get MDT server name from Registry
$Global:MDTServer = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\company\' -Name MDTServer

$Global:InstallScripts="\\" + $MDTServer + "\Software$\InstallScripts"

#Set Variables
. $InstallScripts\Variables.ps1

# Create logs files and start logging
. $InstallScripts\logfunction.ps1

# Install Application
. $InstallScripts\InstallApp.ps1

# Create Registry key values
. $InstallScripts\CreateRegKey.ps1

# Set Folder Permissions
. $InstallScripts\FolderPermissions.ps1

# Clean Up Desktop
. $InstallScripts\CleanUpDesktop.ps1

# Clean Up Task Scheduler
. $InstallScripts\CleanUpTasks.ps1

# Clean Up Windows Run, HKLM:\Software\Microsoft\Windows\CurrentVersion\Run
. $InstallScripts\CleanUpRegKey.ps1

##########################################################################################

# End
LogWrite "Install finished "

#Exit the script
Exit 0