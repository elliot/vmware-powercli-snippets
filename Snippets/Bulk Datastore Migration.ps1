param(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
	$Cluster,
	
	[Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
	$Match,
	
	[Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
	$Datastore
)

if (!(Get-PSSnapin VMware.VimAutomation.Core -ErrorAction SilentlyContinue)) {
	Add-PSSnapin VMware.VimAutomation.Core
}

Connect-VIServer "vCenter01"

Get-VM | Where { $_.Name -like $Match } | Move-VM -Datastore $Datastore -RunAsAsync