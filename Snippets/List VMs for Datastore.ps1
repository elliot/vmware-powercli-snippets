#
# Example:
# & '.\List VMs for Datastore.ps1' -Datastore SAS-R6-D1
#
param (
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
    $Datastore
)

Connect-VIServer vCenter01


($DS = Get-Datastore $Datastore) | % {
    $_ | Get-VM | % {
        $_ | Select @{N="VMname";E={$_.Name}},@{N="DSName";E={$DS.Name}} 
    }
}
