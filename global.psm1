$GlobalDetails = @{
  #7zip
  SevenZip             = ".\tools\7z\7za.exe"

  #mcrcon
  Mcrcon               = ".\tools\mcrcon\mcrcon.exe"

  #SteamCMD
  SteamCMD             = ".\tools\SteamCMD\steamcmd.exe"

  #Java Directory
  JavaDirectory        = ".\tools\java"

  #Path of the logs folder.
  LogFolder            = ".\logs"

  #Number of days to keep server logs
  Days                 = 30

  #Console Output Text Color
  FgColor              = "Green"

  #Console Output Background Color
  BgColor              = "Black"

  #Console Output Text Color for sections
  SectionColor         = "Blue"

  #Console Output Background Color for sections
  SectionBgColor       = "Black"

  #Pause on errors
  PauseOnErrors        = $false

  #Check for Update Frequency in Minutes
  UpdateCheckFrequency = 15

  #Check if the server is alive Frequency in Minutes
  AliveCheckFrequency  = 5

  #Should be lower or equal to the two above
  TaskCheckFrequency   = 5

  #Log run without actions
  LogEmptyRun          = $false

  #Lock Timeout in miuntes
  LockTimeout          = 10

  #Max download retries
  MaxDownloadRetries   = 10
}

#Create the object
$Global = New-Object -TypeName PsObject -Property $GlobalDetails

Export-ModuleMember -Variable "Global"
