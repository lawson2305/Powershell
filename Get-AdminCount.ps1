#
# Have a list of users and check for Inheritance and AdminCount value set.
#
# REQUIREMENTS: Create an array $AdminCount of the users you want to check
#

$output = foreach ($usr in $AdminCount)
{
$userinfo = Get-AdUser $usr -Properties name, AdminCount
$dn = $userinfo.DistinguishedName
$usr = [ADSI]"LDAP://$dn"
$acl = $usr.objectSecurity
# the following indicates whether inherited rights checkbox is cleared
$inherited = $acl.AreAccessRulesProtected
# the following indicates whether AdminCount is set
$admincount = $userinfo.admincount -ne $null
#Write-Host "Inherited: "$userinfo.name" $inherited"
#Write-Host "AdminCount: "$userinfo.name" $admincount"
 New-Object -TypeName PSObject -Property @{
    Name = "$userinfo.name"
    Inherited = $inherited 
    AdminCount = $admincount 
}|select-object name,inherited,admincount}
$output | Export-CSV c:\temp\admincount_Inherited.csv -NoTypeInformation
