<#
.SYNOPSIS
    This PowerShell script ensures that, if Enhanced Diagnostic Data is enabled, it is restricted to only the minimum data necessary to support Windows Analytics.
.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-15
    Last Modified   : 2025-04-15
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000204 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in PowerShell as Administrator to limit enhanced diagnostic data sent to Windows Analytics by setting the corresponding policy to 1.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000204 .ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value
Set-ItemProperty -Path $regPath -Name "LimitEnhancedDiagnosticDataWindowsAnalytics" -Value 1 -Type DWord

# Confirm the setting
Write-Output "'LimitEnhancedDiagnosticDataWindowsAnalytics' successfully set to 1 under $regPath"
