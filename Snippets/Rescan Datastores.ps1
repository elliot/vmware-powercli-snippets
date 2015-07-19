#
# Example:
# & '.\Rescan Datastores.ps1' -Cluster DC1
#
param (
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
    $Cluster
)

Connect-VIServer "vCenter01"

Get-Cluster $Cluster | Get-VMHost | Get-VMHostStorage -RescanAllHba -RescanVmfs