#
# Example:
# & '.\Shutdown Host VMs.ps1' -Hostname dc1-esxi01
#

param (
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
    $Hostname
)

$Credential = Get-Credential
 
Connect-VIServer -Server $Hostname -Credential $Credential
 
Get-VM | % {
    Shutdown-VMGuest -VM $_ -Confirm:$false
}

Disconnect-VIServer -Confirm:$false
