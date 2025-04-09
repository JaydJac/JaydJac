<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 will be configured to prioritize ECC Curves with longer key lengths first.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-09
    Last Modified   : 2025-04-09
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as Administrator in PowerShell to configure 'EccCurves' with NistP384 and NistP256 for SSL settings in the system registry.

    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000052.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Define ECC curve list
$eccCurves = @("NistP384", "NistP256")

# Set the REG_MULTI_SZ value
Set-ItemProperty -Path $regPath -Name "EccCurves" -Value $eccCurves -Type MultiString

Write-Output "'EccCurves' set to NistP384 and NistP256 under $regPath"

