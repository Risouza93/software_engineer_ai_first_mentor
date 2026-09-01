<!-- CRIADO 2026-09-01: companion legível da Skill executável pedagogical-checkpoint (PR #8), para paridade com git-closure-skill.md e execution-report-skill.md. -->
# Skill operacional — pedagogical-checkpoint

**Tipo:** operacional (procedimento do Claude Code)
**Autoridade:** `rules/16-pedagogical-checkpoints.md` — em qualquer conflito, a Regra vence.
**Relacionadas:** `rules/12-claude-code-artifact-automation.md` (edição), `rules/14-git-safe-publishing.md` (gates de Git), `rules/15-universal-execution-reports.md` (relatório técnico).
**Status:** companion legível. A versão executável e canônica do procedimento é
`.claude/skills/pedagogical-checkpoint/SKILL.md`; em divergência, vale a executável e, acima dela, a Regra 16.

## Use when

Início de qualquer tarefa significativa em contexto de mentoria — edição,
refactoring, diagnóstico ou decisão arquitetural — onde o objetivo inclui o
mentorado **aprender e decidir**, não apenas o código mudar.

## Não use para

- Microações dentro de uma tarefa já aprovada num checkpoint anterior.
- Tarefas puramente mecânicas, sem decisão a ensinar.
- Sessões em que o mentorado autorizou explicitamente pular os checkpoints
  (Regra 16 §5) — aí registra-se a exceção no relatório e segue-se sem parar,
  mas os Gates da Regra 14 continuam valendo.

## Os quatro checkpoints

1. **Checkpoint 0 — Análise e Compreensão.** Antes de qualquer edição: resumir a
   tarefa, listar as opções viáveis (vantagem/risco de cada), recomendar uma com
   justificativa pedagógica e parar. Não prosseguir sem resposta explícita.
2. **Checkpoint 1 — Proposta Técnica.** Depois da abordagem aprovada e antes de
   criar/alterar arquivos: mostrar o plano (arquivos, passos, o que se aprende)
   sem executar. Não prosseguir sem aprovação ou ajuste.
3. **Checkpoint 2 — Execução e Validação.** Depois de editar e antes do Gate 1 de
   commit (Regra 14): mostrar resultado, validações e `git diff --stat`, e
   confirmar que bate com o plano. Só depois é que o Gate 1 da `git-closure` é
   apresentado.
4. **Checkpoint 3 — Branch Cleanup & Sync.** Quando um merge no GitHub é
   detectado: informar o merge, oferecer atualizar o local, perguntar sobre
   limpeza de branches e parar. Soma-se aos Gates 2/3/3b da `git-closure`, não os
   substitui.

## Relatório pedagógico

Ao final, além do relatório técnico da Regra 15, registrar em `reports/` um
resumo compacto das decisões: opções consideradas e escolha em cada checkpoint,
a razão dada pelo mentorado, ajustes pedidos, branches removidas, aprendizados e
próximo passo. Não é recursão — apenas registra as escolhas.

## Anti-padrões

- Assumir a resposta de um checkpoint anterior para pular o atual — o contexto
  muda, pergunta-se de novo (Regra 16 §6).
- Tratar o checkpoint pedagógico e o Gate técnico da Regra 14 como substitutos um
  do outro; são complementares.
- Registrar "decisão" sem a justificativa do mentorado.
- Usar esta Skill para microações que não envolvem ensino.

## Evidência de recorrência

Regra nova (`rules/16-pedagogical-checkpoints.md`, 01/09/2026) — ainda sem
histórico de execuções em `reports/`. A evidência será acumulada nas próximas
execuções pedagógicas e citada aqui quando houver.
