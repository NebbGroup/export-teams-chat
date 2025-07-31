# heavily based on https://github.com/massgravel/mas-docs/blob/main/get.ps1

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

# Enable TLSv1.2 for compatibility with older clients
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12





$out = "C:/export-teams-chats"

if ($IsMacOS -or $IsLinux) {
    pwsh -File "./Get-MicrosoftTeamsChat.ps1" -exportFolder $out

} else {
    try {
        pwsh.exe -File "./Get-MicrosoftTeamsChat.ps1" -exportFolder $out
    } catch [System.Management.Automation.CommandNotFoundException] {
        powershell.exe -File "./Get-MicrosoftTeamsChat.ps1" -exportFolder $out
    }
}