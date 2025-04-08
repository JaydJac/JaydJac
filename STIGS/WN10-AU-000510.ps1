<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2024-04-08
    Last Modified   : 2024-04-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000510

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000510.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System"

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the MaxSize value to 0x8000 (32 MB in KB)
Set-ItemProperty -Path $registryPath -Name "MaxSize" -Value 0x8000 -Type DWord

# Output the result to verify
Get-ItemProperty -Path $registryPath | Select-Object MaxSize

