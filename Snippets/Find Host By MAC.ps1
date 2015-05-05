#
# Example:
# & '.\Find Host By MAC.ps1' -MAC 00:00:00:00:00
#

param (
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
    $MAC
)

Connect-VIServer -Server vCenter01

Get-VMHost | Get-VMHostNetworkAdapter | Where-Object {$_.Mac -eq $MAC} | Format-List -Property *
