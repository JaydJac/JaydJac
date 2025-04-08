<#
.SYNOPSIS
    This PowerShell script ensures that the Security event log size will be configured to 1024000 KB or greater.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-08
    Last Modified   : 2025-04-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000505.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

# Check if the registry key exists; create it if it doesn't
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the MaxSize value to 0xFA000 (1024000 KB ≈ 1 GB)
Set-ItemProperty -Path $registryPath -Name "MaxSize" -Value 0xFA000 -Type DWord

# Confirm the value was set
Get-ItemProperty -Path $registryPath | Select-Object MaxSize

