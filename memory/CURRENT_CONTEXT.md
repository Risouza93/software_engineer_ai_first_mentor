<!-- CRIADO 2026-08-28: primeira versão da memory operacional (regra 13). Sem backup anterior porque não existia CURRENT_CONTEXT.md. -->
<!-- ALTERADO 2026-08-28: reconciliado pós-merge da PR #4; a infra de memory (memory/, backup_context/, relatórios) está publicada em main. -->
<!-- ALTERADO 2026-09-01: reconciliado pós-merge das PRs #5-#8 (memory, Skills operacionais draft+executáveis, Regra 16 + reorganização rules/instructions). -->

# CURRENT CONTEXT

## NOW

Projeto **Software Engineering AI First Mentor**. Governança (regras 12–16),
memory operacional, Skills operacionais executáveis (`git-closure`,
`execution-report`, `pedagogical-checkpoint`) e a raiz reorganizada em
`rules/` + `instructions/` estão **publicadas em `main`** (`7a8dfdf`): PR #3
(regras + Ledger, 27/08); PR #4 (`memory/`, `backup_context/`, 28/08); PRs #5–#7
(reconciliação de memory, Skills operacionais draft e executáveis, 01/09); PR #8
(Regra 16 + reorganização `rules/`/`instructions/`, 01/09).

Fase atual: **sem trabalho Git em curso.** Próximo: validar as Skills executáveis
(inclusive `pedagogical-checkpoint`, ainda sem execução real) no próximo fluxo,
ou retomar a M008.

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

- `rules/12-claude-code-artifact-automation.md` — automação de artefatos:
  edição cirúrgica, comentário `<!-- ALTERADO YYYY-MM-DD: ... -->`, preservar o
  resto, delegar publicação à 14 e relatório à 15.
- `rules/13-universal-memory-context-compaction.md` — memory/backup_context e
  eficiência de tokens. `memory/` = hot context; `backup_context/` = cold.
  Meta desta memory: ~500–1.500 palavras (menos quando possível).
- `rules/14-git-safe-publishing.md` — inspeção/diff/proposta automáticos;
  **staging+commit = Gate 1 humano**, **push = Gate 2 humano**, **PR = autorização
  separada**. Operações destrutivas (reset --hard, rebase, amend, push --force,
  restore .) nunca automáticas.
- `rules/15-universal-execution-reports.md` — toda execução significativa gera
  1 relatório em `reports/report_task_DD-MM-YY_HH-mm.md`. Nunca sobrescrever;
  nunca relatório sobre relatório; criar o relatório não autoriza `git add`.
- `rules/16-pedagogical-checkpoints.md` — pausas pedagógicas obrigatórias:
  4 checkpoints (Análise, Proposta, Validação, Sync&Cleanup), questionamento de
  abordagem, relatórios pedagógicos com decisões, limpeza de branches pós-merge.
  Skill complementar: `pedagogical-checkpoint` em `.claude/skills/`.

Arquitetura de contexto:

```text
memory/            → ONDE ESTAMOS (hot)
reports/           → O QUE CADA EXECUÇÃO FEZ (audit/cold)
context/chat_history/ → COMO A SESSÃO EVOLUIU (narrativo)
backup_context/    → O QUE A MEMORY SABIA ANTES (cold; dir criado, backups só na 1ª compactação)
Git                → O QUE TECNICAMENTE MUDOU (evidência)
```

## GIT STATE

- `main` local **sincronizada** com `origin/main` em `7a8dfdf` (merge da PR #8).
- Nenhuma branch de trabalho ativa. Branches das PRs #3–#8 mergeadas e removidas
  localmente; branches remotas de #5/#6/#7/#8 — deleção pendente de decisão humana.
- Working tree limpa. Novo trabalho começa com branch a partir de `main` atualizada.
- Nota operacional: evitar 2ª sessão Git (Claude/VSCode) no mesmo worktree em
  paralelo — em 01/09 isso descartou um Gate 1 não commitado (ver `reports/`).
- Última reconciliação: 2026-09-01, contra `origin/main@7a8dfdf`.

## PEDAGOGICAL STATE

Fonte: `instructions/10-progress-ledger.md` (reconciliado 27/08, já em `main`).

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

1. Validar `pedagogical-checkpoint` em uso real (ainda sem execução); decidir se
   os drafts em `skills/operational/*-skill.md` continuam como companion legível
   ou são enxugados.
2. Deletar branches remotas de #5/#6/#7/#8 — decisão humana explícita (Gate 3b).
3. `backup_context/` só terá backups reais na primeira compactação de memory.
4. M004 — comparação Codex × Claude Code continua pendente.
5. Gates humanos para commit/push/PR permanecem obrigatórios.

## NEXT

Escolher entre (a) exercitar `pedagogical-checkpoint` no próximo fluxo real, ou
(b) retomar a M008 (loops + `let`, checkpoint do primeiro `for`). Qualquer
alteração passa por branch + Gates 1/2 + PR.

## LOAD ON DEMAND

Não carregar automaticamente; consultar só se a tarefa exigir:

- `reports/` (histórico de execuções) — abrir no máximo o relatório mais recente.
- `context/chat_history/` — contexto narrativo detalhado por sessão.
- `instructions/11-progress-ledger-rules.md` — só ao editar o Ledger.
- `.claude/skills/<nome>/SKILL.md` — Skills **operacionais executáveis**
  (`git-closure` regra 14, `execution-report` regra 15, `pedagogical-checkpoint`
  regra 16); em conflito, a Regra vence. `skills/operational/*-skill.md` = os
  mesmos procedimentos em prosa (companion legível).
- `skills/*-skill.md`, `agents/`, `instructions/06-skills-catalog.md`,
  `instructions/07-agents-catalog.md` — conteúdo **pedagógico** (mentor), eixo
  diferente das Skills operacionais; divergências catálogo × filesystem
  conhecidas e não urgentes.
- `prompts/PROMPT_MESTRE_CONTINUIDADE.md` — bootstrap antigo, ainda com resíduos
  obsoletos; não usar como fonte de estado.
- `legacy/` — artefatos de laboratório arquivados.
