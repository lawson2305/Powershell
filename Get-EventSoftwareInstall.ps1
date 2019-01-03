#
# Change the APPNAME below to contain something else.  Leave the * values for wildcard before and after
# Add in your computers you want to check in the array $Servs
#

$query = @'
<QueryList>
  <Query Id="0" Path="Application">
    <Select Path="Application">*[System[Provider[@Name='MsiInstaller'] and (EventID=1040 or EventID=11707 or EventID=11724)]]
</Select>
  </Query>
</QueryList>
'@

#$events = Get-WinEvent  -FilterXml $Query
$Servs = 
"Computer1",
"Computer2"

$events = ForEach ($Serv in $Servs) {
    Get-WinEvent -ComputerName $Serv  -FilterXml $Query
}
$Events | Where {$_.Message -like "*APPNAME*"}| Select TimeCreated, Id, MachineName,userID,message | Out-GridView
