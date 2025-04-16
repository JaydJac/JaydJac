<#
.SYNOPSIS
    This PowerShell script ensures that Indexing of encrypted files will be turned off.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-16
    Last Modified   : 2025-04-16
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000305

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this PowerShell script as Administrator to disable indexing of encrypted items in Windows Search by setting AllowIndexingEncryptedStoresOrItems to 0.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000305.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set AllowIndexingEncryptedStoresOrItems to 0 (disable indexing encrypted files)
Set-ItemProperty -Path $regPath -Name "AllowIndexingEncryptedStoresOrItems" -Value 0 -Type DWord

# Confirm the setting
Write-Output "'AllowIndexingEncryptedStoresOrItems' successfully set to 0 under $regPath"

