<#
.SYNOPSIS
    This PowerShell script ensures that Command line data will be included in process creation events.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-14
    Last Modified   : 2025-04-14
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000066

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as Administrator in PowerShell to enable command-line auditing for process creation events, remediating STIG ID WN10-CC-000066.

    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000066.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the ProcessCreationIncludeCmdLine_Enabled DWORD value to 1
Set-ItemProperty -Path $regPath -Name "ProcessCreationIncludeCmdLine_Enabled" -Value 1 -Type DWord

# Confirm the setting
Write-Output "'ProcessCreationIncludeCmdLine_Enabled' successfully set to 1 under $regPath"

