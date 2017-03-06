function Get-CreativeCloudUsers {
    param (
        [ValidateSet("Active","Available")]$Status
    )
    if (-not $Script:CreativeCloudUsers) {
        $Script:CreativeCloudUsers = Get-Content "\\tervis.prv\applications\powershell\TervisAdobeCreativeCloud\Team Export\team.csv" | 
        select -Skip 1 | 
        Out-String |
        ConvertFrom-Csv -Delimiter "`t"
    }
    $Script:CreativeCloudUsers |
    where {-Not $Status -or $_.Status -eq $Status}
}

function Invoke-EmailCreativeCloudUserToConfirmTheyStillUse {

}