<!-- ALTERADO 2026-09-01: reduzido a ponteiro. O procedimento vivia duplicado aqui e em .claude/skills/git-closure/SKILL.md; a versão executável passa a ser a única cópia. -->
<!-- ALTERADO 2026-09-03: pós-merge nomeado como Gate 4 (sync & cleanup), alinhado à rules/14 §12. -->
# Skill operacional — git-closure (ponteiro)

**Procedimento executável e canônico:** [`.claude/skills/git-closure/SKILL.md`](../../.claude/skills/git-closure/SKILL.md)
**Autoridade (política):** [`rules/14-git-safe-publishing.md`](../../rules/14-git-safe-publishing.md)
**Relacionadas:** `rules/12` (edição cirúrgica), `rules/15` (relatório), `rules/16 §8` (consolidação de commits).

Encerra com Git uma execução que alterou arquivos: pré-flight, diff como
evidência, proposta de commit consolidada por escopo, **Gate 1** (staging +
commit), **Gate 2** (push) e, com autorização separada, abertura de PR (o merge é
o **Gate 3**, decisão humana) — mais o **Gate 4** (sync & cleanup pós-merge:
`pull --ff-only` + `branch -d` + `push --delete`). Não faz merge, rebase, reset --hard,
amend, push --force, nem publica direto em `main`.

Este arquivo é só o ponteiro legível. Qualquer mudança de procedimento é feita na
versão executável; em divergência, valem a executável e, acima dela, a Regra 14.
