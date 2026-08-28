<!-- CRIADO 2026-08-28: primeira versão da memory operacional (regra 13). Sem backup anterior porque não existia CURRENT_CONTEXT.md. -->
<!-- ALTERADO 2026-08-28: GIT STATE / PENDING / NEXT reconciliados para a branch chore/versiona-memory-operacional-e-reports; esta infra (memory/, backup_context/, relatórios) está sendo versionada em PR guiada. -->

# CURRENT CONTEXT

## NOW

Projeto **Software Engineering AI First Mentor**. A base de governança para o
Claude Code está estabelecida e **publicada em `main`**. A PR #3 (regras 12–15 +
migração para Projeto no Claude + reconciliação do Ledger) foi **MERGED** em
27/08/2026 (merge commit `1425fb0`).

Fase atual: **PR guiada** que versiona a infra de memory operacional (regra 13) e
os relatórios/contexto pendentes, na branch `chore/versiona-memory-operacional-e-reports`.
Depois: análise/draft de Skills operacionais e/ou retomada da M008.

## ARCHITECTURE

```text
PROJETO NO CLAUDE  → mentoria, contexto, regras, decisões pedagógicas
CLAUDE CODE        → execução local no repositório (análise + alterações cirúrgicas)
GIT / GITHUB       → evidência, versionamento, colaboração
HUMANO             → aprova os gates (commit / push / PR) e decisões relevantes
```

Retomada normal: ler esta memory primeiro, validar Git com comandos baratos,
abrir só os arquivos que a tarefa exige. Não reauditar o repositório.

## ACTIVE RULES

Regras canônicas na raiz do repo (não copiar conteúdo; abrir sob demanda):

- `12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md` — automação de artefatos:
  edição cirúrgica, comentário `<!-- ALTERADO YYYY-MM-DD: ... -->`, preservar o
  resto, delegar publicação à 14 e relatório à 15.
- `13_UNIVERSAL_MEMORY_CONTEXT_COMPACTION_RULES.md` — memory/backup_context e
  eficiência de tokens. `memory/` = hot context; `backup_context/` = cold.
  Meta desta memory: ~500–1.500 palavras (menos quando possível).
- `14_GIT_SAFE_PUBLISHING_RULES.md` — inspeção/diff/proposta automáticos;
  **staging+commit = Gate 1 humano**, **push = Gate 2 humano**, **PR = autorização
  separada**. Operações destrutivas (reset --hard, rebase, amend, push --force,
  restore .) nunca automáticas.
- `15_UNIVERSAL_EXECUTION_REPORTS_RULES.md` — toda execução significativa gera
  1 relatório em `reports/report_task_DD-MM-YY_HH-mm.md`. Nunca sobrescrever;
  nunca relatório sobre relatório; criar o relatório não autoriza `git add`.

Arquitetura de contexto:

```text
memory/            → ONDE ESTAMOS (hot)
reports/           → O QUE CADA EXECUÇÃO FEZ (audit/cold)
context/chat_history/ → COMO A SESSÃO EVOLUIU (narrativo)
backup_context/    → O QUE A MEMORY SABIA ANTES (cold; dir criado, backups só na 1ª compactação)
Git                → O QUE TECNICAMENTE MUDOU (evidência)
```

## GIT STATE

- Branch de trabalho: `chore/versiona-memory-operacional-e-reports`, criada a
  partir de `main@1425fb0` (sincronizada com `origin/main`). Objetivo: versionar
  a infra de memory operacional + relatórios/contexto pendentes.
- `main` local **sincronizada** com `origin/main` em `1425fb0` (fast-forward de
  `8575674` em 28/08).
- Branch antiga `lab/codex-claude-comparison`: merged na PR #3, remoto deletado,
  `upstream: gone` — pode ser removida localmente (`git branch -d`).
- Working tree: 5 itens **untracked** em vias de versionamento nesta PR —
  `memory/CURRENT_CONTEXT.md`, `backup_context/README.md`,
  `reports/report_task_28-08-26_11-22.md`, `reports/report_task_27-08-26_11-27.md`,
  `context/chat_history/CONTEXTO_CONTINUIDADE_CLAUDE_CODE_RULES_REPORTS_PR_2026-08-28.md`.
- Última reconciliação: 2026-08-28, contra `origin/main@1425fb0`.

## PEDAGOGICAL STATE

Fonte: `10_PROGRESS_LEDGER.md` (reconciliado 27/08, já em `main`).

- **M008 — Programação (JavaScript): EM ANDAMENTO.** Nível N1→N2 guiado.
  Retomar no checkpoint do primeiro `for` (loops + uso consciente de `let`);
  depois funções.
- **M004 — AI Coding Tools: PARCIAL.** Claude Code em N2 (execução guiada).
  Pendência que mantém a M004 parcial: comparação controlada Codex × Claude Code
  (adiada por decisão do usuário).
- M001–M003, M005–M007: concluídas.

## DECISIONS

- Plataforma de mentoria: **Projeto no Claude** (não mais Custom GPT). Referências
  operacionais migradas; referências históricas podem permanecer.
- Claude Code é o executor local preferencial para alterações autorizadas.
- Evolução pretendida: `RULES → VALIDATION → SKILLS → AGENTS → ORCHESTRATION →
  CONTROLLED AUTONOMY`. Agents só depois que Skills forem justificadas por evidência.
- Não criar Skills/Agents apenas para reconciliar catálogos antigos.
- Edição cirúrgica + comentário explícito no ponto alterado; Git diff é a evidência.

## PENDING

1. PR guiada em curso: versiona `memory/`, `backup_context/` e os relatórios/
   contexto pendentes. Aguardando Gates 1/2 e autorização de PR.
2. Análise de Skills candidatas: `git-closure` e `execution-report` já
   identificadas como as duas com mais evidência; drafts ainda não escritos.
3. `backup_context/` só terá backups reais na primeira compactação de memory.
4. Branch `lab/codex-claude-comparison` já merged — remover localmente.
5. M004 — comparação Codex × Claude Code continua pendente.
6. Gates humanos para commit/push/PR permanecem obrigatórios.

## NEXT

Concluir a PR guiada (Gate 1 → commit → Gate 2 → push → PR). Depois do merge:
atualizar esta memory, remover a branch antiga e escolher entre (a) draftar as
Skills operacionais `git-closure` e `execution-report`, ou (b) retomar a M008
(loops + `let`, checkpoint do primeiro `for`).

## LOAD ON DEMAND

Não carregar automaticamente; consultar só se a tarefa exigir:

- `reports/` (histórico de execuções) — abrir no máximo o relatório mais recente.
- `context/chat_history/` — contexto narrativo detalhado por sessão.
- `11_PROGRESS_LEDGER_RULES.md` — só ao editar o Ledger.
- `skills/`, `agents/`, `06_SKILLS_CATALOG.md`, `07_AGENTS_CATALOG.md` — conteúdo
  **pedagógico** (mentor), eixo diferente das Skills operacionais do Claude Code;
  divergências catálogo × filesystem conhecidas e não urgentes.
- `prompts/PROMPT_MESTRE_CONTINUIDADE.md` — bootstrap antigo, ainda com resíduos
  obsoletos; não usar como fonte de estado.
- `legacy/` — artefatos de laboratório arquivados.
