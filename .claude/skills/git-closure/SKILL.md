---
name: git-closure
description: >-
  Encerrar com Git qualquer execução que alterou arquivos ou que precise publicar
  alterações já presentes na working tree. Cobre inspeção pré-flight, diff como
  evidência, proposta de commit, e os gates humanos — Gate 1 (staging + commit),
  Gate 2 (push) e PR (autorização separada) — mais a limpeza pós-merge. Use sempre
  que for commitar, dar push ou abrir PR neste repositório. Autoridade:
  rules/14-git-safe-publishing.md — em qualquer conflito, a Regra vence.
---

# git-closure

Procedimento operacional do Claude Code para publicar alterações com Git de forma
auditável e com gates humanos. **Autoridade:** `rules/14-git-safe-publishing.md`.
Relacionadas: `rules/12-claude-code-artifact-automation.md` (edição),
`rules/15-universal-execution-reports.md` (relatório da execução).

## Use when

Encerrar com Git qualquer execução que alterou arquivos, ou publicar alterações já
existentes na working tree: commit, push e, quando pedido, abertura de PR.

## Não use para

- Merge (fora de escopo sem autorização específica).
- Operações que reescrevem histórico ou descartam trabalho.
- Publicar direto em `main` / `master`.

## Inputs

- Working tree + `git status` reais.
- Escopo aprovado (quais arquivos devem ser versionados).
- Mensagem de commit desejada ou critérios para propô-la.
- Autorizações humanas (Gate 1, Gate 2, PR) — obtidas durante o procedimento.

## Outputs

- Commit(s) com diff == plano aprovado.
- Push com upstream conhecido.
- (Opcional) PR aberta com base / head / título / resumo / riscos / pendências.
- Evidências: `git show --stat HEAD`, `git branch -vv`, número / URL da PR.
- Relatório da execução via skill `execution-report`.

## Procedimento

### 0. Pre-flight (inspeção — automático)

```powershell
git fetch --all --prune
git status ; git status --short
git branch --show-current ; git branch -vv
git log --oneline --decorate --graph -10
git rev-list --left-right --count main...origin/main
git diff ; git diff --staged ; git diff --check
```

Classificar o estado: sincronizado / atrás / à frente / divergente / com
alterações locais / com staged / combinação. `git status clean` **não** prova
sincronia com o remoto; `git fetch` **não** atualiza a branch local.

### 1. Se local e remoto diferirem → PARAR

Não corrigir automaticamente. Apresentar estado + diagnóstico + opções seguras
(o que faz / muda / preserva / risco / comando / como validar), recomendar uma,
perguntar "Qual opção?" e aguardar decisão humana.
Fast-forward de branch desatualizada sem divergência: usar `git pull --ff-only`.

### 2. Base da nova alteração

Nunca ramificar de uma branch já merged nem reutilizá-la. Nunca empilhar sobre uma
branch de PR ainda aberta. Ramificar de `main` atualizada:
`git switch -c <prefixo>/<slug-objetivo>`.

### 3. Diff como evidência (automático)

```powershell
git diff --stat ; git diff ; git diff --check
```

Inspecionar arquivos untracked candidatos individualmente. Classificar:
DEVE ENTRAR / NÃO DEVE ENTRAR / PRECISA DE DECISÃO / RISCOS.
Rodar secret scan nos candidatos.

Avisos benignos (não são erro de `--check` nem falha de Definition of Done):
LF→CRLF quando não há `.gitattributes`; `markdownlint` MD022 / MD032 no template
compacto de relatório (cabeçalho seguido direto de lista) — consistente com a
regra 15. Registrar como benignos, não "corrigir".

### 4. Proposta de commit (automático — só mostrar)

Arquivos que entram / que não entram / resumo do diff / validações /
mensagem(ns) sugerida(s) / comandos exatos. **Não** executar `git add` / `commit`.

Consolidação por escopo (Regra 16 §8) — heurística *"descrevo em 1 frase, sem
'e'/'também'?"*:

- **1 frase → 1 commit.** Mesmo propósito em N arquivos = um commit só (ex.:
  atualizar uma referência em 14 arquivos).
- **Vários propósitos → N commits**, um por mudança lógica independente (ex.:
  regra nova + migração + renames), cada um com sua mensagem — nunca um commit
  único agregando propósitos distintos.

### 5. 🛑 GATE 1 — staging + commit

Pedir autorização explícita. Silêncio não autoriza. Autorização para editar
arquivos não autoriza commit. Após o "sim":

```powershell
git add <arquivos-aprovados>          # evitar git add . / -A
git status --short
git diff --staged --stat ; git diff --staged ; git diff --staged --check
```

Confirmar: staged == aprovado, nada incidental, nenhum segredo.

`git diff --staged --check` acusa algo → **PARAR e apresentar** (fato / linhas /
é intencional?). Se o humano confirmar que é intencional (ex.: hard-break Markdown
= 2 espaços no fim da linha), `git commit` **não** é bloqueado por `--check` e
prossegue. Se for acidental, remover antes de commitar.

Divergência inesperada no staged → parar e reportar. Senão:

```powershell
git commit -m "<mensagem-aprovada>"   # não alterar a mensagem silenciosamente
git show --stat HEAD ; git status
```

Para N commits: repetir `add` → validar staged → `commit` por mudança lógica.

### 6. 🛑 GATE 2 — push

Commit não autoriza push. Mostrar hash / mensagem / branch / arquivos + destino
remoto + comando. Pedir nova autorização. Após o "sim":

```powershell
git push -u origin <branch>   # se sem upstream; senão: git push
git status ; git branch -vv ; git log -1 --oneline --decorate
```

### 7. 🛑 PR (autorização separada)

Push não autoriza PR. Mostrar base / head / título / resumo / arquivos /
validações / riscos / pendências. Após autorização: `gh pr create ...`, validar
(`gh pr view`), informar número / URL / estado. **Não** fazer merge.

### 8. Pós-merge (quando o humano mergear)

```powershell
git fetch --all --prune
git switch main ; git pull --ff-only origin main
git merge-base --is-ancestor <tip-da-branch> origin/main   # precheck: deve ser verdadeiro
git branch -d <branch-merged>          # -d (não -D): recusa se não merged
```

Reconciliar a memory (regra 13) em novo fluxo se o estado operacional mudou.

Concluído o pós-merge, **parar** — Checkpoint 4 da Regra 16 (Fronteira): não
iniciar a próxima unidade de trabalho sem novo pedido do humano.

## Interrupções obrigatórias (parar e consultar o humano)

- local atrás do remoto com mais de uma estratégia razoável;
- local à frente com commits não publicados / divergência real de histórico;
- working tree ou untracked que possam interferir;
- staged inesperado; conflito;
- `git diff --staged --check` acusa algo cuja intencionalidade não é óbvia;
- necessidade de `stash` / `reset` / `restore` / `clean` / `rebase` / `amend`;
- mudança de base da PR; necessidade de empilhar sobre branch aberta;
- qualquer situação que possa sobrescrever, ocultar ou publicar trabalho.

Formato: `⚠ DECISÃO NECESSÁRIA` — Fato / Impacto / Opções (A/B/C) / Recomendação /
"Nenhuma ação mutável até sua decisão."

## Operações proibidas por padrão

`git merge`, `git rebase`, `git reset --hard`, `git clean`, `git commit --amend`,
`git push --force`, `git push --force-with-lease`, `git restore .`,
`git checkout -- .`, alterar Git global, incluir segredos, publicar em `main`
sem autorização.

## Validações (Definition of Done)

Deve ser possível responder com evidência:
o que mudou (`git diff`) · o que foi selecionado (`git diff --staged`) ·
o que foi gravado (`git show HEAD`) · o que foi publicado (push + upstream) ·
quem autorizou commit · quem autorizou push · PR (número / estado).
Working tree limpa e branch com upstream conhecido ao final.

## Anti-padrões

- Tratar `status clean` como "sincronizado com o remoto".
- `git add .` quando dá para listar os arquivos.
- Commitar arquivo só porque está na working tree.
- Um commit único quando o escopo tem mudanças lógicas independentes.
- N commits para o mesmo propósito só porque toca vários arquivos (Regra 16 §8).
- Refactor oportunista junto do commit.
- Seguir de um gate para o outro sem autorização nova.
- Reutilizar branch já merged ou empilhar sobre PR aberta.
- "Corrigir" avisos LF→CRLF / MD022 / MD032 benignos.

## Evidência de recorrência

- `reports/report_task_27-08-26_11-27.md` — 3 commits lógicos + push, Gate 1/2,
  `--check` com trailing whitespace intencional resolvido por decisão humana.
- `reports/report_task_28-08-26_11-55.md` — pre-flight + fast-forward da base +
  nova branch + commit/push/PR #4.
- `reports/report_task_28-08-26_12-10.md` — pós-merge: `pull --ff-only` +
  `merge-base --is-ancestor` + `git branch -d`.
- `reports/report_task_28-08-26_12-15.md` — nova branch de `main`, PR #6.
