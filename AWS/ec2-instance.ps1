#Parameters for Running the script
#update with the instance details
[string] $keyFile = "<file>.pem"    #change with your instance details
[string] $publicip = "ec2-user@<Public DNS Address>"    #change with your instance details

#view the security key file permissions
Write-Host "Current ACL permissions to the security file:"
Get-Acl $keyFile | fl

#add current user with read control to the security file
$acl = Get-Acl $keyFile
$uName = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($uName,"Read","Allow")
$acl.SetAccessRule($accessRule)
$acl | Set-Acl $keyFile

#Delete inherited permissions
$acl.SetAccessRuleProtection($true,$false)
$acl | Set-Acl $keyFile

Write-Host "ACL Permissions after disabling inheritance and adding full control access to current user:"
Get-Acl $keyFile | fl

# ssh to the ec2-instance
ssh -i $keyFile $publicip
