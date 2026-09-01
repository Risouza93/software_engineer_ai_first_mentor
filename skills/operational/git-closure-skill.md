<!-- ALTERADO 2026-09-01: caminhos das regras atualizados para rules/; status atualizado — a versão executável já existe em .claude/skills/git-closure/SKILL.md (PR #7). Este arquivo é o companion legível. -->
# Skill operacional — git-closure

**Tipo:** operacional (procedimento do Claude Code)
**Autoridade:** `rules/14-git-safe-publishing.md` — em qualquer conflito, a Regra vence.
**Relacionadas:** `rules/12-claude-code-artifact-automation.md` (edição), `rules/15-universal-execution-reports.md` (relatório).
**Status:** companion legível. A versão executável e canônica do procedimento é
`.claude/skills/git-closure/SKILL.md`; em divergência entre os dois, vale a executável (e, acima dela, a Regra 14).

## Use when
Encerrar com Git qualquer execução que tenha alterado arquivos (ou que precise
publicar alterações já existentes na working tree): commit, push e, quando
pedido, abertura de PR.

## Não use para
- Merge (fora de escopo sem autorização específica).
- Operações que reescrevem histórico ou descartam trabalho.
- Publicar direto em `main`/`master`.

## Inputs
- Working tree + `git status` reais.
- Escopo aprovado (quais arquivos devem ser versionados).
- Mensagem de commit desejada ou critérios para propô-la.
- Autorizações humanas (Gate 1, Gate 2, PR) — obtidas durante o procedimento.

## Outputs
- Commit(s) com diff == plano aprovado.
- Push com upstream conhecido.
- (Opcional) PR aberta com base/head/título/resumo/riscos/pendências.
- Evidências: `git show --stat HEAD`, `git branch -vv`, número/URL da PR.
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
Nunca ramificar de uma branch já merged nem reutilizá-la. Ramificar de `main`
atualizada: `git switch -c <prefixo>/<slug-objetivo>`.

### 3. Diff como evidência (automático)
```powershell
git diff --stat ; git diff ; git diff --check
```
Inspecionar arquivos untracked candidatos individualmente. Classificar:
DEVE ENTRAR / NÃO DEVE ENTRAR / PRECISA DE DECISÃO / RISCOS.
Rodar secret scan nos candidatos.

### 4. Proposta de commit (automático — só mostrar)
Arquivos que entram / que não entram / resumo do diff / validações /
mensagem sugerida / comandos exatos. **Não** executar `git add`/`commit`.

### 5. 🛑 GATE 1 — staging + commit
Pedir autorização explícita. Silêncio não autoriza. Autorização para editar
arquivos não autoriza commit. Após o "sim":
```powershell
git add <arquivos-aprovados>          # evitar git add . / -A
git status --short
git diff --staged --stat ; git diff --staged ; git diff --staged --check
```
Confirmar: staged == aprovado, nada incidental, nenhum segredo, `--check` limpo.
Divergência → parar e reportar. Senão:
```powershell
git commit -m "<mensagem-aprovada>"   # não alterar a mensagem silenciosamente
git show --stat HEAD ; git status
```

### 6. 🛑 GATE 2 — push
Commit não autoriza push. Mostrar hash/mensagem/branch/arquivos + destino remoto
+ comando. Pedir nova autorização. Após o "sim":
```powershell
git push -u origin <branch>   # se sem upstream; senão: git push
git status ; git branch -vv ; git log -1 --oneline --decorate
```

### 7. 🛑 PR (autorização separada)
Push não autoriza PR. Mostrar base / head / título / resumo / arquivos /
validações / riscos / pendências. Após autorização: `gh pr create ...`, validar
(`gh pr view`), informar número/URL/estado. **Não** fazer merge.

### 8. Pós-merge (quando o humano mergear)
```powershell
git fetch --all --prune
git switch main ; git pull --ff-only origin main
git branch -d <branch-merged>          # -d (não -D): recusa se não merged
```
Reconciliar a memory (regra 13) em novo fluxo se o estado operacional mudou.

## Interrupções obrigatórias (parar e consultar o humano)
- local atrás do remoto com mais de uma estratégia razoável;
- local à frente com commits não publicados / divergência real de histórico;
- working tree ou untracked que possam interferir;
- staged inesperado; conflito;
- necessidade de `stash`/`reset`/`restore`/`clean`/`rebase`/`amend`;
- mudança de base da PR;
- qualquer situação que possa sobrescrever, ocultar ou publicar trabalho.

Formato: `⚠ DECISÃO NECESSÁRIA` — Fato / Impacto / Opções (A/B/C) / Recomendação /
"Nenhuma ação mutável até sua decisão."

## Operações proibidas por padrão
`git merge`, `git rebase`, `git reset --hard`, `git clean`, `git commit --amend`,
`git push --force`, `git push --force-with-lease`, `git restore .`, `git checkout -- .`,
alterar Git global, incluir segredos, publicar em `main` sem autorização.

## Validações (Definition of Done)
Deve ser possível responder com evidência:
o que mudou (`git diff`) · o que foi selecionado (`git diff --staged`) ·
o que foi gravado (`git show HEAD`) · o que foi publicado (push + upstream) ·
quem autorizou commit · quem autorizou push · PR (número/estado).
Working tree limpa e branch com upstream conhecido ao final.

## Anti-padrões
- Tratar `status clean` como "sincronizado com o remoto".
- `git add .` quando dá para listar os arquivos.
- Commitar arquivo só porque está na working tree.
- Refactor oportunista junto do commit.
- Seguir de um gate para o outro sem autorização nova.
- Reutilizar branch já merged.

## Evidência de recorrência
`reports/report_task_27-08-26_11-27.md` (3 commits + push, Gate 1/2),
`reports/report_task_28-08-26_11-55.md` (pre-flight + base sync + branch + commit/push/PR #4),
`reports/report_task_28-08-26_12-10.md` (pós-merge: sync + limpeza de branches).
