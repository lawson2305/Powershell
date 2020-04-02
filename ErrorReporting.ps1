<#
https://stackoverflow.com/questions/3404642/how-can-i-get-powershell-exception-descriptions-into-a-string
Gives good data like the full data from $error[0].InvocationInfo.PositionMessage
 modified by lawson2305
#>
Function FriendlyErrorString ($thisError) {
    [string] $Return = $thisError.Exception
    $Return += "`r`n"
    $Return += "At line:" + $thisError.InvocationInfo.ScriptLineNumber
    $Return += "`r`n"
    $Return += " char:" + $thisError.InvocationInfo.OffsetInLine
    $Return += "`r`n"
    $Return += " For Line: " + $thisError.InvocationInfo.Line
    $Return += "`r`n"
    $Return += " Invocation: " + $thisError.InvocationInfo.mycommand
    $Return += "`r`n"
    $Return += " Category: " + $thisError.categoryInfo
    $Return += "`r`n"
    $Return += " Category: " + $thisError.categoryInfo.TargetName
    Return $Return
}

[string] $ErrorString = FriendlyErrorString $Error[0]
$ErrorString
