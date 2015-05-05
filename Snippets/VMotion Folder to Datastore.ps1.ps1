#
# Example:
# & '.\VMotion Folder to Datastore.ps1' -Folder "Web Servers" -Datastore "SAS-R6-D1"
#

param (
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
    $Folder,

    [Parameter(Mandatory=$true,ValueFromPipeline=$true)] 
    [string] 
    $Datastore
)

Connect-VIServer -Server vCenter01

Get-VM -Location $Folder | Move-VM -Datastore (Get-Datastore $Datastore) -RunAsync
