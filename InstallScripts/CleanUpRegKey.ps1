# Clean Up Registry 
if ($delRegValues.Count -gt 0) {
    foreach( $delRegValue in $delRegValues ) 
        { 
        if ((Get-ItemProperty -path $HKLocalRun).$delRegValue){ 
            LogWrite ("Removing registry key " + $delRegValue)
            Remove-ItemProperty $HKLocalRun -Name:$delRegValue 
        } 
     }
}