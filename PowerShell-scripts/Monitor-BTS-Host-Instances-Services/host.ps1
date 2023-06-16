
#Get DB info
[STRING]$SQLInstance = get-wmiobject MSBTS_GroupSetting -namespace root\MicrosoftBizTalkServer | select-object -expand MgmtDbServerName
[STRING]$BizTalkManagementDb = get-wmiobject MSBTS_GroupSetting -namespace root\MicrosoftBizTalkServer | select-object -expand MgmtDbName
[STRING]$BizTalkGroup = "$SQLInstance" + ":" + "$BizTalkManagementDb"

# Get Host instances not running
[ARRAY]$hostInstances = get-wmiobject MSBTS_HostInstance  -namespace 'root\MicrosoftBizTalkServer' -filter '(HostType = 1 and ServiceState = 4)'

#Cancel if all host instances are running
#if ($hostInstances -eq $null) {exit}

Write-Host "There are  $($hostInstances.Count)  Host Instances not running in the BizTalk group $($BizTalkGroup)"


foreach ($hostInstance in $hostInstances)
{
    if ( $($hostInstance.HostName) -eq "CAPS_SX")
    {
        Write-Host "$($hostInstance.Name) : $($hostInstance.HostName) : $($hostInstance.ServiceState)"
        $hostInstance.Stop()
        sleep 10
        $hostInstance.Start()
    }
    
}
