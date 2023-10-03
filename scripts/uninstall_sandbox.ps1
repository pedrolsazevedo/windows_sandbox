# Check if the script is running with administrative privileges
$isAdmin = ([System.Security.Principal.WindowsPrincipal] [System.Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    # If not running with admin privileges, request elevation and restart the script
    Write-Host "This script requires administrative privileges to uninstall Windows Sandbox."
    Write-Host "Requesting elevation..."
    Start-Process powershell.exe -ArgumentList " -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Check if Windows Sandbox is installed
$featureStatus = Get-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -Online

if ($featureStatus.State -eq "Enabled") {
    # Disable Windows Sandbox
    Write-Host "Disabling Windows Sandbox feature..."
    Disable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -Online -All

    # Prompt to restart the computer
    Write-Host "Windows Sandbox has been disabled. Please restart your computer to apply the changes."
} else {
    Write-Host "Windows Sandbox is already disabled."
}
