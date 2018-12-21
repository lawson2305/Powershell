#
# Get all zone information for a Domain Zone
# 
$zone = 'DOMAIN.COM'
Get-DnsServerResourceRecord -Zonename $zone -ComputerName SERVER | Select-Object hostname, recordType, @{n='ZoneName';Expression={$zone}},@{n='Data';e={
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
        }
}}|FT
