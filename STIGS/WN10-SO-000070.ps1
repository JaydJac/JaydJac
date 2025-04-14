<#
.SYNOPSIS
    This PowerShell script ensures that the machine inactivity limit will be set to 15 minutes, locking the system with the screensaver.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-14
    Last Modified   : 2025-04-14
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000070

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in PowerShell as Administrator to enforce a 15-minute inactivity timeout by setting `InactivityTimeoutSecs` to 900 seconds.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000070.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the InactivityTimeoutSecs to 900 seconds (decimal), which is 0x384 in hex
Set-ItemProperty -Path $regPath -Name "InactivityTimeoutSecs" -Value 900 -Type DWord

# Confirm the setting
Write-Output "'InactivityTimeoutSecs' successfully set to 900 seconds (15 minutes) under $regPath"
