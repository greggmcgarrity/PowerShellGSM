function Optimize-ArgumentList {
  [OutputType([System.Collections.ArrayList])]
  param (
    [Parameter(Mandatory)]
    [array] $Arguments
  )

  #Create Server.Arguments from cleaned ArgumentList.
  [System.Collections.ArrayList]$CleanedArguments = @()

  foreach ($Argument in $Arguments) {
    if (-not ($Argument.EndsWith('=""') -or $Argument.EndsWith('=') -or $Argument.EndsWith('  ') -or $Argument.EndsWith('="" ') )) {
      $null = $CleanedArguments.Add($Argument)
    }
  }
  return $CleanedArguments
}

Export-ModuleMember -Function Optimize-ArgumentList