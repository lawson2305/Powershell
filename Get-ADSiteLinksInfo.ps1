Get-ADReplicationSiteLink -Filter * -Properties * | Select-Object name, cost, description, replinterval, options | Sort-Object options | ft * -AutoSize
