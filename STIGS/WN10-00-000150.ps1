<#
.SYNOPSIS
    This PowerShell script ensures that the Structured Exception Handling Overwrite Protection (SEHOP) is enabled.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-08
    Last Modified   : 2025-04-08
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-00-000150.ps1 
#>

# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel"

# Set the DisableExceptionChainValidation DWORD value to 0
Set-ItemProperty -Path $regPath -Name "DisableExceptionChainValidation" -Value 0 -Type DWord

Write-Output "'DisableExceptionChainValidation' successfully set to 0 under $regPath"

