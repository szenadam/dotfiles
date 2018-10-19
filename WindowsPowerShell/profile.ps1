# Bash-like tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Turn off annoying beep
Set-PSReadlineOption -BellStyle None

$GitAliasesOn = $TRUE
$DockerAliasesOn = $TRUE

if ($GitAliasesOn -and $(Get-Command 'git' -ErrorAction SilentlyContinue)) {
  function gitstatus {git status}
  Set-Alias gs gitstatus

  function gitlog {git log}
  Remove-Item alias:\gl -Force
  Set-Alias gl gitlog

  function gitdiff {git diff}
  Set-Alias gd gitdiff

  function gitdiffcached {git diff --cached}
  Set-Alias gdc gitdiffcached
}

if ($DockerAliasesOn -and $(Get-Command 'docker' -ErrorAction SilentlyContinue)) {
  function dockerp {docker ps}
  Set-Alias dp dockerp
}

function test ($VALUE) {
  if ($VALUE) {
    Write-Host -ForegroundColor Green 'TRUE'
  } else {
    Write-Host -ForegroundColor Red 'FALSE'
  }
}

Set-Alias t test