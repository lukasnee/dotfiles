Import-Module posh-git
Set-PSReadlineOption -BellStyle None
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
Set-PSReadlineKeyHandler -Key Tab -Function Complete
$GitPromptSettings.EnableFileStatus = $false # Displaying file status in the git prompt for a very large repo can be prohibitively slow. Rather than turn off file status entirely
# $GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Yellow'
# $GitPromptSettings.RepositoriesInWhichToDisableFileStatus = ???
