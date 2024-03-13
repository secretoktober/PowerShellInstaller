# Clean Up Scheduled Tasks
if ($delTasks.Count -gt 0) {
    foreach( $delTask in $delTasks ) 
        { 
        If (Get-ScheduledTask -TaskName $delTask -ErrorAction SilentlyContinue) { 
            LogWrite ("Removing Scheduled Task " + $delTask)
            Unregister-ScheduledTask -TaskName $delTask -Confirm:$false 
        }
    }
}