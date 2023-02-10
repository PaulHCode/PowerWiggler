While($true){
    #For more details on battery status info to customize this script check this site: https://learn.microsoft.com/en-us/windows/win32/cimwin32prov/win32-battery
    $batteryStatus = Get-WmiObject win32_battery
    $badStatus = @(4,5,8,9) 
    $minChargeRemaining = 50

    ForEach($battery in $batteryStatus){
        If($battery.BatteryStatus -in $badStatus -or $battery.EstimatedChargeRemaining -lt $minChargeRemaining){
            [System.Windows.MessageBox]::Show("Your battery has an estimated $($battery.EstimatedChargeRemaining) percent remaining. Please wiggle the charging cable.")
        }
    }
    sleep -Seconds (5*60)
}
