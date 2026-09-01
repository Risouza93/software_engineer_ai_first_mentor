# 📋 PLANO DE EXECUÇÃO: REFATORAÇÃO RAIZ → RULES + INSTRUCTIONS

## ESCOPO TOTAL

| Item | Arquivos | Ação |
|------|----------|------|
| **Regras** | 12, 13, 14, 15, 16 | Mover → `rules/` + renomear |
| **Instruções** | 00, 01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11 | Mover → `instructions/` + renomear |
| **Referências** | memory/, .claude/skills/, prompts/, README.md | Atualizar paths |
| **Índices** | rules/README.md, instructions/README.md | Criar novos |
| **Raiz README** | README.md | Refatorar |

**Total de mudanças:** ~35 arquivos tocados (maioria: apenas path update)

---

## PLANO EM 7 PASSOS

### PASSO 1: Criar Pastas Vazias
**Duração:** <1 min | **Tokens:** Mínimo | **Risco:** Nenhum

```powershell
mkdir rules
mkdir instructions
```

**Verificação:**
```powershell
ls -d rules instructions
```

✅ Nada quebra ainda (pastas vazias)

---

### PASSO 2: Mover Regras (com git mv)
**Duração:** 2-3 min | **Tokens:** Mínimo | **Risco:** Baixo (git preserva histórico)

```powershell
# Renomear enquanto move (git mv preserva history)
git mv 12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md `
       rules/12-claude-code-artifact-automation.md
git mv 13_UNIVERSAL_MEMORY_CONTEXT_COMPACTION_RULES.md `
       rules/13-universal-memory-context-compaction.md
git mv 14_GIT_SAFE_PUBLISHING_RULES.md `
       rules/14-git-safe-publishing.md
git mv 15_UNIVERSAL_EXECUTION_REPORTS_RULES.md `
       rules/15-universal-execution-reports.md
git mv 16_PEDAGOGICAL_CHECKPOINTS_RULES.md `
       rules/16-pedagogical-checkpoints.md
```

**Verificação:**
```powershell
ls -la rules/
git status
```

✅ 5 arquivos movidos, histórico preservado
⚠️ Referências ainda quebradas (corrigir no passo 3)

---

### PASSO 3: Mover Instruções (com git mv)
**Duração:** 3-4 min | **Tokens:** Mínimo | **Risco:** Baixo

```powershell
git mv 00_MASTER_CONTEXT.md instructions/00-master-context.md
git mv 01_SYSTEM_INSTRUCTIONS.md instructions/01-system-instructions.md
git mv 02_LEARNING_PROTOCOL.md instructions/02-learning-protocol.md
git mv 03_CURRICULUM.md instructions/03-curriculum.md
git mv 04_POWERSHELL_GIT_GITHUB.md instructions/04-powershell-git-github.md
git mv 05_AI_FIRST_ENGINEERING.md instructions/05-ai-first-engineering.md
git mv 06_SKILLS_CATALOG.md instructions/06-skills-catalog.md
git mv 07_AGENTS_CATALOG.md instructions/07-agents-catalog.md
git mv 08_PROMPT_LIBRARY.md instructions/08-prompt-library.md
git mv 09_SOURCE_POLICY.md instructions/09-source-policy.md
git mv 10_PROGRESS_LEDGER.md instructions/10-progress-ledger.md
git mv 11_PROGRESS_LEDGER_RULES.md instructions/11-progress-ledger-rules.md
```

**Verificação:**
```powershell
ls -la instructions/
git status --short
```

✅ 12 arquivos movidos
⚠️ Referências ainda quebradas (próximo passo)

---

### PASSO 4: Atualizar Referências em memory/CURRENT_CONTEXT.md
**Duração:** 5-7 min | **Tokens:** Médio | **Risco:** Médio (edição de arquivo crítico)

**Referências a encontrar/atualizar:**

```markdown
ANTES:
- `14_GIT_SAFE_PUBLISHING_RULES.md` — ...
- `15_UNIVERSAL_EXECUTION_REPORTS_RULES.md` — ...
- `16_PEDAGOGICAL_CHECKPOINTS_RULES.md` — ...
- `12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md` — ...
- `13_UNIVERSAL_MEMORY_CONTEXT_COMPACTION_RULES.md` — ...

DEPOIS:
- `rules/14-git-safe-publishing.md` — ...
- `rules/15-universal-execution-reports.md` — ...
- `rules/16-pedagogical-checkpoints.md` — ...
- `rules/12-claude-code-artifact-automation.md` — ...
- `rules/13-universal-memory-context-compaction.md` — ...
```

**Arquivos a atualizar em memory/:**
- `memory/CURRENT_CONTEXT.md` — ~8 referências

**Comando (Python):**
```python
# Simples find-replace em memory/CURRENT_CONTEXT.md
replacements = [
    ('14_GIT_SAFE_PUBLISHING_RULES.md', 'rules/14-git-safe-publishing.md'),
    ('15_UNIVERSAL_EXECUTION_REPORTS_RULES.md', 'rules/15-universal-execution-reports.md'),
    ('16_PEDAGOGICAL_CHECKPOINTS_RULES.md', 'rules/16-pedagogical-checkpoints.md'),
    ('12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md', 'rules/12-claude-code-artifact-automation.md'),
    ('13_UNIVERSAL_MEMORY_CONTEXT_COMPACTION_RULES.md', 'rules/13-universal-memory-context-compaction.md'),
    ('11_PROGRESS_LEDGER_RULES.md', 'instructions/11-progress-ledger-rules.md'),
    ('10_PROGRESS_LEDGER.md', 'instructions/10-progress-ledger.md'),
    ('09_SOURCE_POLICY.md', 'instructions/09-source-policy.md'),
    ('08_PROMPT_LIBRARY.md', 'instructions/08-prompt-library.md'),
    ('07_AGENTS_CATALOG.md', 'instructions/07-agents-catalog.md'),
    ('06_SKILLS_CATALOG.md', 'instructions/06-skills-catalog.md'),
    ('05_AI_FIRST_ENGINEERING.md', 'instructions/05-ai-first-engineering.md'),
    ('04_POWERSHELL_GIT_GITHUB.md', 'instructions/04-powershell-git-github.md'),
    ('03_CURRICULUM.md', 'instructions/03-curriculum.md'),
    ('02_LEARNING_PROTOCOL.md', 'instructions/02-learning-protocol.md'),
    ('01_SYSTEM_INSTRUCTIONS.md', 'instructions/01-system-instructions.md'),
    ('00_MASTER_CONTEXT.md', 'instructions/00-master-context.md'),
]
```

✅ Referências em memory/ corrigidas
⚠️ Próximas: .claude/skills/, prompts/, README.md

---

### PASSO 5: Atualizar Referências em .claude/skills/
**Duração:** 5-7 min | **Tokens:** Médio | **Risco:** Médio

**Arquivos a atualizar:**
- `.claude/skills/git-closure/SKILL.md` — ~10 referências
- `.claude/skills/execution-report/SKILL.md` — ~5 referências
- `.claude/skills/pedagogical-checkpoint/SKILL.md` — ~5 referências

**Exemplo:**
```markdown
ANTES:
Autoridade: `14_GIT_SAFE_PUBLISHING_RULES.md`
Relacionadas: `12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md`

DEPOIS:
Autoridade: `rules/14-git-safe-publishing.md`
Relacionadas: `rules/12-claude-code-artifact-automation.md`
```

✅ Referências em skills/ corrigidas
⚠️ Próxima: README.md

---

### PASSO 6: Atualizar README.md (Raiz)
**Duração:** 10-15 min | **Tokens:** Alto | **Risco:** Médio (documento público)

**Ações:**

1. **Criar seção "Como Navegar"** (nova):
```markdown
## Como Navegar

Novo no projeto? Comece aqui:

1. **Pedagogia & Aprendizado**
   → [`instructions/`](instructions/README.md) — Currículo, protocolos, políticas

2. **Regras Canônicas (Autoridades)**
   → [`rules/`](rules/README.md) — Regras de automação, Git, Reports, Pedagogia

3. **Execução**
   → [`.claude/skills/`](.claude/skills/) — Skills operacionais (git-closure, execution-report, pedagogical-checkpoint)
```

2. **Atualizar referências** (todas as seções):
- Na seção de "Getting Started", apontar para `instructions/00-master-context.md`
- Na seção de "Rules", apontar para `rules/`
- Na seção de "Skills", apontar para `.claude/skills/`

3. **Atualizar TOC** (Table of Contents):
```markdown
ANTES:
- [00_MASTER_CONTEXT.md](00_MASTER_CONTEXT.md)
- [01_SYSTEM_INSTRUCTIONS.md](01_SYSTEM_INSTRUCTIONS.md)
...
- [12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md](12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md)
...

DEPOIS:
### Instructions
- [Master Context](instructions/00-master-context.md)
- [System Instructions](instructions/01-system-instructions.md)
...

### Rules
- [Claude Code Artifact Automation](rules/12-claude-code-artifact-automation.md)
...
```

✅ README.md refatorado

---

### PASSO 7: Criar Índices (rules/README.md + instructions/README.md)
**Duração:** 10-12 min | **Tokens:** Médio-Alto | **Risco:** Baixo (novos arquivos)

**rules/README.md** (novo):
```markdown
# Regras Canônicas

Autoridades técnicas do projeto. Em caso de conflito entre regras, estas 
ganham de skills/procedures e memory/context.

## Índice

| Regra | Descrição | Quando Usar |
|-------|-----------|------------|
| [12 - Artifact Automation](12-claude-code-artifact-automation.md) | Edição cirúrgica de artefatos | Alterar código/docs |
| [13 - Memory & Context Compaction](13-universal-memory-context-compaction.md) | Gestão de contexto eficiente | Manter memory atualizada |
| [14 - Git Safe Publishing](14-git-safe-publishing.md) | Gates humanos para Git | Commit, push, PR |
| [15 - Execution Reports](15-universal-execution-reports.md) | Relatórios de execução | Toda execução significativa |
| [16 - Pedagogical Checkpoints](16-pedagogical-checkpoints.md) | Pausas pedagógicas | Questionar mentorado |

**Leitura recomendada:** Na ordem 12 → 13 → 14 → 15 → 16.
```

**instructions/README.md** (novo):
```markdown
# Instruções e Protocolos

Pedagogia, currículo, políticas e padrões do projeto.

## Índice Rápido

| Arquivo | Propósito |
|---------|-----------|
| [00 - Master Context](00-master-context.md) | Contexto master para continuidade |
| [01 - System Instructions](01-system-instructions.md) | Instruções de sistema para Claude |
| [02 - Learning Protocol](02-learning-protocol.md) | Protocolo de aprendizado |
| [03 - Curriculum](03-curriculum.md) | Módulos e roadmap pedagógico |
| [04 - PowerShell & Git/GitHub](04-powershell-git-github.md) | Ambiente + ferramentas |
| [05 - AI First Engineering](05-ai-first-engineering.md) | Princípios de engenharia AI-first |
| [06 - Skills Catalog](06-skills-catalog.md) | Catálogo de skills pedagógicas |
| [07 - Agents Catalog](07-agents-catalog.md) | Catálogo de agents |
| [08 - Prompt Library](08-prompt-library.md) | Biblioteca de prompts |
| [09 - Source Policy](09-source-policy.md) | Política de fontes e citações |
| [10 - Progress Ledger](10-progress-ledger.md) | Registro de progresso (M001–M008) |
| [11 - Progress Ledger Rules](11-progress-ledger-rules.md) | Como manter o ledger |

**Para novos mentorados:** Comece em 00 → 02 → 03 → 04.
```

✅ Índices criados

---

## RESUMO DE MUDANÇAS

| Fase | Ação | Arquivos | Tempo | Risco |
|------|------|----------|-------|-------|
| 1 | Criar pastas | 2 novas | 1 min | 🟢 Nenhum |
| 2 | Mover regras | 5 files moved | 3 min | 🟢 Baixo |
| 3 | Mover instruções | 12 files moved | 4 min | 🟢 Baixo |
| 4 | Atualizar memory/ | 1 arquivo | 7 min | 🟡 Médio |
| 5 | Atualizar skills/ | 3 arquivos | 7 min | 🟡 Médio |
| 6 | Atualizar README | 1 arquivo | 15 min | 🟡 Médio |
| 7 | Criar índices | 2 novos | 12 min | 🟢 Baixo |
| **TOTAL** | **Refatoração completa** | **26 arquivos transformados** | **~50 min** | **Controlado** |

---

## CHECKPOINT PEDAGÓGICO

**Antes de executar, validar:**

- [ ] Você entende a nova estrutura?
- [ ] Concorda com o nome das pastas (`rules/` + `instructions/`)?
- [ ] Quer mudar algo no plano antes de começar?
- [ ] Quer dividir em commits menores (ex: commit 1 = mover arquivos, commit 2 = atualizar referências)?

---

## ECONOMIA DE TOKENS

- **Fase 1-3 (Movimentação Git):** ~100 tokens (apenas git commands)
- **Fase 4-5 (Atualizações):** ~1.000 tokens (find-replace automático)
- **Fase 6-7 (READMEs + índices):** ~2.000 tokens (conteúdo novo)
- **Total estimado:** ~3.100 tokens (muito eficiente!)

---

## ROLLBACK (se necessário)

Se algo der errado, simples:
```powershell
git reset --hard HEAD~1
```

(Retorna ao estado anterior)

