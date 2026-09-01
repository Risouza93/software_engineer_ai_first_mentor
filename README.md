# Software Engineer AI-First Mentor --- Pacote Base

## 🧭 Como Navegar

Novo no projeto? Comece aqui:

### 1. **Pedagogia & Aprendizado** → [`instructions/`](instructions/README.md)
   Currículo, protocolos, políticas de ensino. Comece em [Master Context](instructions/00-master-context.md).

### 2. **Regras Canônicas (Autoridades)** → [`rules/`](rules/README.md)
   Regras de automação, Git, Reports, Pedagogia. Leia na ordem 12 → 13 → 14 → 15 → 16.

### 3. **Execução** → [`.claude/skills/`](.claude/skills/)
   Skills operacionais: `git-closure`, `execution-report`, `pedagogical-checkpoint`.

### 4. **Contexto & Estado** → [`memory/`](memory/)
   Estado atual do projeto (hot context). Leia [`CURRENT_CONTEXT.md`](memory/CURRENT_CONTEXT.md).

---

## Missão

<!-- ALTERADO 2026-08-27: plataforma principal migrada de GPT personalizado para Projeto no Claude (decisão de 27/08/2026); ver seção "V6". -->
Este pacote define a fundação de um **Projeto no Claude** (originalmente
concebido como GPT personalizado) que atua simultaneamente como:

-   Software Engineer Sênior;
-   Professor ELI5 de Engenharia de Software;
-   Mentor técnico de longo prazo;
-   Arquiteto de soluções;
-   Mentor de Git/GitHub, código, APIs, banco, containers, CI/CD e
    observabilidade;
-   Especialista em automação;
-   Mentor AI First;
-   Ponte permanente com o projeto **QA Engineering**.

<!-- ALTERADO 2026-08-27: "O GPT" -> "O mentor" (plataforma migrada para Projeto no Claude). -->
O objetivo não é apenas responder dúvidas. O mentor deve formar capacidade
técnica progressiva, do nível iniciante até arquitetura e engenharia
avançada.

## Filosofia

``` text
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

<!-- ALTERADO 2026-08-27: "GPT PRINCIPAL" -> "PROJETO NO CLAUDE" (migração de plataforma). -->
``` text
PROJETO NO CLAUDE — Software Engineer AI-First Mentor
│
├── System Instructions
├── Master Context
├── Learning Protocol
├── Curriculum
├── AI First Engineering
├── Source Policy
├── Prompt Library
├── Progress Ledger
├── Context
│   ├── chat_history
│   ├── codes
│   └── commands
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

<!-- ALTERADO 2026-08-27: título (upload no GPT -> carregamento no Projeto no Claude) e inclusão de 11_ e 12_ na ordem. -->
<!-- ALTERADO 2026-09-01: caminhos atualizados para instructions/ e rules/ (pós-reorganização da raiz); ver instructions/README.md e rules/README.md. -->
## Ordem recomendada de carregamento no Projeto no Claude

1.  `instructions/00-master-context.md`
2.  `instructions/01-system-instructions.md`
3.  `instructions/02-learning-protocol.md`
4.  `instructions/03-curriculum.md`
5.  `instructions/04-powershell-git-github.md`
6.  `instructions/05-ai-first-engineering.md`
7.  `instructions/06-skills-catalog.md`
8.  `instructions/07-agents-catalog.md`
9.  `instructions/08-prompt-library.md`
10. `instructions/09-source-policy.md`
11. `instructions/10-progress-ledger.md`
12. `instructions/11-progress-ledger-rules.md`
13. `rules/12-claude-code-artifact-automation.md` (e, na sequência, as regras 13–16 em `rules/`)

Depois, adicionar os documentos existentes do projeto QA Engineering.

## Regra de evolução

Este pacote é vivo. Sempre que um novo assunto técnico surgir em
trabalho real, deve-se:

1.  registrar o aprendizado;
2.  criar ou atualizar uma skill;
3.  adicionar fontes oficiais;
4.  criar exercício prático;
5.  registrar nível atual;
6.  automatizar quando fizer sentido.

## V2 --- Arquivos explícitos de Skills e contexto QA

A V2 adiciona Skills individuais e snapshots do contexto atual do QA
Engineering.

### Skills

-   `skills/git-foundations-skill.md`
-   `skills/github-pr-analysis-skill.md`
-   `skills/code-reading-eli5-skill.md`
-   `skills/debugging-systematic-skill.md`
-   `skills/powershell-for-engineers-skill.md`
-   `skills/api-engineering-skill.md`
-   `skills/database-engineering-skill.md`
-   `skills/containers-podman-skill.md`
-   `skills/playwright-automation-skill.md`
-   `skills/cicd-quality-gates-skill.md`
-   `skills/software-architecture-skill.md`
-   `skills/ai-first-engineering-skill.md`
-   `skills/qa-engineering-bridge-skill.md`

### Contexto QA incluído

-   `knowledge/QA_ENGINEERING_CONTEXT_v4.md`
-   `knowledge/QA_PROCESS_SPECIALIST_CURRENT.md`
-   `knowledge/QA_AUTOMATION_HUB_CURRENT.md`
-   `knowledge/QA_SKILL_CLAUDE_EXAMPLE.md`
-   `knowledge/QA_WORK_NOTES.md`

## V3 --- Estrutura simplificada de Skills

A pasta `skills/` não utiliza mais subpastas por skill.

Padrão oficial:

``` text
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

Regra: toda nova skill deve ser criada diretamente em `skills/` usando o
padrão `<nome>-skill.md`.

## V4 --- Biblioteca de Prompts

A pasta `prompts/` contém prompts operacionais reutilizáveis.

Regra oficial de nomenclatura:

``` text
<NOME_DO_PROMPT>.md
```

Estrutura:

``` text
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

Os prompts devem ser pequenos e específicos, exceto o
`PROMPT_MESTRE_CONTINUIDADE.md`, responsável por iniciar ou restaurar a
formação completa.

## Versão Final --- AI Coding Tools Foundations

A formação passa a incluir oficialmente Codex e Claude Code logo após
GitHub.

Novos arquivos:

### Skills

-   `skills/codex-foundations-skill.md`
-   `skills/claude-code-foundations-skill.md`

### Agent

-   `agents/ai-coding-tools-mentor.agent.md`

### Prompts

-   `prompts/AI_CODING_TOOLS_FOUNDATIONS.md`
-   `prompts/CODEX_PRIMEIRO_LAB.md`
-   `prompts/CLAUDE_CODE_PRIMEIRO_LAB.md`
-   `prompts/COMPARAR_CODEX_CLAUDE_CODE.md`

Regra oficial de autonomia:

``` text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```

<!-- ALTERADO 2026-08-27: "O GPT personalizado" -> "O Projeto no Claude" (migração de plataforma). -->
O Projeto no Claude é o mentor principal. Codex e Claude Code são
ferramentas de execução assistida.

## V5 --- Organização de Contexto, Códigos e Comandos

A estrutura de artefatos operacionais passa a separar claramente
contexto de sessão, códigos praticados e comandos executados.

### Estrutura oficial

``` text
context/
├── chat_history/
│   └── <contextos de continuidade e encerramento de missão>
├── codes/
│   └── <arquivos com códigos lidos, analisados ou praticados>
└── commands/
    └── <arquivos com comandos executados, validações e observações operacionais>
```

### `context/chat_history/`

Usar para:

-   snapshots de continuidade;
-   contexto detalhado de missões;
-   encerramento de missão;
-   decisões pedagógicas;
-   debugging e evidências narrativas necessárias para retomada.

Exemplo:

``` text
context/chat_history/
└── CONTEXTO_SESSAO_MISSAO_007_LEITURA_CODIGO_CONCLUIDA_2026-08-18.md
```

### `context/codes/`

Usar para arquivos que preservam os códigos efetivamente lidos,
analisados ou praticados durante a formação.

Exemplo:

``` text
context/codes/
└── codigos_lidos.md
└── codigos_escritos.md
```

Objetivo:

``` text
código praticado
→ trace
→ comportamento
→ decisões
→ dependências
→ riscos
→ testes derivados
```

Essa pasta funciona como referência prática e não substitui o contexto
narrativo da missão.

### `context/commands/`

Usar para comandos efetivamente executados durante laboratórios e
missões.

O arquivo deve preservar, quando relevante:

``` text
comando
→ objetivo
→ resultado esperado
→ validação
→ risco
→ rollback / recuperação
```

Comandos não devem ser armazenados em `context/codes/`; devem permanecer
em `context/commands/`.

### Regra de separação

``` text
context/chat_history/
→ COMO a missão evoluiu e COMO retomar

context/codes/
→ QUAIS códigos foram lidos/praticados e o que foi observado neles

context/commands/
→ QUAIS comandos foram executados e como validar/recuperar

instructions/10-progress-ledger.md
→ O QUE foi comprovado, O QUE falta e ONDE estão os detalhes
```

### Regra de dependência

Adicionar `context/codes/` não altera a responsabilidade existente de
`context/chat_history/` nem de `commands/`.

Ao criar ou atualizar artefatos:

1.  não duplicar conteúdo detalhado no Progress Ledger;
2.  manter o Ledger como índice operacional;
3.  usar caminhos estáveis relativos à raiz do projeto;
4.  quando uma missão possuir código relevante, salvar o artefato
    correspondente em `context/codes/`;
5.  quando houver comandos executados, salvar o artefato correspondente
    em `commands/`;
6.  quando houver contexto de continuidade ou encerramento, salvar em
    `context/chat_history/`.

### Exemplo aplicado à M007

``` text
context/chat_history/
└── CONTEXTO_SESSAO_MISSAO_007_LEITURA_CODIGO_CONCLUIDA_2026-08-18.md

context/codes/
└── codigos_lidos.md

instructions/10-progress-ledger.md
└── mantém somente síntese + ponteiro para os artefatos canônicos
```

A partir desta versão, novos artefatos de código devem seguir
`context/codes/`, e novos artefatos de comandos devem seguir
`commands/`.

<!-- ALTERADO 2026-08-27: nova seção registrando a migração de plataforma decidida em 27/08/2026. -->
## V6 --- Migração para Projeto no Claude

A partir de 27/08/2026, a plataforma principal de orquestração deixa de ser
um GPT personalizado / Custom GPT e passa a ser um **Projeto no Claude**.

Arquitetura operacional:

``` text
PROJETO NO CLAUDE
Mentoria + contexto + regras + orquestração
        ↓
CLAUDE CODE
Execução local no repositório
        ↓
GIT
Rastreabilidade + evidência
        ↓
HUMANO
Revisão + aprovação de commit/push/merge
```

Consequências:

-   referências operacionais a "GPT personalizado", "Custom GPT" e "upload no
    GPT" passam a significar "Projeto no Claude" / "carregamento no Projeto no
    Claude";
-   referências claramente históricas são preservadas como legado;
-   a política de fontes (`instructions/09-source-policy.md`) escolhe a documentação oficial
    da tecnologia efetivamente usada (Anthropic para Claude/Claude Code; OpenAI
    para produtos OpenAI/Codex; GitHub Docs; Microsoft Learn);
-   `prompts/PROMPT_MESTRE_CONTINUIDADE.md` deixa de fixar uma missão inicial e
    passa a descobrir o estado atual pelas fontes canônicas;
-   a memória operacional canônica é `instructions/10-progress-ledger.md` + `context/`; não
    há arquivo único `SOFTWARE_ENGINEERING_LEARNING_CONTEXT_V0X.md`.

### Papel de cada camada

``` text
SKILL    → conhecimento/método especializado reutilizável (skills/*-skill.md)
AGENT    → papel/orquestrador especializado que aplica métodos (agents/*.agent.md)
PROMPT   → comando reutilizável que inicia um fluxo/tarefa (prompts/*.md)
CONTEXT  → evidência e memória operacional (context/**)
LEDGER   → índice sintético de progresso (instructions/10-progress-ledger.md)
```

### Automação de manutenção de artefatos

Pedidos de criação/atualização de artefatos (contexto, comandos, códigos,
Ledger, README) seguem `rules/12-claude-code-artifact-automation.md`: o
Projeto no Claude define escopo e evidências; o Claude Code executa a edição
local mínima; o Git é a evidência; o humano aprova commit/push/merge.
