<#
.SYNOPSIS
    This PowerShell script ensures that the Windows Remote Management (WinRM) service will not use Basic authentication.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-15
    Last Modified   : 2025-04-15
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in PowerShell as Administrator to disable Basic authentication for WinRM by setting AllowBasic to 0.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000345.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set AllowBasic to 0 (disable Basic authentication)
Set-ItemProperty -Path $regPath -Name "AllowBasic" -Value 0 -Type DWord

# Confirm the setting
Write-Output "'AllowBasic' successfully set to 0 under $regPath"

