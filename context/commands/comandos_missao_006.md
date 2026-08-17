# COMANDOS --- MISSÃO 006 --- PR / DIFF

> Objetivo: referência operacional somente dos comandos e comportamentos
> praticados na MISSÃO 006.
>
> Ambiente: Windows + PowerShell + Git + GitHub.
>
> Regra: observar → entender → executar → validar.

------------------------------------------------------------------------

## 1. Estado e branch

``` powershell
git status --short
git branch --show-current
```

Uso: validar Working Tree e branch ativa antes de alterar estado.

------------------------------------------------------------------------

## 2. Diff local

``` powershell
git diff
git diff --staged
```

Modelo:

``` text
git diff
→ Working Tree vs Index

git diff --staged
→ Index vs HEAD
```

------------------------------------------------------------------------

## 3. Exibir untracked no diff sem staging completo

``` powershell
git add -N <arquivo>
```

Uso praticado: permitir inspeção de arquivo novo por `git diff` sem
adicionar seu conteúdo completo ao staging.

------------------------------------------------------------------------

## 4. Comparar branches

``` powershell
git diff main..feature/missao-006-pr-diff
git diff main...feature/missao-006-pr-diff
```

Modelo:

``` text
..
→ ponta vs ponta

...
→ merge-base vs ponta da feature
```

Com divergência, três pontos representou melhor o que a feature
introduziu.

------------------------------------------------------------------------

## 5. Identificar raiz Git

``` powershell
git rev-parse --show-toplevel
```

Uso praticado no debugging de encoding para evitar resolução incorreta
de caminhos relativos.

No PowerShell, caminhos absolutos foram construídos com:

``` powershell
Join-Path
```

------------------------------------------------------------------------

## 6. Validar problemas de whitespace/diff

``` powershell
git diff --check
```

Resultado observado: sem saída.

------------------------------------------------------------------------

## 7. Validar UTF-8

Script integrado ao repositório:

``` powershell
.\scripts\validate-utf8.ps1
```

Resultado final: validação passou; arquivos inválidos = 0.

Prevenção integrada:

``` text
.editorconfig
scripts/validate-utf8.ps1
```

------------------------------------------------------------------------

## 8. Revisar escopo

``` powershell
git diff --stat
git diff
git diff --stat main...feature/missao-006-pr-diff
```

Uso: confirmar que a alteração correspondia ao escopo esperado antes de
integração.

------------------------------------------------------------------------

## 9. Inspecionar referências e histórico

``` powershell
git log --oneline --decorate --graph --all -6
git log --oneline --decorate --graph --all -4
```

Evidência importante observada antes do push correto:

``` text
1f5e1c5 (HEAD -> feature/missao-006-pr-diff)
6ae77ee (origin/feature/missao-006-pr-diff)
```

Interpretação:

``` text
branch local avançou
branch remota não avançou
```

Depois do push:

``` text
1f5e1c5 (HEAD -> feature/missao-006-pr-diff, origin/feature/missao-006-pr-diff)
```

------------------------------------------------------------------------

## 10. Publicar atualização da feature

``` powershell
git push
```

Uso: publicar o commit local na branch remota já configurada com
upstream.

Efeito observado: PR #2 foi atualizado automaticamente.

------------------------------------------------------------------------

## 11. Review do Pull Request

No GitHub foram praticados/observados:

``` text
Files changed
Submit review

Comment
Approve
Request changes
```

Constatação: - autor do PR não pode registrar aprovação independente do
próprio PR; - self-review continua válido para inspeção e decisão
técnica; - merge só foi executado depois de revisão de escopo, riscos e
validações.

------------------------------------------------------------------------

## 12. Pós-merge

``` powershell
git fetch
```

Resultado observado:

``` text
31d1136..0b8d169  main -> origin/main
```

Troca para main:

``` powershell
git switch main
```

O Git informou que a branch estava atrás de `origin/main` por 3 commits
e podia fazer fast-forward.

Atualização:

``` powershell
git pull
```

Resultado observado:

``` text
Updating 31d1136..0b8d169
Fast-forward
```

------------------------------------------------------------------------

## 13. Validar merge

``` powershell
git log --oneline --decorate --graph --all -6
```

Merge commit observado:

``` text
0b8d169 Merge pull request #2 from Risouza93/feature/missao-006-pr-diff
```

Também:

``` powershell
git status --short
```

Resultado final: sem saída.

------------------------------------------------------------------------

## 14. Remover branch local integrada

``` powershell
git branch -d feature/missao-006-pr-diff
```

Resultado:

``` text
Deleted branch feature/missao-006-pr-diff (was 1f5e1c5).
```

Validação:

``` powershell
git branch
```

Resultado:

``` text
* main
```

------------------------------------------------------------------------

## 15. Remover branch remota integrada

``` powershell
git push origin --delete feature/missao-006-pr-diff
```

Resultado observado:

``` text
- [deleted] feature/missao-006-pr-diff
```

Validação:

``` powershell
git branch -r
git status --short
```

Resultado:

``` text
origin/main
```

e `git status --short` sem saída.

------------------------------------------------------------------------

## 16. Commits relevantes

``` text
6ae77ee  lab: adiciona arquivo para pratica de PR e diff
1f5e1c5  Adição de script para validação de encoding e Conversão de arquivos com encoding ANSI para UTF-8
31d1136  lab: adiciona alteracao exclusiva da main
0b8d169  Merge pull request #2 from Risouza93/feature/missao-006-pr-diff
```

------------------------------------------------------------------------

## 17. Conceitos consolidados

``` text
diff local
diff staged
git add -N
anatomia de diff
dois pontos vs três pontos
merge-base
base vs compare
PR
atualização de PR por push
Comment
Approve
Request changes
self-review
peer review
risco
evidência
decisão de merge
encoding
UTF-8 estrito
prevenção por .editorconfig
validação por script
fetch pós-merge
pull fast-forward
merge commit
remoção de branch local
remoção de branch remota
```

------------------------------------------------------------------------

## 18. Regra de continuidade

Estado final observado:

``` text
main = origin/main = 0b8d169
branch feature local removida
branch feature remota removida
Working Tree clean
MISSÃO 006 concluída
```

Próxima missão:

``` text
MISSÃO 007 — Leitura de código
```
