<#
.SYNOPSIS
    This PowerShell script ensures that Printing over HTTP will be prevented.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-09
    Last Modified   : 2025-04-09
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000110

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
   
    Run this script as Administrator in PowerShell to disable HTTP printing by setting 'DisableHTTPPrinting' to 1 in the registry.

    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000110.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DisableHTTPPrinting DWORD value to 1
Set-ItemProperty -Path $regPath -Name "DisableHTTPPrinting" -Value 1 -Type DWord

# Confirm the setting
Write-Output "'DisableHTTPPrinting' successfully set to 1 under $regPath"
