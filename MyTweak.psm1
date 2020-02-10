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
