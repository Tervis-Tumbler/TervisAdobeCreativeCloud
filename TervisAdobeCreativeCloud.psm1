function Get-CreativeCloudUsers {
    param (
        [ValidateSet("Active","Available")]$Status
    )
    if (-not $Script:CreativeCloudUsers) {
        $Script:CreativeCloudUsers = Get-ChildItem -File "\\tervis.prv\applications\powershell\TervisAdobeCreativeCloud\Team Export" | 
        sort LastWriteTime -Descending | 
        Select -First 1 |
        Get-Content |
        ConvertFrom-Csv
    }
    $Script:CreativeCloudUsers |
    where {-Not $Status -or $_.Status -eq $Status}
}

function Invoke-EmailCreativeCloudUserToConfirmTheyStillUse {
    $Script:CreativeCloudUsers.email -join ";"
}

function Invoke-MakeCreativeCloudUsersLocalAdmin {
    Get-CreativeCloudUsers -Status Active
}