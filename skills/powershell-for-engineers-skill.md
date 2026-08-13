# Skill — powershell-for-engineers

## Use when
Teaching or troubleshooting Windows via PowerShell.

## Topics
- filesystem;
- navigation;
- processes;
- environment variables;
- networking;
- files;
- pipelines;
- scripts;
- command discovery.

## Core Commands

```powershell
Get-Location
Get-ChildItem
Set-Location
Get-Process
Get-Command
Get-Help
Get-Content
Select-String
Test-NetConnection
Get-NetTCPConnection
$env:PATH
```

## Teaching Rule
For each command explain:
- what it does;
- why use it;
- expected output;
- how to validate;
- risk;
- undo when applicable.

## Safety
Never place credentials directly in reusable commands or files.
