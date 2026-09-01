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

## Estado

Estes arquivos são **drafts para validação** (etapa `RULES → VALIDATION → SKILLS`
do roadmap). Ainda **não** são Skills executáveis do Claude Code
(`.claude/skills/<nome>/SKILL.md`). A conversão para formato executável é uma
decisão humana posterior, após a validação em uso real.

## Catálogo

| Skill | Autoridade | Responsabilidade |
|---|---|---|
| `git-closure-skill.md` | `14_GIT_SAFE_PUBLISHING_RULES.md` | encerrar alterações com Git de forma auditável e com gates humanos |
| `execution-report-skill.md` | `15_UNIVERSAL_EXECUTION_REPORTS_RULES.md` | registrar cada execução significativa em `reports/` |
