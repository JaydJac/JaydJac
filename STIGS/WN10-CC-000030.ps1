<#
.SYNOPSIS
    This PowerShell script ensures that the system will be configured to prevent Internet Control Message Protocol (ICMP) redirects from overriding Open Shortest Path First (OSPF) generated routes.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-08
    Last Modified   : 2025-04-08
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Run the script as Administrator in PowerShell to set 'EnableICMPRedirect' to 0 in the system registry.

    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000030.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"

# Set the EnableICMPRedirect DWORD value to 0
Set-ItemProperty -Path $regPath -Name "EnableICMPRedirect" -Value 0 -Type DWord

Write-Output "'EnableICMPRedirect' successfully set to 0 under $regPath"

