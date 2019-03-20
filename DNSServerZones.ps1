#
# Get all zone information for all zones on server
# 

$DNSServer = "SERVER"
$Zones = @(Get-DnsServerZone -computername $DNSServer)

$DNS = ForEach ($Zone in $Zones) {
Get-DnsServerResourceRecord -Zonename $zone.ZoneName -ComputerName $DNSServer | Select-Object hostname, recordType, @{n='ZoneName';Expression={$zone.ZoneName}},@{n='Data';e={

    $rr = $_

    switch ($rr.RecordType) {
        'A'     {$rr.RecordData.IPv4Address}
        'CNAME' {$rr.RecordData.HostnameAlias}
        'NS' {$rr.RecordData.NameServer}
        'SOA' {$rr.RecordData.PrimaryServer}
        'SRV' {$rr.RecordData.DomainName}
        'PTR' {$rr.RecordData.PtrDomainName}
        'MX' {$rr.RecordData.MailExchange}
        'AAAA' {$rr.RecordData.IPv6Address}
        'TXT' {$rr.RecordData.DescriptiveText}
        }}}
}

$DNS | Export-Csv -NoTypeInformation -Path C:\Temp\dns2.csv
