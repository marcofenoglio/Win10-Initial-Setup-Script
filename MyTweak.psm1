# My Uninstall default Microsoft applications
Function MyUninstallMsftBloat {
	Param ([switch]$AllUsers)
	Write-Output "Uninstalling default Microsoft applications..."
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.BingWeather" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Getstarted" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Messaging" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Microsoft3DViewer" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.MicrosoftSolitaireCollection" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.MicrosoftStickyNotes" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.MixedReality.Portal" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.MSPaint" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.NetworkSpeedTest" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Office.Desktop" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Office.Desktop.Access" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Office.Desktop.Excel" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Office.Desktop.Outlook" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Office.Desktop.PowerPoint" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Office.Desktop.Publisher" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Office.Desktop.Word" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Office.OneNote" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.People" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Print3D" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.ScreenSketch" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.SkypeApp" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.WindowsAlarms" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.WindowsCamera" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "microsoft.windowscommunicationsapps" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.WindowsFeedbackHub" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.WindowsMaps" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Windows.Photos" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.YourPhone" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.ZuneMusic" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.ZuneVideo" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "Microsoft.Advertising.Xaml" | Remove-AppxPackage -AllUsers:$AllUsers # Dependency for microsoft.windowscommunicationsapps, Microsoft.BingWeather
}

# My Uninstall default third party applications
function MyUninstallThirdPartyBloat {
	Param ([switch]$AllUsers)
	Write-Output "Uninstalling default third party applications..."
	Get-AppxPackage -AllUsers:$AllUsers "2414FC7A.Viber" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "7EE7776C.LinkedInforWindows" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "AD2F1837.HPJumpStart" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "king.com.BubbleWitch3Saga" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "king.com.CandyCrushFriends" | Remove-AppxPackage -AllUsers:$AllUsers
	Get-AppxPackage -AllUsers:$AllUsers "king.com.CandyCrushSaga" | Remove-AppxPackage -AllUsers:$AllUsers
}

# My Uninstall default Microsoft applications for all users - Note: This function has no counterpart.
Function MyUninstallMsftBloatAllUsers {
	MyUninstallMsftBloat -AllUsers
}

# My Uninstall default third party applications for all users - Note: This function has no counterpart.
Function MyUninstallThirdPartyBloatAllUsers {
	MyUninstallThirdPartyBloat -AllUsers
}

# My Uninstall HP Preinstalled Programs
Function MyUninstallHPPreinstalledPrograms {
	Write-Output "Uninstalling HP Preinstalled Programs..."
	$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP Client Security Manager"}
	$MyApp.Uninstall()
	$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP JumpStart Bridge"}
	$MyApp.Uninstall()
	$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP JumpStart Launch"}
	$MyApp.Uninstall()
	$MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "HP Sure Click"}
	$MyApp.Uninstall()
}

# Set power plan to High Performance
Function SetPowerPlanToHighPerformance {
        Write-Output "Setting power plan to High Performance"
        PowerCfg -SetActive '8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c'
}

# Set IP Address
Function MySetIPAddress {
	Write-Output "Configura la scheda di rete" -ForegroundColor red -BackgroundColor white
	$IP = Read-Host "Indicare la parte finale dell'IP da assegnare alla rete 193.206.184.*/27?"
	if ($IP -ne '') {
	    New-NetIPAddress -IPAddress 193.206.184.$IP -DefaultGateway 193.206.184.254 -PrefixLength 27 -InterfaceIndex (Get-NetAdapter).InterfaceIndex
	    Set-DNSClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ServerAddresses ("192.84.137.2","192.84.137.1")
	}
	Start-Sleep -Seconds 15
	nslookup www.to.infn.it
	$connected = Read-Host "In rete? [s|n]"
	if ($connected -ne "s") {
	    Start-Sleep -Seconds 15
	}
}

##########
# Function from Boxstarter https://boxstarter.org/
##########

# Enable Windows Explorer to show the Ribbon menu so that it is always expanded
# From Boxstarter.WinConfig/Set-WindowsExplorerOptions.ps1
Function MyEnableShowRibbon {
	Write-Output "Showing always Windows Explorer Ribbon menu..."
	Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" MinimizedStateTabletModeOff 0
}

# Allows Remote Desktop access to machine and enables Remote Desktop firewall rule
# From Boxstarter.WinConfig/Enable-RemoteDesktop.ps1
Function MyEnableRemoteDesktop {
<#
.SYNOPSIS
Allows Remote Desktop access to machine and enables Remote Desktop firewall rule
.PARAMETER DoNotRequireUserLevelAuthentication
Allows connections from computers running remote desktop
without Network Level Authentication (not recommended)
.LINK
https://boxstarter.org

#>
	param(
		[switch]$DoNotRequireUserLevelAuthentication
	)
	Write-Output "Enabling Remote Desktop..."
	$obj = Get-WmiObject -Class "Win32_TerminalServiceSetting" -Namespace root\cimv2\terminalservices
	if($null -eq $obj) {
		Write-Output "Unable to locate terminalservices namespace. Remote Desktop is not enabled"
		return
	}
	try {
		$obj.SetAllowTsConnections(1,1) | Out-Null
	}
	catch {
		throw "There was a problem enabling remote desktop. Make sure your operating system supports remote desktop and there is no group policy preventing you from enabling it."
	}
	$obj2 = Get-WmiObject -class Win32_TSGeneralSetting -Namespace root\cimv2\terminalservices -ComputerName . -Filter "TerminalName='RDP-tcp'"
	if($null -eq $obj2.UserAuthenticationRequired ) {
		Write-Output "Unable to locate Remote Desktop NLA namespace. Remote Desktop NLA is not enabled"
		return
	}
	try {
		if($DoNotRequireUserLevelAuthentication) {
			$obj2.SetUserAuthenticationRequired(0) | Out-Null
			Write-Output "Disabling Remote Desktop NLA ..."
		}
		else {
			$obj2.SetUserAuthenticationRequired(1) | Out-Null
			Write-Output "Enabling Remote Desktop NLA ..."
		}
	}
	catch {
		throw "There was a problem enabling Remote Desktop NLA. Make sure your operating system supports Remote Desktop NLA and there is no group policy preventing you from enabling it."
	}
}

##########

# Set INFN Torino Wallpaper
Function SetWallpaper {
<#
.SYNOPSIS
Set desktop wallpaper.
.DESCRIPTION
This script desktop wallpaper if the current users using SystemParametersInfo function in the User32.dll.
.PARAMETER FilePath
Path of the wallpaper file.
.EXAMPLE
./Set-Wallpaper.ps1 "C:\Images\Wallpaper.png"
Set desktop wallpaper to the file C:\Images\Wallpaper.png.
.NOTES
Author:  Ermanno Goletto
Blog:    www.devadmin.it
Date:    06/04/2018 
Version: 1.0 
.LINK
https://github.com/ermannog/PowerShell/tree/master/Set-Wallpaper
#>

	Param(
		[Parameter(Mandatory=$True)]
		[String]$FilePath,
		[ValidateSet('Center','Fill','Fit', 'Streatch', 'Tile')]
		[String]
		$Location = 'Center'
	)
  
  
	# Define a class PInvoke in the namespace Win32Functions with a method SystemParametersInfo for call the function SystemParametersInfo in the User32.dll
	Set-Variable MemberDefinition -Option Constant -Value @"
<System.Runtime.InteropServices.DllImport("User32.dll")> 
Public Shared Function SystemParametersInfo(ByVal uiAction As System.UInt32, 
											ByVal uiParam As System.UInt32, 
											ByVal pvParam As System.String, 
											ByVal fWinIni As System.UInt32) As System.Int32
	' Returns non-zero value if function succeeds
End Function
"@
  
	Add-Type -MemberDefinition $MemberDefinition -Name "PInvoke" -Namespace Win32Functions -Language VisualBasic
  
  	# Set WallPaper using SystemParametersInfo function in the User32.dll
  	Set-Variable SPI_SETDESKWALLPAPER -Option Constant -Value 0x0014
  	Set-Variable SPIF_UPDATEINIFILE -Option Constant -Value 0x01
  	Set-Variable SPIF_SENDCHANGE -Option Constant -Value 0x02
	
	[Win32Functions.PInvoke]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $FilePath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
  
  
	# Set Wallpaper location
  	Switch ( $Location )
	{
		Center
			{
		  	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallpaperStyle -Value 0
		  	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name TileWallpaper -Value 0
			}
	  	Tile
	   	{
		  	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallpaperStyle -Value 0
		  	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name TileWallpaper -Value 1
	   	}
	  	Streatch
	   	{
		  	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallpaperStyle -Value 2
	   	}
	  	Fit
		{
		  	Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallpaperStyle -Value 6
			Write-Output "Fit Fit Fit"
		}
	  	Fill
		{
			Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallpaperStyle -Value 10
	  	}
	}	
}

Function SetINFNWallpaper {
	Write-Output "Setting INFN Wallpaper..."
	$WPURI='https://www.to.infn.it/tosegr/INFN%20Torino%20Wallpaper.jpg'
	$WPFILE='C:\Wallpaper.jpg'
	$WPWebClient = New-Object System.Net.WebClient
	$WPWebClient.DownloadFile($WPURI,$WPFILE)
	SetWallpaper $WPFILE -Location Fit
	Remove-Item $WPFILE
}