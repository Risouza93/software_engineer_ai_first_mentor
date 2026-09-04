<!-- ALTERADO 2026-09-04: +cc-flow no catálogo — skill de orquestração fina das outras 3, criada com evidência de 7+ ciclos reais (PRs #13, #15, #19, #21, #22, #23). -->
# skills/operational/ — Skills operacionais do Claude Code

Estas Skills descrevem **como o Claude Code executa uma responsabilidade
operacional recorrente** no repositório. São um eixo diferente das Skills
pedagógicas em `skills/*-skill.md`, que ensinam o **humano**.

```text
skills/*-skill.md         → mentoria: ensinar uma habilidade ao aluno
skills/operational/*.md    → execução: procedimento do Claude Code sob uma Regra
```

## Relação com as Regras

Cada Skill operacional tem uma **Regra canônica como autoridade**. A Regra é a
política (o que deve ser verdade, os limites, os gates); a Skill é o
**procedimento executável** (sequência de comandos, checklists, templates,
pontos de decisão) que torna o cumprimento da Regra rápido e consistente.

```text
REGRA   → política / limites / autoridade
SKILL   → procedimento repetível que cumpre a política
```

Em qualquer conflito, **a Regra vence** e a Skill deve ser corrigida.

<!-- ALTERADO 2026-09-01: os 3 arquivos deixaram de ser companions de corpo completo e viraram ponteiros — o procedimento não é mais duplicado; a única cópia é a versão executável em .claude/skills/. -->
## Estado

Os procedimentos foram validados em uso real e vivem, como **cópia única**, nas
Skills executáveis do Claude Code (`.claude/skills/<nome>/SKILL.md`, PR #7). Os
arquivos deste diretório são **ponteiros** — cabeçalho + resumo de uma frase +
link para a versão executável e para a Regra. Não duplicam o procedimento. Em
divergência, vale a versão executável e, acima dela, a Regra canônica.

## Catálogo

| Skill (companion) | Versão executável | Autoridade | Responsabilidade |
|---|---|---|---|
| `git-closure-skill.md` | `.claude/skills/git-closure/SKILL.md` | `rules/14-git-safe-publishing.md` | encerrar alterações com Git de forma auditável e com gates humanos |
| `execution-report-skill.md` | `.claude/skills/execution-report/SKILL.md` | `rules/15-universal-execution-reports.md` | registrar cada execução significativa em `reports/` |
| `pedagogical-checkpoint-skill.md` | `.claude/skills/pedagogical-checkpoint/SKILL.md` | `rules/16-pedagogical-checkpoints.md` | inserir as 5 pausas pedagógicas obrigatórias em tarefas de mentoria |
| `cc-flow-skill.md` | `.claude/skills/cc-flow/SKILL.md` | `rules/14` + `rules/15` + `rules/16` (combinadas) | orquestrar as 3 linhas acima, em ordem, numa unidade de trabalho — sem duplicar nenhuma |
