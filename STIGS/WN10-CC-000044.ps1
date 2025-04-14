<#
.SYNOPSIS
    This PowerShell script ensures that Internet connection sharing will be be disabled.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-14
    Last Modified   : 2025-04-14
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000044

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as Administrator in PowerShell to disable the Shared Access UI by setting 'NC_ShowSharedAccessUI' to 0, remediating STIG ID WN10-CC-000044.


    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000044.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the NC_ShowSharedAccessUI DWORD value to 0
Set-ItemProperty -Path $regPath -Name "NC_ShowSharedAccessUI" -Value 0 -Type DWord

# Confirm the setting
Write-Output "'NC_ShowSharedAccessUI' successfully set to 0 under $regPath"
