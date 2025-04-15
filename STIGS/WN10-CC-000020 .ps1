<#
.SYNOPSIS
    This PowerShell script ensures that IPv6 source routing will be configured to highest protection.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-15
    Last Modified   : 2025-04-15
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in PowerShell as Administrator to disable IPv6 source routing by setting DisableIpSourceRouting to 2.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000020.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set DisableIpSourceRouting to 2
Set-ItemProperty -Path $regPath -Name "DisableIpSourceRouting" -Value 2 -Type DWord

# Confirm the setting
Write-Output "'DisableIpSourceRouting' successfully set to 2 under $regPath"

