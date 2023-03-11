Set-PowerCLIConfiguration -InvalidCertificateAction ignore -Confirm:$False 
Connect-VIserver -server sampleserver.local -user user@local.com -password "password"

#set up relevant parameters

#we want to clone the vApp to this host
$VMHost = "host-1.local" 

#we want to use this datastore. it must be on the above host
$myDatastore = Get-Datastore -Name "SSD-1"

$clonedvappname = "my-cloned-vapp"

#grab the vapp we want to copy by its name
$sourceVApp = Get-VApp -Name "my-source-vapp" 

#create new vApp with the parameters, with thin provisioning, and run this task in the background
$clonedVapp1 = New-VApp -VApp $sourcevApp -Location $VMHost -Datastore $myDataStore -Name $clonedvappname -DiskStorageFormat Thin -VMHost $VMHost -RunAsync

$clonedvappname = "my-cloned-vapp-2"

#do the same thing as above, with thin provisioning, but do not continue the script until cloning is done (remove async switch)
$clonedVapp2 = New-VApp -VApp $sourcevApp -Location $VMHost -Datastore $myDataStore -Name $clonedvappname -DiskStorageFormat Thin -VMHost $VMHost 