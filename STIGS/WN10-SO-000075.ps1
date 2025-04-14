<#
.SYNOPSIS
    This PowerShell script ensures that the required legal notice will be configured to display before console logon.

.NOTES
    Author          : Jayda Jackson
    LinkedIn        : linkedin.com/in/jayda-jackson/
    GitHub          : github.com/JaydJac
    Date Created    : 2025-04-14
    Last Modified   : 2025-04-14
    Version         : 3.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000075

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script in PowerShell as Administrator to configure the exact U.S. Government warning banner for STIG compliance (LegalNoticeText).

    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000075.ps1 
#>
# Run this script with Administrator privileges

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Define the exact LegalNoticeText with literal \n characters
$legalNoticeText = 'You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.\nBy using this IS (which includes any device attached to this IS), you consent to the following conditions:\n-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations.\n-At any time, the USG may inspect and seize data stored on this IS.\n-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.\n-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.\n-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details.'

# Apply the exact value to the registry
Set-ItemProperty -Path $regPath -Name "LegalNoticeText" -Value $legalNoticeText -Type String

# Confirm it
Write-Output "'LegalNoticeText' successfully set under $regPath with exact policy string."

