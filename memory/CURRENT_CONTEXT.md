<!-- COMPACTADO 2026-09-04: versão anterior (1668 palavras, histórico narrativo de PRs #3–#21) preservada em backup_context/MEMORY_BACKUP_2026-09-04_1426.md (Regra 13 §13). Histórico completo de PRs também disponível em `git log --oneline`. -->

# CURRENT CONTEXT

## NOW

Projeto **Software Engineering AI First Mentor**. Governança publicada em
`main` (`1e4ee1e`): regras `00` (digest) + `12–16`, memory operacional, Skills
executáveis (`git-closure`, `execution-report`, `pedagogical-checkpoint`).

Modelo de Gates de Git (Regra 14): Gate 1 (commit), Gate 2 (push), PR
(autorização separada), Gate 3 (merge humano), Gate 4 (sync & cleanup
pós-merge, §12). O Checkpoint 3 da Regra 16 §2.4 é a pausa pedagógica que
antecede o Gate 4.

Mudança mais recente (PRs #21–#22, 04/09): avaliada e fechada a Melhoria 2 do
relatório de handoff `qa_automation` (README como "mapa enxuto") — já resolvida
pela PR #17, sem refatoração a portar; corrigido o único ponto real de
sobreposição encontrado (diagrama de Arquitetura duplicado entre `README.md` e
esta memory — agora só no README); memory reconciliada e compactada nesta
mesma unidade de trabalho. Histórico completo de PRs #3–#22: `git log
--oneline` e `backup_context/MEMORY_BACKUP_2026-09-04_1426.md`.

Fase atual: nenhum trabalho Git em curso; working tree limpa. Próxima decisão
em NEXT.

## ARCHITECTURE

Diagrama canônico: seção "Arquitetura" do [`README.md`](../README.md).
Retomada normal: ler esta memory primeiro, validar Git com comandos baratos,
abrir só os arquivos que a tarefa exige. Não reauditar o repositório.

## ACTIVE RULES

Regras canônicas: `rules/00-operating-model.md` (digest de ~1 página, ler
primeiro em fluxo rotineiro) e `rules/12`–`16` (edição cirúrgica; memory &
`backup_context/`; Git safe publishing com os 4 Gates; relatórios de execução;
checkpoints pedagógicos). Precedência: 16 > 15 > 14 > 13 > 12. Tabela de uma
frase por regra: seção "Regras ativas" do `README.md` — não repetida aqui para
evitar duplicação. Skills operacionais executáveis (cópia única do
procedimento): `.claude/skills/git-closure`, `.claude/skills/execution-report`,
`.claude/skills/pedagogical-checkpoint`.

## GIT STATE

- `main` local sincronizada com `origin/main` em `1e4ee1e` (merge da PR #22).
- Nenhuma branch de trabalho ativa; branches das PRs #3–#22 mergeadas e
  removidas local e remotamente pelo Gate 4.
- Working tree limpa. Novo trabalho começa com branch a partir de `main`
  atualizada.
- Checkpoint 4 / Fronteira (Regra 16 §2.5): ao fim de uma unidade de trabalho,
  parar e pedir o próximo passo — não encadear.
- Última reconciliação: 2026-09-04, contra `origin/main@1e4ee1e`.

## PEDAGOGICAL STATE

Fonte: `instructions/10-progress-ledger.md`.

- **M008 — Programação (JavaScript): EM ANDAMENTO.** Nível N1→N2. Retomar no
  checkpoint do primeiro `for` (loops + uso consciente de `let`); depois
  funções.
- **M004 — AI Coding Tools: PARCIAL.** Claude Code em N2. Pendência: comparação
  controlada Codex × Claude Code (adiada por decisão do usuário).
- M001–M003, M005–M007: concluídas.

## DECISIONS

- Plataforma de mentoria: **Projeto no Claude** (não mais Custom GPT).
- Claude Code é o executor local preferencial para alterações autorizadas.
- Evolução pretendida: `RULES → VALIDATION → SKILLS → AGENTS → ORCHESTRATION →
  CONTROLLED AUTONOMY`. Agents só depois que Skills forem justificadas por
  evidência; não criar Skills/Agents só para reconciliar catálogos antigos.
- Edição cirúrgica + comentário explícito no ponto alterado; Git diff é a
  evidência.

## PENDING

1. `pedagogical-checkpoint` exercitado em 4 fluxos reais (PRs #13, #15, #19,
   #21). Próximo: reavaliar se um CC Agent / CC Reviewer / skill `cc-flow` se
   justifica pela evidência gerada.
2. M004 — comparação Codex × Claude Code continua pendente.

## NEXT

Ponto de retomada da próxima sessão. Escolher entre (a) reavaliar CC Agent /
CC Reviewer / skill `cc-flow` com a evidência dos 4 fluxos já executados, ou
(b) retomar a M008 (loops + `let`, checkpoint do primeiro `for`). Qualquer
alteração passa por branch + Gates 1/2 + PR.

## LOAD ON DEMAND

Não carregar automaticamente; consultar só se a tarefa exigir:

- `reports/` — abrir no máximo o relatório mais recente.
- `context/chat_history/` — narrativa detalhada por sessão.
- `backup_context/` — versões anteriores desta memory (histórico completo de
  PRs #3–#21 antes desta compactação); consultar só sob investigação histórica.
- `instructions/11-progress-ledger-rules.md` — só ao editar o Ledger.
- `.claude/skills/<nome>/SKILL.md` — procedimento operacional único; em
  conflito, a Regra vence. `skills/operational/*-skill.md` = ponteiros.
- `skills/*-skill.md`, `agents/`, `instructions/06-skills-catalog.md`,
  `instructions/07-agents-catalog.md` — conteúdo pedagógico (mentor), eixo
  diferente das Skills operacionais.
- `legacy/` — artefatos arquivados, não são fonte de estado.
