<#
.SYNOPSIS
    This PowerShell script ensures that Users will not be allowed to ignore Windows Defender SmartScreen filter warnings for malicious websites in Microsoft Edge.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-14
    Last Modified   : 2025-04-14
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000230

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as Administrator in PowerShell to prevent users from bypassing SmartScreen warnings in Microsoft Edge, remediating STIG ID WN10-CC-000230.

    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000230.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the PreventOverride DWORD value to 1
Set-ItemProperty -Path $regPath -Name "PreventOverride" -Value 1 -Type DWord

# Confirm the setting
Write-Output "'PreventOverride' successfully set to 1 under $regPath"
