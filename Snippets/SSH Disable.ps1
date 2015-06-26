Connect-VIServer vCenter01

Get-Cluster | Get-VMHost | ForEach { Stop-VMHostService -HostService ($_ | Get-VMHostService | Where  {$_.Key -eq "TSM-SSH" }) -Confirm:$FALSE }