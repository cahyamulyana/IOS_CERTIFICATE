$ErrorActionPreference = 'Stop'
Write-Host 'Setting JAVA_HOME to Microsoft OpenJDK 17...'
$env:JAVA_HOME = 'C:\Progra~1\Microsoft\jdk-17.0.17.10-hotspot'
$env:Path = "$env:JAVA_HOME\bin;" + $env:Path

Write-Host "JAVA_HOME=$env:JAVA_HOME"
java -version
cordova -v

Write-Host 'Building Cordova Android (debug)...'
cordova build android --debug

Write-Host 'Build completed.'
