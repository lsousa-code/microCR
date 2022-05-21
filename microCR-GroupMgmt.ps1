'Account Operators',  `
'Administrator',
'Administrators',
'Allowed RODC Password Replication Group',
'Backup Operators',
'Cert Publishers',
'Certificate Service DCOM Access',
'Cloneable Domain Controllers',
'Cryptographic Operators',
'Debugger Users',
'DHCP Administrators',
'DHCP Users',
'Distributed COM Users',
'DnsAdmins',
'DnsUpdateProxy',
'Domain Admins',
'Domain Controllers',
'Enterprise Admins',
'Enterprise Read-only Domain Controllers',
'Group Policy Creator Owners',
'Hyper-V Administrators',
'Incoming Forest Trust Builders',
'Network Configuration Operators',
'Pre-Windows 2000 Compatible Access',
'Print Operators',
'RAS and IAS Servers',
'RDS Endpoint Servers',
'RDS Management Servers',
'RDS Remote Access Servers', 
'Read-only Domain Controllers',
'Remote Management Users',
'Replicator',
'Schema Admins',
'Server Operators',
'Terminal Server License Servers',
'Windows Authorization Access Group',
'WinRMRemoteWMIUsers_' | ForEach-Object {
    $groupName = $_; $groupName;
    Get-ADGroupMember -Identity $_ -Recursive | Get-ADUser -Properties *   | ft -Property Name,Enabled,objectClass,PasswordLastSet,whenChanged,whenCreated
               where { $_.passwordNeverExpires -eq "true" } | Select-Object Name, DisplayName, @{n='GroupName';e={ $groupName } }
}
 

