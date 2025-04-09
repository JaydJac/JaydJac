<#
.SYNOPSIS
    This PowerShell script ensures that the system will be configured to ignore NetBIOS name release requests except from WINS servers.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-08
    Last Modified   : 2025-04-08
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  
    # Set NoNameReleaseOnDemand Registry Value

This PowerShell script sets the `NoNameReleaseOnDemand` DWORD value to `1` under:


    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000035.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters"

# Set the NoNameReleaseOnDemand DWORD value to 1
Set-ItemProperty -Path $regPath -Name "NoNameReleaseOnDemand" -Value 1 -Type DWord

Write-Output "'NoNameReleaseOnDemand' successfully set to 1 under $regPath"
