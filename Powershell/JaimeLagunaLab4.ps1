function System_Info1 {
	Write-Host "1)     COMPUTER SYSTEM     " -ForegroundColor blue -BackgroundColor white
	Get-WmiObject -class win32_computersystem | 
	foreach { 
		New-Object -TypeName psobject -Property @{
                	System_Name = $_.Name
			Manufacturer = $_.Manufacturer
			Model = $_.Model
			Domain = $_.Domain
			Description= $_.Description
			SystemType= $_.SystemType
                	"Total Physical Memory (GB)"=("{0:N1}" -f ($_.TotalPhysicalMemory/1gb))
                	}
        	} |
	Format-List System_Name,
		Manufacturer,
		Model,
		Domain,
		Description,
		SystemType,
		"Total Physical Memory (GB)"
}
function Operating_System1 {
	Write-Host "2)     OPERATING SYSTEM     " -ForegroundColor blue -BackgroundColor white
	Get-WMIObject -class win32_operatingsystem |
	foreach { 
		New-Object -TypeName psobject -Property @{
                	Operating_System_Name = $_.Caption
			Version = $_.Version
			Manufacturer = $_.Manufacturer
			OSArchitecture = $_.OSArchitecture
                	}
        	} |
	Format-List Operating_System_Name,
		Version,
		Manufacturer,
		OSArchitecture
}
function Processor1 {
	Write-Host "3)     PROCESSOR     " -ForegroundColor blue -BackgroundColor white
	Get-WMIObject -class win32_processor |
	foreach { 
		New-Object -TypeName psobject -Property @{
                	Manufacturer = $_.Manufacturer 
			"Type of processor" = $_.Name
			"Clock Speed (GHz)" = ("{0:N1}" -f ($_.CurrentClockSpeed/1000))
			"Number of Cores" = $_.NumberOfCores
			"L1 Size (MB)" = if ($_.L1CacheSize -eq $empty) 
					{"Data Unavailable"}
                    			else {("{0:N1}" -f ($_.L1CacheSize/1Mb))}  
			"L2 Size (MB)" = if ($_.L2CacheSize -eq $empty) 
					{"Data Unavailable"}
                    			else {("{0:N1}" -f ($_.L2CacheSize/1Mb))}
			"L3 Size (MB)" = if ($_.L3CacheSize -eq $empty) 
					{"Data Unavailable"}
                    			else {("{0:N1}" -f ($_.L3CacheSize/1Mb))}
                	}
        	} |
	Format-List Manufacturer,
		"Type of processor",
		"Clock Speed (GHz)",
		"Number of Cores",
		"L1 Size (MB)",
		"L2 Size (MB)",
		"L3 Size (MB)"
}
function Memory1 {
	Write-Host "4)     MEMORY     " -ForegroundColor blue -BackgroundColor white
	$TotalMemory = 0
Get-WMIObject -class win32_physicalmemory |
	foreach { 
		New-Object -TypeName psobject -Property @{
                	Vendor = $_.Manufacturer 
			Description = $_.Description
			"Memory Size (GB)" = ("{0:N1}" -f ($_.Capacity/1GB))
			"Dimm Bank" = if ($_.BankLabel -eq $empty) 
					{"Data Unavailable"}
                    			else {$_.BankLabel}  
			"Dimm Slot" = if ($_.DeviceLocator -eq $empty) 
					{"Data Unavailable"}
                    			else {$_.DeviceLocator}
                	}
		$TotalMemory += $_.Capacity
        	} |
	Format-Table -AutoSize Vendor,
		Description,
		"Memory Size (GB)",
		"Dimm Bank",
		"Dimm Slot"
write-host "Summary of RAM memory Installed (GB)" ("{0:N1}" -f ($TotalMemory/1GB))
}
function Drives1 {
	Write-Host "5)     DRIVES     " -ForegroundColor blue -BackgroundColor white
	Get-WMIObject -class win32_diskdrive
	Get-WMIObject -class win32_diskpartition
	Get-WMIObject -class win32_logicaldisk
	# summary of the physical disk drives with their vendor, model, size, and space usage
	# (size, free space, and percentage free) of the logical disks one logical disk per output line
	# Table Format
}
function Network1 {
	Write-Host "6)     NETWORK ADAPTER     " -ForegroundColor blue -BackgroundColor white -NoNewline
	JaimeLagunaLab3.ps1
}
function Video_Cards1 {
	Write-Host "7)     VIDEO CARDS     " -ForegroundColor blue -BackgroundColor white
	Get-WMIObject -class win32_videocontroller |
	foreach { 
		$vertical = ("{0:N0}" -f $_.currentverticalresolution) -as [string]
		$Horizontal = ("{0:N0}" -f $_.CurrentHorizontalResolution) -as [string]
		$Phrase = $Horizontal + " Pixels" + " X " + $vertical + " Pixels"
		New-Object -TypeName psobject -Property @{
			Description = $_.Description
			"Vendor" = if ($_.InfSection -eq $empty) 
					{"Data Unavailable"}
                    			else {$_.InfSection}
			"Screen Resolution" = $Phrase
                	}
        	} |
	Format-List Description,
		Vendor,
		"Screen Resolution"
}

#data unavailable in all cases

Write-Host ""
Write-Host "SYSTEM INFORMATION" -ForegroundColor blue -BackgroundColor white
Write-Host "=================="
Write-Host ""
System_Info1
Operating_System1
Processor1
Memory1
#Drives1
Network1
Video_Cards1