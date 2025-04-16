<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 will be configured to prevent Windows apps from being activated by voice while the system is locked.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-15
    Last Modified   : 2025-04-15
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000365

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in PowerShell as Administrator to prevent apps from using voice activation when the screen is locked by setting LetAppsActivateWithVoiceAboveLock to 2.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000365.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set LetAppsActivateWithVoiceAboveLock to 2
Set-ItemProperty -Path $regPath -Name "LetAppsActivateWithVoiceAboveLock" -Value 2 -Type DWord

# Confirm the setting
Write-Output "'LetAppsActivateWithVoiceAboveLock' successfully set to 2 under $regPath"

