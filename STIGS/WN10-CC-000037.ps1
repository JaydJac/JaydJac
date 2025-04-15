<#
.SYNOPSIS

**"This PowerShell script ensures that local administrator accounts have their privileged tokens filtered to prevent the use of elevated privileges over the network on domain systems."** 

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-14
    Last Modified   : 2025-04-14
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000037

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in PowerShell as Administrator to disable LocalAccountTokenFilterPolicy and enforce secure remote access behavior for local accounts.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000037.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set LocalAccountTokenFilterPolicy to 0 (disabled)
Set-ItemProperty -Path $regPath -Name "LocalAccountTokenFilterPolicy" -Value 0 -Type DWord

# Confirm the setting
Write-Output "'LocalAccountTokenFilterPolicy' successfully set to 0 under $regPath"

