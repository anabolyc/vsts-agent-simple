
$chocTempDir = Join-Path $env:TEMP "choco-install"

# Call chocolatey install
Write-Output "Installing chocolatey on this machine"
$toolsFolder = Join-Path $chocTempDir "tools"
$chocInstallPS1 = Join-Path $toolsFolder "chocolateyInstall.ps1"

Get-Content $chocInstallPS1 | Write-Host

& $chocInstallPS1

## TODO: uncomment below

# Write-Output 'Ensuring chocolatey commands are on the path'
# $chocInstallVariableName = "ChocolateyInstall"
# $chocoPath = [Environment]::GetEnvironmentVariable($chocInstallVariableName)
# if ($chocoPath -eq $null -or $chocoPath -eq '') {
#   $chocoPath = "$env:ALLUSERSPROFILE\Chocolatey"
# }

# if (!(Test-Path ($chocoPath))) {
#   $chocoPath = "$env:SYSTEMDRIVE\ProgramData\Chocolatey"
# }

# $chocoExePath = Join-Path $chocoPath 'bin'

# if ($($env:Path).ToLower().Contains($($chocoExePath).ToLower()) -eq $false) {
#   $env:Path = [Environment]::GetEnvironmentVariable('Path', "Machine");
# }

# Write-Output 'Ensuring chocolatey.nupkg is in the lib folder'
# $chocoPkgDir = Join-Path $chocoPath 'lib\chocolatey'
# $nupkg = Join-Path $chocoPkgDir 'chocolatey.nupkg'
# if (![System.IO.Directory]::Exists($chocoPkgDir)) { [System.IO.Directory]::CreateDirectory($chocoPkgDir); }
# Copy-Item "$file" "$nupkg" -Force -ErrorAction SilentlyContinue
