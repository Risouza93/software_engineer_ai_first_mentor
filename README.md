# Software Engineer AI-First Mentor — Pacote Base

## Missão

Este pacote define a fundação de um GPT personalizado que atua simultaneamente como:

- Software Engineer Sênior;
- Professor ELI5 de Engenharia de Software;
- Mentor técnico de longo prazo;
- Arquiteto de soluções;
- Mentor de Git/GitHub, código, APIs, banco, containers, CI/CD e observabilidade;
- Especialista em automação;
- Mentor AI First;
- Ponte permanente com o projeto **QA Engineering**.

O objetivo não é apenas responder dúvidas. O GPT deve formar capacidade técnica progressiva, do nível iniciante até arquitetura e engenharia avançada.

## Filosofia

```text
EXPLICAR
  ↓
MOSTRAR
  ↓
FAZER JUNTO
  ↓
DEIXAR O ALUNO FAZER
  ↓
REVISAR
  ↓
AUTOMATIZAR
  ↓
ENSINAR A DECIDIR
```

## Arquitetura

```text
GPT PRINCIPAL — Software Engineer AI-First Mentor
│
├── System Instructions
├── Master Context
├── Learning Protocol
├── Curriculum
├── AI First Engineering
├── Source Policy
├── Prompt Library
├── Progress Ledger
│
├── Skills
│   ├── Git & GitHub
│   ├── Code Reading
│   ├── Debugging
│   ├── Architecture
│   ├── CI/CD
│   └── AI Engineering
│
└── Agents
    ├── Software Engineer Mentor
    ├── Git/GitHub Mentor
    ├── AI First Architect
    └── QA Bridge
```

## Ordem recomendada de upload no GPT

1. `00_MASTER_CONTEXT.md`
2. `01_SYSTEM_INSTRUCTIONS.md`
3. `02_LEARNING_PROTOCOL.md`
4. `03_CURRICULUM.md`
5. `04_POWERSHELL_GIT_GITHUB.md`
6. `05_AI_FIRST_ENGINEERING.md`
7. `06_SKILLS_CATALOG.md`
8. `07_AGENTS_CATALOG.md`
9. `08_PROMPT_LIBRARY.md`
10. `09_SOURCE_POLICY.md`
11. `10_PROGRESS_LEDGER.md`

Depois, adicionar os documentos existentes do projeto QA Engineering.

## Regra de evolução

Este pacote é vivo. Sempre que um novo assunto técnico surgir em trabalho real, deve-se:

1. registrar o aprendizado;
2. criar ou atualizar uma skill;
3. adicionar fontes oficiais;
4. criar exercício prático;
5. registrar nível atual;
6. automatizar quando fizer sentido.


## V2 — Arquivos explícitos de Skills e contexto QA

A V2 adiciona Skills individuais e snapshots do contexto atual do QA Engineering.

### Skills
- `skills/git-foundations-skill.md`
- `skills/github-pr-analysis-skill.md`
- `skills/code-reading-eli5-skill.md`
- `skills/debugging-systematic-skill.md`
- `skills/powershell-for-engineers-skill.md`
- `skills/api-engineering-skill.md`
- `skills/database-engineering-skill.md`
- `skills/containers-podman-skill.md`
- `skills/playwright-automation-skill.md`
- `skills/cicd-quality-gates-skill.md`
- `skills/software-architecture-skill.md`
- `skills/ai-first-engineering-skill.md`
- `skills/qa-engineering-bridge-skill.md`

### Contexto QA incluído
- `knowledge/QA_ENGINEERING_CONTEXT_v4.md`
- `knowledge/QA_PROCESS_SPECIALIST_CURRENT.md`
- `knowledge/QA_AUTOMATION_HUB_CURRENT.md`
- `knowledge/QA_SKILL_CLAUDE_EXAMPLE.md`
- `knowledge/QA_WORK_NOTES.md`

## V3 — Estrutura simplificada de Skills

A pasta `skills/` não utiliza mais subpastas por skill.

Padrão oficial:

```text
skills/
├── ai-first-engineering-skill.md
├── api-engineering-skill.md
├── cicd-quality-gates-skill.md
├── code-reading-eli5-skill.md
├── containers-podman-skill.md
├── database-engineering-skill.md
├── debugging-systematic-skill.md
├── git-foundations-skill.md
├── github-pr-analysis-skill.md
├── playwright-automation-skill.md
├── powershell-for-engineers-skill.md
├── qa-engineering-bridge-skill.md
└── software-architecture-skill.md
```

Regra: toda nova skill deve ser criada diretamente em `skills/` usando o padrão `<nome>-skill.md`.

## V4 — Biblioteca de Prompts

A pasta `prompts/` contém prompts operacionais reutilizáveis.

Regra oficial de nomenclatura:

```text
<NOME_DO_PROMPT>.md
```

Estrutura:

```text
prompts/
├── PROMPT_MESTRE_CONTINUIDADE.md
├── CONTINUAR.md
├── AULA.md
├── LAB.md
├── DUVIDA.md
├── DEBUG.md
├── LAB_REAL.md
├── CODE_READING.md
├── PR_LAB.md
├── DESAFIO.md
├── AVALIAR_NIVEL.md
├── ENCERRAR_MISSAO.md
├── ATUALIZAR_CONTEXTO.md
├── COMPACTAR_CONTEXTO.md
├── REVISAO_SEMANAL.md
└── AI_FIRST.md
```

Os prompts devem ser pequenos e específicos, exceto o `PROMPT_MESTRE_CONTINUIDADE.md`, responsável por iniciar ou restaurar a formação completa.


## Versão Final — AI Coding Tools Foundations

A formação passa a incluir oficialmente Codex e Claude Code logo após GitHub.

Novos arquivos:

### Skills
- `skills/codex-foundations-skill.md`
- `skills/claude-code-foundations-skill.md`

### Agent
- `agents/ai-coding-tools-mentor.agent.md`

### Prompts
- `prompts/AI_CODING_TOOLS_FOUNDATIONS.md`
- `prompts/CODEX_PRIMEIRO_LAB.md`
- `prompts/CLAUDE_CODE_PRIMEIRO_LAB.md`
- `prompts/COMPARAR_CODEX_CLAUDE_CODE.md`

Regra oficial de autonomia:

```text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```

O GPT personalizado é o mentor principal.
Codex e Claude Code são ferramentas de execução assistida.

---
