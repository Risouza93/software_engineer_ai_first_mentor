# Skill — containers-podman

## Use when
Working with local or QA environments running on Podman.

## Investigation Flow

```text
Machine running?
↓
Container running?
↓
Service started?
↓
Logs healthy?
↓
Port exposed?
↓
Network reachable?
↓
Dependencies reachable?
↓
Environment variables correct?
↓
Database reachable?
```

## Core Commands

```bash
podman machine list
podman ps -a
podman logs --tail 100 <container>
podman inspect <container>
podman port <container>
podman exec -it <container> sh
podman compose up -d
podman compose down
```

PowerShell:

```powershell
Test-NetConnection localhost -Port <porta>
netstat -ano
ipconfig
nslookup <host>
```

## Rule
Classify issue:
functional bug / application / config / container / network / dependency / database.
