<!-- ALTERADO 2026-09-01: caminhos das regras atualizados para rules/; status atualizado — a versão executável já existe em .claude/skills/execution-report/SKILL.md (PR #7). Este arquivo é o companion legível. -->
# Skill operacional — execution-report

**Tipo:** operacional (procedimento do Claude Code)
**Autoridade:** `rules/15-universal-execution-reports.md` — em qualquer conflito, a Regra vence.
**Relacionadas:** `rules/14-git-safe-publishing.md` (o relatório entra no commit só pelo Gate 1), `rules/13-universal-memory-context-compaction.md` (relatório ≠ memory).
**Status:** companion legível. A versão executável e canônica do procedimento é
`.claude/skills/execution-report/SKILL.md`; em divergência entre os dois, vale a executável (e, acima dela, a Regra 15).

## Use when
Ao FINAL de toda execução significativa: criação/alteração/remoção de arquivos,
diagnóstico, auditoria, análise de Git, validações, testes, debugging relevante,
manutenção de contexto/memory, compactação, preparação de commit, commit/push
autorizados, ou falha que afete o estado do trabalho.

Regra: **1 execução significativa → 1 relatório final.**

## Não use para
- Cada comando interno ou microação da mesma tarefa.
- Relatar a criação do próprio relatório (sem recursão).
- Substituir `memory/` (estado atual) ou `context/chat_history/` (narrativa).

## Inputs
- O que foi pedido e o que foi feito nesta execução.
- Arquivos tocados (com origem: desta execução / anterior / preexistente).
- Validações executadas e seus resultados.
- Estado Git relevante (status, diff --stat, --check, commit/push se houve).
- Data/hora local do ambiente.

## Outputs
- Um arquivo `reports/report_task_DD-MM-YY_HH-mm.md`.
- Nunca sobrescreve relatório anterior.
- Não entra em staging automaticamente (só via Gate 1 da skill `git-closure`).

## Procedimento

### 1. Nomear
```text
reports/report_task_DD-MM-YY_HH-mm.md
```
Usar a hora local. Colisão de minuto → sufixo incremental `_02`, `_03`.
Criar o diretório `reports/` se não existir e houver autorização para alterar o repo.

### 2. Preencher a estrutura
```markdown
# TASK REPORT

## METADATA
- Date:  (DD-MM-YY)
- Time:  (fuso)
- Branch:
- Task:
- Result: SUCCESS | PARTIAL | FAILED

## SUMMARY
<3–8 bullets factuais>

## FILES
### Created
### Modified
### Deleted / Moved

## VALIDATION
- comando/check → resultado

## GIT
- status:
- diff summary:
- commit: not executed | <hash>
- push: not executed | <resultado>

## WARNINGS / CONCURRENT CHANGES
- <arquivo> → estado observado → ação: preservado / não tocado

## PENDING

## NEXT
```
Omitir seções vazias quando isso reduzir ruído.

### 3. Regras de conteúdo
- Factual, compacto, suficiente para auditoria sem reler terminal/chat.
- **Não** copiar: terminal inteiro, `git diff` completo, arquivos inteiros,
  prompts completos, stack traces longos, conversa, conteúdo já em fonte canônica.
- Preferir: fato → evidência curta → ponteiro para arquivo/comando.
- Alterações concorrentes / preexistentes: registrar explicitamente
  (`CONCURRENT / PRE-EXISTING → arquivo → estado → ação`). Nunca atribuir ao
  Claude autoria não comprovada.
- Falha antes do objetivo: `Result: PARTIAL|FAILED` + ponto da falha +
  alterações feitas antes + validações + estado Git + ação para retomada.
- Segurança: nunca incluir segredos; registrar só `possível segredo → caminho →
  conteúdo omitido`.

### 4. Encerrar
Informar o caminho do relatório. O relatório **encerra a execução**.
Se o fluxo Git faz parte da mesma execução e o relatório ainda não foi
commitado, atualizá-lo uma vez antes do commit em vez de criar um segundo.

## Validações (Definition of Done)
Abrindo só o relatório, responder: o que foi pedido? o que foi feito? quais
arquivos mudaram? o que foi validado? houve mudança concorrente? estado Git?
commit? push? o que ficou pendente? próximo passo?

## Anti-padrões
- Vários relatórios para a mesma tarefa.
- Relatório sobre o relatório (recursão).
- Copiar diff/terminal/arquivos inteiros.
- Adicionar o relatório ao staging só porque foi criado.
- Usar `memory/` ou `chat_history/` no lugar do relatório.

## Evidência de recorrência
`reports/report_task_27-08-26_11-08.md`, `..._11-27.md`,
`reports/report_task_28-08-26_11-22.md`, `..._11-55.md`, `..._12-10.md`
— cinco execuções já seguem esta estrutura e nomenclatura.
