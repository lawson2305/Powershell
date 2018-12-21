$Domain = 'DOMAIN.com'
$DCs = Get-ADDomainController -filter "HostName -like '*'"
$OUTPUT = foreach ($DC in $DCs)
{
Get-DnsServerForwarder -ComputerName $DC | Select-Object @{n='Domain';Expression={$Domain}}, @{n='DNSServer';Expression={$DC}}, UseRootHint,IPAddress,timeout
}
$OUTPUT | Export-Csv -NoTypeInformation -path "DNSForwarders.csv"
