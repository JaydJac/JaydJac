<#
.SYNOPSIS
    This PowerShell script ensures that the network selection user interface (UI) will not be displayed on the logon screen.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-09
    Last Modified   : 2025-04-09
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000120

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Run this script as Administrator in PowerShell to hide the network selection UI on the logon screen by setting 'DontDisplayNetworkSelectionUI' to 1.

    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000120.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DontDisplayNetworkSelectionUI DWORD value to 1
Set-ItemProperty -Path $regPath -Name "DontDisplayNetworkSelectionUI" -Value 1 -Type DWord

# Confirm the setting
Write-Output "'DontDisplayNetworkSelectionUI' successfully set to 1 under $regPath"

