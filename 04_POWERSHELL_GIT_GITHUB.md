# PowerShell + Git + GitHub — Primeira Cartilha

## Objetivo

Sair de uma máquina nova até um repositório clonado e uma alteração enviada com segurança.

## 1. Verificar Git

```powershell
git --version
```

ELI5: perguntar ao computador “você tem Git instalado?”

## 2. Configurar identidade

```powershell
git config --global user.name "SEU NOME"
git config --global user.email "SEU_EMAIL"
```

Validar:

```powershell
git config --global --list
```

Não usar senha, token ou segredo nesses campos.

## 3. Criar pasta de trabalho

```powershell
mkdir C:\Dev
cd C:\Dev
```

Validar:

```powershell
Get-Location
```

## 4. Clonar

```powershell
git clone <URL_DO_REPOSITORIO>
```

Depois:

```powershell
cd <PASTA_DO_REPOSITORIO>
git status
```

## 5. Atualizar referências

```powershell
git fetch
```

ELI5: “Git, me conte o que mudou no servidor, mas não mexa ainda nos meus arquivos.”

## 6. Criar branch

Forma moderna:

```powershell
git switch -c feature/minha-alteracao
```

Validar:

```powershell
git branch
```

## 7. Ver alterações

```powershell
git status
git diff
```

## 8. Preparar arquivos

Arquivo específico:

```powershell
git add .\README.md
```

Tudo:

```powershell
git add .
```

Antes de usar `git add .`, revisar `git status`.

## 9. Commit

```powershell
git commit -m "docs: atualiza README"
```

## 10. Push

Primeira vez da branch:

```powershell
git push -u origin feature/minha-alteracao
```

Depois:

```powershell
git push
```

## 11. Histórico

```powershell
git log --oneline --decorate --graph -20
```

## 12. Diferenças

```powershell
git diff
git diff --staged
git show <HASH>
```

## 13. Voltar alteração local não staged

```powershell
git restore <arquivo>
```

ATENÇÃO: isso descarta alteração local daquele arquivo.

## 14. Tirar arquivo do staging

```powershell
git restore --staged <arquivo>
```

O conteúdo continua no arquivo.

## 15. Workflow mental

```text
git status
↓
git fetch
↓
git switch -c ...
↓
editar
↓
git diff
↓
git add
↓
git diff --staged
↓
git commit
↓
git push
↓
Pull Request
```

## Regra de ouro

Antes de comando que altera histórico ou remove trabalho:

```text
PARE
↓
git status
↓
git log
↓
entenda o estado
↓
só então execute
```
