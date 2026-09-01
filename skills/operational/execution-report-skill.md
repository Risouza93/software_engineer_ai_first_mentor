<!-- ALTERADO 2026-09-01: reduzido a ponteiro. O procedimento vivia duplicado aqui e em .claude/skills/execution-report/SKILL.md; a versão executável passa a ser a única cópia. -->
# Skill operacional — execution-report (ponteiro)

**Procedimento executável e canônico:** [`.claude/skills/execution-report/SKILL.md`](../../.claude/skills/execution-report/SKILL.md)
**Autoridade (política):** [`rules/15-universal-execution-reports.md`](../../rules/15-universal-execution-reports.md)
**Relacionadas:** `rules/14` (o relatório só entra no commit pelo Gate 1), `rules/13` (relatório ≠ memory).

Ao final de toda execução significativa, gera **1** relatório em
`reports/report_task_DD-MM-YY_HH-mm.md` com estrutura fixa (METADATA, SUMMARY,
FILES, VALIDATION, GIT, WARNINGS, PENDING, NEXT). Factual e compacto; nunca
sobrescreve um relatório anterior; nunca relata a si mesmo; criar o relatório não
autoriza `git add`.

Este arquivo é só o ponteiro legível. Qualquer mudança de procedimento é feita na
versão executável; em divergência, valem a executável e, acima dela, a Regra 15.
