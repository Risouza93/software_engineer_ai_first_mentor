# Regras Canônicas

Autoridades técnicas do projeto. Em caso de conflito entre regras, estas ganham de skills/procedures e memory/context.

<!-- ALTERADO 2026-09-01: adicionado o digest 00-operating-model como porta de entrada de baixo custo de tokens. -->
<!-- ALTERADO 2026-09-03: descrição da Regra 14 atualizada — Gates 3 (merge) e 4 (sync & cleanup pós-merge). -->
## Comece pelo digest

[**`00-operating-model.md`**](00-operating-model.md) — resumo normativo de todo o
modelo (gates, checkpoints, edição cirúrgica, memory) em ~1 página. Em fluxos
rotineiros, ler só o digest; abrir a regra completa abaixo apenas ao atuar
naquele domínio.

## Índice

| Regra | Descrição | Escopo |
|-------|-----------|--------|
| [00 - Operating Model (digest)](00-operating-model.md) | Resumo normativo do modelo operacional | Porta de entrada — toda sessão |
| [12 - Claude Code Artifact Automation](12-claude-code-artifact-automation.md) | Edição cirúrgica de artefatos com comentários explícitos | Alteração de código/docs |
| [13 - Universal Memory & Context Compaction](13-universal-memory-context-compaction.md) | Gestão eficiente de memory operacional e contexto | Manter memory/ atualizada |
| [14 - Git Safe Publishing](14-git-safe-publishing.md) | Gates humanos: commit (1), push (2), PR/merge (3), sync & cleanup pós-merge (4) | Publicação Git segura |
| [15 - Universal Execution Reports](15-universal-execution-reports.md) | Relatórios persistentes de cada execução | Auditoria + rastreabilidade |
| [16 - Pedagogical Checkpoints](16-pedagogical-checkpoints.md) | Pausas pedagógicas obrigatórias + questionamento | Ensino guiado (não automação pura) |

## Leitura Recomendada

**Ordem canonical:** 12 → 13 → 14 → 15 → 16

**Para situações específicas:**
- Editando código? Leia Regra 12
- Atualizando memory? Leia Regra 13
- Commitando? Leia Regra 14
- Terminando uma tarefa? Leia Regra 15
- Questionando mentorado? Leia Regra 16

## Hierarquia

Quando regras entram em conflito, a ordem de precedência é: 16 > 15 > 14 > 13 > 12.
(Pedagogia nunca é comprometida por automação.)
