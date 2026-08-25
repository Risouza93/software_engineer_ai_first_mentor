# COMANDOS — M004 — Claude Code Foundations

**Data:** 25/08/2026  
**Ambiente:** Windows + PowerShell + VS Code  
**Missão:** M004 — AI Coding Tools Foundations

## Validar pré-requisitos

```powershell
git --version
code --version
claude --version
Get-Command claude
```

**Objetivo:** validar Git, VS Code e resolução da CLI.  
**Observado:** Git/VS Code funcionais; `claude` inicialmente retornou `CommandNotFoundException`.  
**Risco:** nenhum; leitura.

## Instalar Claude Code

```powershell
irm https://claude.ai/install.ps1 | iex
```

**Objetivo:** executar o instalador nativo usado na sessão.  
**Observado:** Claude Code 2.1.245 instalado em `C:\Users\richard.feitosa\.local\bin\claude.exe`.  
**Risco:** executa script remoto; usar somente fonte oficial validada.

## Ajustar PATH somente na sessão

```powershell
$env:PATH += ";C:\Users\richard.feitosa\.local\bin"
```

**Objetivo:** permitir resolução do executável sem alteração administrativa.  
**O que muda:** somente o ambiente do PowerShell atual.  
**Rollback:** fechar o terminal/processo.  
**Limitação:** pode precisar ser repetido em novos terminais.

## Validar instalação

```powershell
claude --version
Get-Command claude
```

**Observado:** versão `2.1.245 (Claude Code)` e executável resolvido em `.local\bin`.

## Iniciar Claude Code

```powershell
claude
```

**Objetivo:** iniciar CLI e autenticar.  
**Observado:** conta Claude Pro reconhecida.  
**Risco:** revisar permissões antes de permitir execução/edição.

## Validar LAB somente leitura

```powershell
git status
git diff
```

**Observado:** `main` sincronizada, Working Tree limpa e diff vazio.  
**Objetivo:** usar Git como evidência independente.

## Criar branch de laboratório

```powershell
git switch -c lab/claude-code-controlled-change
```

Validação:

```powershell
git branch --show-current
git status
```

**Objetivo:** isolar alteração experimental da `main`.

## Inspecionar alteração controlada

```powershell
git status
git diff -- README.md
```

**Objetivo:** revisar escopo/conteúdo da edição antes de decidir mantê-la ou descartá-la.

## Rollback

```powershell
git restore README.md
```

**Objetivo:** descartar a alteração local não staged do `README.md`.  
**Risco:** remove alterações locais não commitadas desse arquivo.

## Validar rollback

```powershell
git status
git diff
```

**Observado:** branch `lab/claude-code-controlled-change`, Working Tree limpa e diff vazio. Nenhum commit/push realizado.

## Retomada em novo PowerShell

Se `claude` não for encontrado:

```powershell
$env:PATH += ";C:\Users\richard.feitosa\.local\bin"
claude --version
Get-Command claude
```

**Regra:** ajuste apenas da sessão; não contornar políticas corporativas para persistência.
