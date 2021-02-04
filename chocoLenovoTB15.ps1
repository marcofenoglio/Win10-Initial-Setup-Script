if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Set-MpPreference -EnableControlledFolderAccess Disabled

Write-Output "Installo Chocolatey" -ForegroundColor red -BackgroundColor white

Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable --name allowGlobalConfirmation

Write-Host "Installo i programmi" -ForegroundColor red -BackgroundColor white

$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile("https://www.to.infn.it/tosegr/Configurazione-W-X-P-N-T.xml","C:\Configurazione-W-X-P-N-T.xml")
choco install office365proplus --params '/ConfigPath:C:\Configurazione-W-X-P-N-T.xml'
Remove-Item C:\Configurazione-W-X-P-N-T.xml

choco feature enable -n=useRememberedArgumentsForUpgrades
choco install thunderbird
choco install firefoxesr
#choco pin add -n=firefoxesr
choco install microsoft-edge
choco install skype
choco install 7zip.install
choco install jre8  -PackageParameters "/exclude:32"
#choco pin add -n=jre8
choco install irfanview --params '/assoc=1 /group=1 /ini=%APPDATA%\IrfanView'
choco install irfanviewplugins
choco install vlc
choco install choco-upgrade-all-at --params "'/DAILY:yes /TIME:13:00 /ABORTTIME:14:00'"

$confirmation = Read-Host "Vuoi installare GIMP? [s/n]"
if ($confirmation -eq 's') {
    choco install gimp
}

#choco install choco-upgrade-all-at --params "'/WEEKLY:yes /DAY:SAT /TIME:18:00'"

Write-Output "Press any key to end installations..."
[void][System.Console]::ReadKey($true)

choco feature disable --name allowGlobalConfirmation

Set-ExecutionPolicy Restricted

Set-MpPreference -EnableControlledFolderAccess Enabled
