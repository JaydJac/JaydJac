<#
.SYNOPSIS
    This PowerShell script ensures that the Windows Remote Management (WinRM) client will not allow unencrypted traffic.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-16
    Last Modified   : 2025-04-16
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000335

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this PowerShell script as Administrator to disable unencrypted traffic from the WinRM client by setting AllowUnencryptedTraffic to 0.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000335.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set AllowUnencryptedTraffic to 0 (disable unencrypted traffic from client)
Set-ItemProperty -Path $regPath -Name "AllowUnencryptedTraffic" -Value 0 -Type DWord

# Confirm the setting
Write-Output "'AllowUnencryptedTraffic' successfully set to 0 under $regPath"

