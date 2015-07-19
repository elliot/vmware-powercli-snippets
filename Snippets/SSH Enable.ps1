Connect-VIServer vCenter01

Get-Cluster "Current" | Get-VMHost | ForEach { Start-VMHostService -HostService ($_ | Get-VMHostService | Where  {$_.Key -eq "TSM-SSH" }) -Confirm:$FALSE }