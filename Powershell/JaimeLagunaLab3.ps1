# 1a) Get a collection of network adapter

$Firstobject = Get-CimInstance Win32_NetworkAdapterConfiguration

# 1b) Pipeline with a where-object filter

$Firstobject = $Firstobject | Where-object IPEnabled -eq $True

# 1c) For each adapter that is configured just show some parameters

$Firstobject = $Firstobject | Select-Object Description,Index,IPAddress,IPSubnet,DNSHostName,DNSServerSearchOrder

# 1d) Format-table to format your output

$Firstobject = $Firstobject | 
 format-table -autosize @{n="Adapter Description"; e={$_.Description}},
 Index,
 @{n="IP Address(es)"; e={$_.IPAddress}},
 @{n="Subnet Mask(s)"; e={$_.IPSubnet}},
 @{n="DNS Domain Name  "; e={$_.DNSHostName}},
 @{n="DNS Server"; e={$_.DNSServerSearchOrder}}

$Firstobject
