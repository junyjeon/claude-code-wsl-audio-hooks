param($RelativePath)
Add-Type -AssemblyName presentationCore
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$FullPath = Join-Path $ScriptDir $RelativePath
$player = New-Object System.Windows.Media.MediaPlayer
$player.Open([System.Uri]"file:///$FullPath")
$player.Play()
Start-Sleep -Seconds 2
$player.Close()