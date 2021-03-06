param(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
	$Cluster,
	
	[Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
	$VlanID
)


if (!(Get-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue)) {
	Add-PSSnapin VMware.VimAutomation.Core
}

Connect-VIServer "vCenter01"

$vCluster = Get-Cluster -Name $Cluster

$VMHosts = Get-VMHost -Location $vCluster

foreach ($VMHost in $VMHosts) {
	$vSwitches = Get-VirtualSwitch -VMHost $VMHost
	
	if ($vSwitches) {
		$vSwitches | % {
			$PortGroups = Get-VirtualPortGroup -VirtualSwitch $_
			
			if ($PortGroups) {
				$PortGroups | % {
					if ($VlanID -eq $_.VLanId) {
						Write-Host "Removing Port Group $($_.Name) on $VMHost"
						
						Remove-VirtualPortGroup -VirtualPortGroup $_
					}
				}
			}
		}
	}
}

