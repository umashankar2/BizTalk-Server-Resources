﻿Invoke-WmiMethod -Namespace root\MicrosoftBizTalkServer -Class MSBTS_DeploymentService -Name Export -ArgumentList $null, 'C:\Temp\Export\demo1.xml', 'neutral', 'BizTalkMgmtDb', 'C:\Temp\Export\demo1.txt', 'Demo', 'b79a8333a1e1f993', 'BTS2020LAB01', '1.0.0.0'