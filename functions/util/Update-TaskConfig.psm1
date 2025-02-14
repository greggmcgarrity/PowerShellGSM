
function Update-TaskConfig {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory = $false)]
    [switch]$Alive,
    [Parameter(Mandatory = $false)]
    [switch]$Update,
    [Parameter(Mandatory = $false)]
    [switch]$Restart
  )

  Write-ScriptMsg "Updating Tasks Schedule..."

  if ($Alive) {
    $NextAlive = (Get-Date).AddMinutes($Global.AliveCheckFrequency)
    Set-IniValue -file ".\servers\$($Server.Name).INI" -category "Schedule" -key "NextAlive" -value $NextAlive
  }

  if ($Update) {
    $NextUpdate = (Get-Date).AddMinutes($Global.UpdateCheckFrequency)
    Set-IniValue -file ".\servers\$($Server.Name).INI" -category "Schedule" -key "NextUpdate" -value $NextUpdate
  }

  if ($Restart) {
    $NextRestart = (Get-Date -Hour $Server.AutoRestartTime[0] -Minute $Server.AutoRestartTime[1] -Second  $Server.AutoRestartTime[2]).AddDays(1)
    Set-IniValue -file ".\servers\$($Server.Name).INI" -category "Schedule" -key "NextRestart" -value $NextRestart
  }
}
Export-ModuleMember -Function Update-TaskConfig