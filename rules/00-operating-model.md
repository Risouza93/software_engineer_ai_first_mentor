<!-- CRIADO 2026-09-01: digest normativo do modelo operacional para reduzir tokens de retomada — evita abrir as regras 12–16 completas em fluxos rotineiros. -->
# Modelo Operacional — Digest

Resumo normativo do modelo de trabalho. **As autoridades completas são as Regras
12–16** (`rules/12`…`rules/16`); abra a regra inteira só quando for atuar naquele
domínio (tabela no fim). Em conflito, a regra completa vence este digest, e a
ordem de precedência é **16 > 15 > 14 > 13 > 12**.

## Camadas

```text
PROJETO NO CLAUDE  → mentoria, contexto, regras, decisões pedagógicas
CLAUDE CODE        → execução local (análise + alterações cirúrgicas)
GIT / GITHUB       → evidência, versionamento, colaboração
HUMANO             → aprova gates e decisões relevantes
```

## Gates humanos de Git (Regra 14)

1. **Gate 1 — staging + commit.** Inspeção/diff/proposta são automáticos; `git add`
   e `git commit` só após "sim" explícito. Autorização para editar ≠ para commitar.
2. **Gate 2 — push.** Commit não autoriza push.
3. **PR — autorização separada.** Push não autoriza PR. Nunca fazer merge.

Nunca commitar direto em `main`. Proibido por padrão (sem autorização
específica): `git merge`, `git rebase`, `git reset --hard`, `git clean`,
`git commit --amend`, `git push --force`, `git push --force-with-lease`,
`git restore .`, `git checkout -- .`, alterar Git global, incluir segredos.

## Checkpoints pedagógicos (Regra 16)

Pausar e consultar o mentorado em: **Análise** (opções + recomendação), **Proposta
técnica** (plano antes de editar), **Execução/Validação** (resultado antes do
Gate 1), **Sync & Cleanup** (após merge detectado) e **Fronteira** (ao fechar a
unidade de trabalho — parar, não encadear para a próxima sem prompt explícito;
Regra 16 §2.5).

## Edição e evidência

- **Regra 12:** alterar só o necessário, comentar o ponto alterado
  (`<!-- ALTERADO YYYY-MM-DD: ... -->`), preservar o resto. Git diff é a evidência.
- **Regra 16 §8:** commit consolidado por escopo — "descrevo em 1 frase, sem
  'e'/'também'? → 1 commit"; propósitos independentes → N commits.
- **Regra 15:** cada execução significativa gera 1 relatório em
  `reports/report_task_DD-MM-YY_HH-mm.md`; nunca sobrescrever; criar o relatório
  não autoriza `git add`.
- **Regra 13:** `memory/CURRENT_CONTEXT.md` é bootstrap (500–1.500 palavras); ler
  primeiro, abrir só o que a tarefa exige, não reauditar o repo.

## Quando abrir a regra completa

| Abra | Quando |
|---|---|
| `rules/12` | criar/alterar/encerrar artefatos do repo; dúvida sobre escopo de edição |
| `rules/13` | editar a memory, compactar contexto, decidir o que entra na memory |
| `rules/14` | qualquer commit/push/PR; estado de Git ambíguo; divergência local×remoto |
| `rules/15` | escrever o relatório de execução; dúvida sobre formato/conteúdo |
| `rules/16` | conduzir tarefa de mentoria; dúvida sobre quando pausar; relatório pedagógico |

As skills executáveis (`.claude/skills/git-closure`, `execution-report`,
`pedagogical-checkpoint`) são o procedimento passo a passo dessas regras.
