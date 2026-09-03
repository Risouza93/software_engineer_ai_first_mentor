---
name: pedagogical-checkpoint
description: >-
  Inserir pausas pedagógicas obrigatórias — 5 checkpoints (Análise, Proposta,
  Execução/Validação, Sync & Cleanup, Fronteira/Encerramento) — em qualquer
  tarefa significativa de edição, refactoring, diagnóstico ou decisão
  arquitetural conduzida com um mentorado. Automação não deve virar autonomia
  silenciosa: cada checkpoint para e pergunta antes de avançar, e a unidade de
  trabalho fecha num ponto de parada. Use sempre que a tarefa envolver
  ensino/mentoria, não só execução técnica. Autoridade:
  rules/16-pedagogical-checkpoints.md — em qualquer conflito, a Regra vence.
---

# pedagogical-checkpoint

Procedimento operacional do Claude Code para conduzir tarefas com pausas
pedagógicas deliberadas, em vez de execução silenciosa ponta a ponta.
**Autoridade:** `rules/16-pedagogical-checkpoints.md`.
Relacionadas: `rules/12-claude-code-artifact-automation.md` (edição),
`rules/14-git-safe-publishing.md` (gates de Git),
`rules/15-universal-execution-reports.md` (relatório técnico).

## Use when

Início de qualquer tarefa significativa em contexto de mentoria: edição,
refactoring, diagnóstico ou decisão arquitetural onde o objetivo inclui o
mentorado aprender/decidir, não só o código mudar.

## Não use para

- Microações dentro de uma tarefa já aprovada num checkpoint anterior.
- Tarefas puramente mecânicas sem decisão a ensinar (ex.: rodar um lint já
  configurado).
- Sessões onde o mentorado autorizou explicitamente pular os checkpoints
  (regra 16 §5) — nesse caso, registrar a exceção no relatório e seguir sem
  parar, mas ainda respeitando os Gates da regra 14.

## Inputs

- A tarefa proposta e o motivo pedagógico de trazê-la ao mentorado.
- Opções técnicas viáveis, com vantagem/risco de cada uma.
- Estado Git relevante (para o Checkpoint 3 — merge detectado; e o Checkpoint 4
  — confirmar que a unidade está fechada).
- Autorização explícita do mentorado em cada checkpoint — obtida durante o
  procedimento, nunca assumida.

## Outputs

- Decisões registradas (o quê foi escolhido e por quê) prontas para o
  relatório técnico (regra 15) e o resumo pedagógico (regra 16 §3).
- Trabalho executado só depois de aprovação no checkpoint correspondente.

## Procedimento

### Checkpoint 0 — Análise e Compreensão

No início da tarefa, antes de qualquer edição:

```text
Tarefa: <resumo>

OPÇÕES IDENTIFICADAS:
1. <abordagem A> — vantagem: <X>, risco: <Y>
2. <abordagem B> — vantagem: <X>, risco: <Y>

RECOMENDAÇÃO:
→ Opção <N> porque <justificativa pedagógica>

Você concorda? Quer ajustar algo? Ou prefere outra opção?
```

**Não prosseguir** sem resposta explícita.

### Checkpoint 1 — Proposta Técnica

Após aprovação da abordagem, antes de criar/alterar qualquer arquivo:

```text
PLANO TÉCNICO:
- <arquivo> → <o quê>
- <arquivo> → <o quê>

Passos: 1. ... 2. ... 3. ...

APRENDIZADO:
→ Esta tarefa aborda <conceitos> e reforça <habilidades>.

Quer que eu proceda? Alguma dúvida antes de começar?
```

**Não prosseguir** sem aprovação ou ajuste.

### Checkpoint 2 — Execução e Validação

Depois de executar/editar, **antes do Gate 1 de commit** (regra 14):

```text
RESULTADO: <o que foi feito>

VALIDAÇÕES:
✓ <validação 1>
✓ <validação 2>

DIFF SUMMARY: <git diff --stat compacto>

Tudo conforme esperado? Quer revisar algo antes do commit?
```

Só após confirmação aqui é que o Gate 1 (staging + commit) da skill
`git-closure` é apresentado.

### Checkpoint 3 — Sync & Cleanup pós-merge (pausa pedagógica do Gate 4)

Quando um merge no GitHub é detectado (`git fetch --all --prune` +
`main` local atrás de `origin/main`, ou branches locais/remotas de PRs
anteriores ainda presentes) — sempre **depois** do push, da PR e do merge:

```text
MERGE DETECTADO NO GITHUB:
origin/main foi atualizada. Seu repo local está sincronizado?

BRANCHES CANDIDATAS A LIMPEZA:
- <branch> (local / remota) — merged

Quais branches você quer manter?
```

**Não prosseguir** sem aprovação explícita. Esta é a pausa pedagógica; a execução
dos comandos (sync + `git branch -d` + `git push origin --delete`) segue o
**Gate 4** da skill `git-closure` / `rules/14` §12 — que se soma ao Gate 2 (push),
ao merge (Gate 3) e à abertura de PR, não os substitui.

### Checkpoint 4 — Fronteira / Encerramento

Ao concluir a unidade de trabalho (ciclo Git completo, ou tarefa sem Git):

```text
UNIDADE CONCLUÍDA:
- working tree limpa · sync feito · branches tratadas · relatório escrito
- resumo do que mudou + o que ficou pendente

Paro aqui. Qual o próximo passo?
```

**Parar (🛑) — não iniciar a próxima unidade de trabalho:** nada de puxar o
próximo item de pendências, começar o próximo commit, ou "aproveitar o embalo".
Exceção: sequência explicitamente autorizada pelo mentorado ("faça A, depois B,
depois pare") — e mesmo aí, parar ao fim da sequência.

### Relatório pedagógico

Ao final, incluir no `reports/` (junto ou anexo ao relatório técnico da regra
15) o resumo de decisões:

```markdown
## PEDAGOGICAL CHECKPOINT SUMMARY

### Checkpoint 0 — Abordagem
- Opções consideradas: A, B
- Escolhida: A — razão: <justificativa do mentorado>

### Checkpoint 1 — Plano
- Aprovado: sim/com ajustes

### Checkpoint 2 — Execução
- Resultado: conforme plano / divergências: <lista>

### Checkpoint 3 — Sync & Cleanup
- Merge detectado: sim/não
- Branches removidas: <lista>

### Checkpoint 4 — Fronteira / Encerramento
- Unidade fechada e parou para pedir o próximo passo: sim/não

### Aprendizados registrados
- <conceito>: <breve reflexão>

### Próximo passo
- <recomendação pedagógica>
```

Não é recursão (não relatar o relatório pedagógico) — só registra as escolhas.

## Interrupções obrigatórias (parar e consultar o mentorado)

- início de qualquer tarefa significativa sem checkpoint 0 feito;
- qualquer edição de arquivo antes do checkpoint 1 aprovado;
- qualquer commit (Gate 1 da regra 14) antes do checkpoint 2 confirmado;
- merge detectado sem checkpoint 3 apresentado;
- unidade de trabalho concluída sem checkpoint 4 (parar e pedir o próximo passo);
- pedido de pular checkpoints sem autorização explícita registrada.

## Validações (Definition of Done)

Para cada checkpoint executado, deve ser possível apontar: a pergunta feita,
a resposta do mentorado, e a ação que seguiu dessa resposta. Nenhuma edição,
commit ou limpeza de branch acontece sem o checkpoint correspondente ter sido
respondido — exceto sob exceção explícita registrada (regra 16 §5).

## Anti-padrões

- Assumir a resposta de um checkpoint anterior para pular o atual (regra 16
  §6 — o contexto muda, perguntar de novo).
- Misturar o checkpoint pedagógico com o Gate técnico da regra 14 (são
  complementares, não substitutos um do outro).
- Registrar "decisão" sem a justificativa do mentorado.
- Usar esta skill para microações que não envolvem ensino/decisão.

## Evidência de recorrência

Regra nova (`rules/16-pedagogical-checkpoints.md`, 01/09/2026) — ainda sem
histórico de execuções em `reports/`. Este skill nasce junto com a Regra;
evidência de recorrência será acumulada nas próximas execuções pedagógicas e
citada aqui quando houver.
