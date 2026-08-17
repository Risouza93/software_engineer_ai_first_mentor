# CONTEXTO DE CONTINUIDADE --- MISSÃO 006 CONCLUÍDA

Data: 17/08/2026\
Formação: Software Engineer AI-First Mentor\
Missões 001--003: CONCLUÍDAS\
MISSÃO 004 --- AI Coding Tools Foundations: PARCIAL --- Codex concluído;
Claude Code bloqueado/adiado\
MISSÃO 005 --- Branching: CONCLUÍDA\
MISSÃO 006 --- PR / Diff: CONCLUÍDA\
Próxima missão disponível: MISSÃO 007 --- Leitura de código

------------------------------------------------------------------------

## Estado final observado

Repositório:

``` text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

Estado final:

``` text
branch atual: main
main local: 0b8d169
origin/main: 0b8d169
PR #2: mergeado
feature/missao-006-pr-diff local: removida
origin/feature/missao-006-pr-diff: removida
git status --short: sem saída
```

Merge commit observado:

``` text
0b8d169 Merge pull request #2 from Risouza93/feature/missao-006-pr-diff
```

Commit de correção/prevenção:

``` text
1f5e1c5 Adição de script para validação de encoding e Conversão de arquivos com encoding ANSI para UTF-8
```

Commit inicial da feature:

``` text
6ae77ee lab: adiciona arquivo para pratica de PR e diff
```

Grafo final observado:

``` text
*   0b8d169 (HEAD -> main, origin/main) Merge pull request #2 from Risouza93/feature/missao-006-pr-diff
|\
| * 1f5e1c5 Adição de script para validação de encoding e Conversão de arquivos com encoding ANSI para UTF-8
| * 6ae77ee lab: adiciona arquivo para pratica de PR e diff
* | 31d1136 lab: adiciona alteracao exclusiva da main
|/
* 37fab5f Atualizando Progress Ledger
```

------------------------------------------------------------------------

## O que foi consolidado na MISSÃO 006

### Diff

``` text
git diff
→ Working Tree vs Staging/Index

git diff --staged
→ Staging/Index vs HEAD

git diff main..feature
→ compara as pontas

git diff main...feature
→ merge-base vs ponta da feature
→ aproxima “o que a feature introduziu?”
```

Também foram praticados: - `git add -N`; - anatomia de diff; -
`new file mode`; - `/dev/null`; - hunk header; - divergência e
merge-base.

### Pull Request

Modelo consolidado:

``` text
base
→ onde a mudança pretende entrar

compare
→ branch que propõe a mudança
```

PR #2: - criado a partir de `feature/missao-006-pr-diff`; - atualizado
automaticamente quando a compare branch recebeu novo push; - revisado
por intenção, arquivos, diff, riscos, validações e decisão; - mergeado
somente após evidências positivas.

### Review

Diferenças praticadas:

``` text
Comment
→ feedback sem aprovação/bloqueio

Approve
→ parecer favorável de reviewer elegível

Request changes
→ mudanças necessárias antes da integração
```

Foi comprovado que o autor do PR não pode aprovar o próprio PR como
aprovação independente. O self-review continuou útil para revisar diff,
riscos e evidências.

Conceito consolidado:

``` text
PR mergeável
≠
PR aprovado
≠
PR que deve ser mergeado
```

------------------------------------------------------------------------

## Incidente real --- encoding

Sintoma: - caracteres acentuados apareciam corrompidos no diff/GitHub; -
Windows PowerShell 5.1 conseguia exibir localmente o conteúdo.

Diagnóstico: - arquivos criados em encoding legado do Windows; -
primeira varredura gerou falsos positivos por caminhos relativos
resolvidos incorretamente; - a raiz do repositório foi obtida com
`git rev-parse --show-toplevel`; - caminhos absolutos foram construídos
com `Join-Path`.

Arquivos realmente identificados como UTF-8 inválido:

``` text
branching_lab.txt
feature_divergencia.txt
main_divergencia.txt
pr_diff_lab.txt
```

Correção: - conversão para UTF-8 sem BOM.

Prevenção integrada:

``` text
.editorconfig
→ charset = utf-8

scripts/validate-utf8.ps1
→ valida arquivos textuais versionados com UTF-8 estrito
→ retorna falha quando encontra arquivo inválido
```

Evidências:

``` text
Arquivos ainda inválidos como UTF-8: 0
git diff --check: sem saída
.\scripts\validate-utf8.ps1: passou
```

------------------------------------------------------------------------

## Debugging real --- commit local não aparecia no PR

Sintoma: - commit havia sido criado; - PR #2 continuava mostrando
somente o commit anterior.

Evidência:

``` text
1f5e1c5 (HEAD -> feature/missao-006-pr-diff)
6ae77ee (origin/feature/missao-006-pr-diff)
```

Conclusão:

``` text
commit local avançou
≠
branch remota avançou
```

Após `git push`, foi observado:

``` text
1f5e1c5 (HEAD -> feature/missao-006-pr-diff, origin/feature/missao-006-pr-diff)
```

O PR foi atualizado automaticamente.

------------------------------------------------------------------------

## Decisão de merge

Fluxo aplicado:

``` text
intenção
→ arquivos
→ diff
→ riscos
→ testes/validações
→ evidências
→ decisão
```

Riscos avaliados: - conteúdo alterado acidentalmente junto com
encoding; - arquivo ainda inválido como UTF-8; - script de validação não
detectar regressão; - `.editorconfig` não representar a política
desejada; - divergência com `main` produzir problema de integração.

Resultado: - escopo revisado; - encoding corrigido; - prevenção
adicionada; - validação passou; - Working Tree clean; - nenhum risco
bloqueante identificado.

Decisão: PR pronto para merge.

------------------------------------------------------------------------

## Pós-merge e limpeza

Foi praticado:

``` text
git fetch
→ origin/main avançou para 0b8d169

git switch main
→ main estava atrás de origin/main por 3 commits

git pull
→ fast-forward 31d1136..0b8d169
```

Depois: - branch local da feature removida com `git branch -d`; - branch
remota removida com `git push origin --delete`; - `git branch -r`
mostrou somente `origin/main`; - `git status --short` terminou sem
saída.

------------------------------------------------------------------------

## Não repetir como conceito novo

``` text
git diff
git diff --staged
git add -N
anatomia básica de diff
main..feature
main...feature
merge-base introdutório
base vs compare
PR básico
Comment vs Approve vs Request changes
self-review vs peer review
encoding do incidente da MISSÃO 006
validação UTF-8 estrita
atualização automática do PR por push na compare branch
validação pós-merge
limpeza de branch local/remota
```

Microexplicações continuam permitidas quando necessárias.

------------------------------------------------------------------------

## Próximo ponto

``` text
MISSÃO 007 — Leitura de código
```

Fluxo inicial:

``` text
ENTRADA
↓
FUNÇÕES
↓
DECISÕES
↓
DEPENDÊNCIAS
↓
SAÍDA
```

Claude Code permanece bloqueado/adiado na MISSÃO 004.
