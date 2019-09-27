#https://stackoverflow.com/questions/3404642/how-can-i-get-powershell-exception-descriptions-into-a-string
#Gives good data like the full data from $error[0].InvocationInfo.PositionMessage
Function FriendlyErrorString ($thisError) {
    [string] $Return = $thisError.Exception
    $Return += "`r`n"
    $Return += "At line:" + $thisError.InvocationInfo.ScriptLineNumber
    $Return += " char:" + $thisError.InvocationInfo.OffsetInLine
    $Return += " For: " + $thisError.InvocationInfo.Line
    Return $Return
}

[string] $ErrorString = FriendlyErrorString $Error[0]
$ErrorString
