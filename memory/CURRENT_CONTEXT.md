<!-- CRIADO 2026-08-28: primeira versão da memory operacional (regra 13). Sem backup anterior porque não existia CURRENT_CONTEXT.md. -->
<!-- ALTERADO 2026-08-28: reconciliado pós-merge da PR #4; a infra de memory (memory/, backup_context/, relatórios) está publicada em main. -->
<!-- ALTERADO 2026-09-01: reconciliado pós-merge das PRs #5-#8 (memory, Skills operacionais draft+executáveis, Regra 16 + reorganização rules/instructions). -->
<!-- ALTERADO 2026-09-01: +rules/00-operating-model (digest); Regra 16 §8 (consolidação de commits); skills/operational reduzidas a ponteiros. -->
<!-- ALTERADO 2026-09-01: reconciliado pós-merge das PRs #9-#11 (relatórios da colisão; referências de arquivo pós-reorg; §8 + digest + compactação da Regra 13). -->
<!-- ALTERADO 2026-09-01: reconciliado pós-merge da PR #13 (Regra 16 §2.5 = Checkpoint 4 Fronteira); PENDING #3 resolvido; ACTIVE RULES = 5 checkpoints. -->
<!-- ALTERADO 2026-09-01: Tarefa 2 (prompts/ de continuidade realinhados à Regra 13) concluída; PROMPT_MESTRE_CONTINUIDADE.md movido para legacy/; PENDING de prompts/ resolvido. -->
<!-- ALTERADO 2026-09-01: reconciliação leve pós-merge das PRs #14-#15 — NOW e GIT STATE em main@66c7a94; histórico de PRs até #15. -->
<!-- ALTERADO 2026-09-01: reconciliação pós-merge das PRs #16-#17 (reconciliação leve; README reescrito como referência de SR) — main@dbba24a. Sessão encerrada por contexto cheio; retomar em sessão nova. -->
<!-- ALTERADO 2026-09-03: reconciliação pós-merge da PR #19 (Gate 4 pós-merge formalizado na Regra 14 §12; merge = Gate 3; "Gate 3b" aposentado) + commit manual 8db7e04 (moves de legacy/, seção de memory no digest 00) — main@1b2efd7. -->
<!-- ALTERADO 2026-09-04: PENDING #5 (Melhoria 2 do handoff qa_automation) avaliado e fechado — README já seguia o princípio "mapa enxuto" desde a PR #17; diagrama de Arquitetura duplicado entre README.md e esta memory removido daqui, com ponteiro para o README. -->
<!-- ALTERADO 2026-09-04: reconciliação pós-merge da PR #21 (dedupe do diagrama + fechamento do PENDING #5) — main@5692656. Histórico de PRs até #21. -->

# CURRENT CONTEXT

## NOW

Projeto **Software Engineering AI First Mentor**. Toda a governança está
**publicada em `main`** (`5692656`): regras `00` (digest operacional) e `12–16`,
memory operacional, Skills executáveis (`git-closure`, `execution-report`,
`pedagogical-checkpoint`), raiz em `rules/` + `instructions/`.

Modelo de Gates de Git agora com 4 (Regra 14): Gate 1 (commit), Gate 2 (push),
**Gate 3 = merge humano**, **Gate 4 = sync & cleanup pós-merge** (§12 — sync da
`main` + `git branch -d` + `git push origin --delete`, com caixa de autorização).
A pausa pedagógica que antecede o Gate 4 é o Checkpoint 3 da Regra 16 §2.4.

Histórico de PRs: #3 (regras + Ledger, 27/08); #4 (`memory/`, `backup_context/`,
28/08); #5–#7 (memory, Skills draft e executáveis, 01/09); #8 (Regra 16 +
reorganização da raiz); #9 (relatórios históricos da colisão de sessões); #10
(correção de referências de arquivo quebradas pós-reorg); #11 (Regra 16 §8 =
consolidação de commits por escopo; `rules/00`; `skills/operational/*` reduzidas
a ponteiros; dedupe do modelo de gates 12→14; Regra 13 compactada 628→550);
PR #13 (Regra 16 §2.5 = Checkpoint 4 "Fronteira/Encerramento", codifica
`stop-after-closure`; Tarefa 1 do plano de exercitar `pedagogical-checkpoint`);
PR #14 (reconciliação de memory pós-#13); PR #15 (Tarefa 2 —
`prompts/ATUALIZAR_CONTEXTO.md` e `COMPACTAR_CONTEXTO.md` realinhados à Regra 13,
`PROMPT_MESTRE_CONTINUIDADE.md` → `legacy/`); PR #16 (reconciliação leve);
PR #17 (`README.md` reescrito 439→140 linhas como referência de SR, V1–V6 só no
rodapé, 15 links validados); PR #18 (reconciliação de memory pós-#16/#17);
commit manual `8db7e04` direto em `main` (moves `legacy/` → `legacy/archive/`,
seção "Gerenciamento de Memória" no digest `rules/00`, entrada do relatório de
handoff do `qa_automation`); **PR #19** (Gate 4 pós-merge formalizado na
Regra 14 §12, merge nomeado Gate 3, `rules/16` §2.4 sem comandos crus, diagrama
§4 corrigido, `"Gate 3b"` → `"Gate 4"` nos arquivos vivos — porte de melhoria do
projeto irmão `qa_automation`); PR #20 (reconciliação de memory pós-#19,
registra o modelo de 4 Gates e o commit manual `8db7e04`); **PR #21** (avalia a
Melhoria 2 do handoff `qa_automation` — README "mapa enxuto" já resolvido pela
PR #17, sem porte necessário — e remove o diagrama de Arquitetura duplicado
entre `README.md` e esta memory, substituído por ponteiro; fecha PENDING #5).

Fase atual: **nenhum trabalho Git em curso; working tree limpa.** O plano de
exercitar `pedagogical-checkpoint` em fluxos reais segue (PRs #13, #15, #19,
#21). A próxima decisão está em NEXT.

Nota: em 01/09 apareceram 3 arquivos não rastreados (`guides/QUICK_REFERENCE.md`,
`guides/SESSION_HANDOFF.md`, `BOOTSTRAP_SESSION.md`), criados por engano numa
sessão de colega interrompida, com erros (contradiziam a Regra 13). Foram
descartados; nunca entraram no Git. Não recriar — a retomada de sessão usa
`memory/CURRENT_CONTEXT.md` + `rules/00`, sem arquivo especial de bootstrap.

## ARCHITECTURE

<!-- ALTERADO 2026-09-04: diagrama removido daqui — duplicava o do README.md quase verbatim (Melhoria 2 do handoff qa_automation, ver PENDING). Versão canônica: seção "Arquitetura" do README.md; memory é hot/operacional, não repositório de diagramas estáticos (Regra 13). -->
Diagrama canônico: seção "Arquitetura" do [`README.md`](../README.md).

Retomada normal: ler esta memory primeiro, validar Git com comandos baratos,
abrir só os arquivos que a tarefa exige. Não reauditar o repositório.

## ACTIVE RULES

Regras canônicas na raiz do repo (não copiar conteúdo; abrir sob demanda):

- `rules/00-operating-model.md` — **digest** (~1 pág) do modelo inteiro (gates,
  checkpoints, edição cirúrgica, memory). Em fluxo rotineiro, ler só este; abrir
  a regra completa abaixo só ao atuar naquele domínio.
- `rules/12-claude-code-artifact-automation.md` — automação de artefatos:
  edição cirúrgica, comentário `<!-- ALTERADO YYYY-MM-DD: ... -->`, preservar o
  resto, delegar publicação à 14 e relatório à 15.
- `rules/13-universal-memory-context-compaction.md` — memory/backup_context e
  eficiência de tokens. `memory/` = hot context; `backup_context/` = cold.
  Meta desta memory: ~500–1.500 palavras (menos quando possível).
- `rules/14-git-safe-publishing.md` — inspeção/diff/proposta automáticos;
  **staging+commit = Gate 1 humano**, **push = Gate 2 humano**, **PR = autorização
  separada; merge = Gate 3**, **Gate 4 = sync & cleanup pós-merge** (§12 — sync da
  `main` + `git branch -d` + `git push origin --delete`, caixa de autorização).
  Operações destrutivas (reset --hard, rebase, amend, push --force, restore .)
  nunca automáticas.
- `rules/15-universal-execution-reports.md` — toda execução significativa gera
  1 relatório em `reports/report_task_DD-MM-YY_HH-mm.md`. Nunca sobrescrever;
  nunca relatório sobre relatório; criar o relatório não autoriza `git add`.
- `rules/16-pedagogical-checkpoints.md` — pausas pedagógicas obrigatórias:
  5 checkpoints (Análise, Proposta, Validação, **Sync & Cleanup pós-merge**
  [§2.4] = pausa pedagógica que antecede o Gate 4 da Regra 14, **Fronteira/
  Encerramento** [§2.5] = parar ao fim de cada unidade de trabalho), questionamento
  de abordagem, relatórios pedagógicos com decisões.
  **§8: consolidação de commits por escopo** (heurística "1 frase = 1 commit").
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

- `main` local **sincronizada** com `origin/main` em `5692656` (merge da PR #21).
- Nenhuma branch de trabalho ativa. Branches das PRs #3–#21 mergeadas e removidas
  **local e remotamente** pelo Gate 4.
- Working tree limpa. Novo trabalho começa com branch a partir de `main` atualizada.
- Nota operacional: evitar 2ª sessão Git (Claude/VSCode) no mesmo worktree em
  paralelo — em 01/09 isso descartou um Gate 1 não commitado (ver `reports/`).
- **Checkpoint 4 / Fronteira (Regra 16 §2.5, canônico):** ao fim de uma
  unidade de trabalho (ciclo Git completo ou tarefa sem Git), parar e pedir o
  próximo passo — não encadear.
- Última reconciliação: 2026-09-04, contra `origin/main@5692656`.

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

1. `pedagogical-checkpoint` exercitado em 3 fluxos reais (PR #13, #15, #19).
   Próximo: reavaliar se um CC Agent / CC Reviewer / skill `cc-flow` se justifica
   pela evidência gerada nesses fluxos.
2. `backup_context/` só terá backups reais na primeira compactação de memory.
3. M004 — comparação Codex × Claude Code continua pendente.
4. Gates humanos (Gate 1 commit, Gate 2 push, PR, Gate 3 merge, Gate 4 pós-merge)
   permanecem obrigatórios.
5. ~~Melhoria 2 do relatório de handoff do `qa_automation` (README como "mapa
   enxuto")~~ — **RESOLVIDO 2026-09-04**: avaliado contra o `README.md` atual
   (142 linhas, já reescrito na PR #17 antes do handoff existir) — não é
   refatoração aplicável, o princípio já estava seguido (ponteiros para
   `instructions/`, nomes reais de diretório, "não reproduz o progresso").
   Único ponto real de sobreposição — o diagrama de arquitetura duplicado
   entre README.md e esta memory — corrigido nesta mesma PR (ver
   `## ARCHITECTURE` acima). Ver
   `legacy/archive/RELATORIO_MELHORIAS_PARA_MENTOR.md` para o relatório original.

## NEXT

**Ponto de retomada da próxima sessão.** Escolher entre (a) reavaliar CC Agent /
CC Reviewer / skill `cc-flow` com a evidência dos 2 fluxos já executados, ou
(b) retomar a M008 (loops + `let`, checkpoint do primeiro `for`). Qualquer
alteração passa por branch + Gates 1/2 + PR.

## LOAD ON DEMAND

Não carregar automaticamente; consultar só se a tarefa exigir:

- `reports/` (histórico de execuções) — abrir no máximo o relatório mais recente.
- `context/chat_history/` — contexto narrativo detalhado por sessão.
- `instructions/11-progress-ledger-rules.md` — só ao editar o Ledger.
- `.claude/skills/<nome>/SKILL.md` — Skills **operacionais executáveis**
  (`git-closure` regra 14, `execution-report` regra 15, `pedagogical-checkpoint`
  regra 16); cópia única do procedimento; em conflito, a Regra vence.
  `skills/operational/*-skill.md` = **ponteiros** (cabeçalho + link), não
  duplicam mais o procedimento.
- `skills/*-skill.md`, `agents/`, `instructions/06-skills-catalog.md`,
  `instructions/07-agents-catalog.md` — conteúdo **pedagógico** (mentor), eixo
  diferente das Skills operacionais; divergências catálogo × filesystem
  conhecidas e não urgentes.
- `legacy/PROMPT_MESTRE_CONTINUIDADE.md` — bootstrap pré-Regra 13, arquivado;
  registro histórico, não usar como fonte de estado. Retomada parte de
  `memory/CURRENT_CONTEXT.md` + `rules/00`.
- `legacy/` — artefatos de laboratório arquivados.
