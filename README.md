<!-- REESCRITO 2026-09-01: README consolidado como referência de engenheiro sênior — estrutura alinhada ao filesystem atual (rules/, instructions/, .claude/skills/, memory/); acréscimo histórico V1–V6 reduzido a uma tabela de rodapé; comentários de edição linha a linha removidos. -->
<!-- ALTERADO 2026-09-03: Regra 14 agora com Gate 3 (merge) e Gate 4 (sync & cleanup pós-merge); "Gate 3b" informal substituído por "Gate 4". -->
<!-- ALTERADO 2026-09-04: +skill cc-flow (orquestra git-closure/execution-report/pedagogical-checkpoint) no Fluxo de trabalho prático e no Mapa de diretórios. -->

# Software Engineer AI-First Mentor

Pacote base de um **Projeto no Claude** que conduz uma formação progressiva em
Engenharia de Software — de fundamentos operacionais (Git, terminal, leitura de
código) até arquitetura, automação e engenharia AI-first. O mentor não só
responde dúvidas: ensina, mostra, faz junto, deixa o mentorado fazer, revisa e
só então automatiza.

**Público-alvo:** um engenheiro em formação que aprende praticando em um
repositório real, com aprovação humana em cada passo que toca o Git.

**Método:** `EXPLICAR → MOSTRAR → FAZER JUNTO → DEIXAR O ALUNO FAZER → REVISAR →
AUTOMATIZAR → ENSINAR A DECIDIR`. ELI5 primeiro, evidência sempre, autonomia
crescente.

## Quick Start

Para uma sessão nova, leia nesta ordem (só estes três, ~5 min):

1. [`instructions/00-master-context.md`](instructions/00-master-context.md) — o que é o projeto.
2. [`rules/00-operating-model.md`](rules/00-operating-model.md) — digest normativo de todo o modelo operacional (~1 página).
3. [`memory/CURRENT_CONTEXT.md`](memory/CURRENT_CONTEXT.md) — estado atual: onde paramos, o que está pendente.

Depois valide o Git (`git status`, `git log --oneline -5`) e identifique a
próxima tarefa na seção `NEXT` da memory.

## Arquitetura

```text
PROJETO NO CLAUDE   mentoria, contexto, regras, decisões pedagógicas
        ↓
CLAUDE CODE         execução local no repositório (análise + edição cirúrgica)
        ↓
GIT / GITHUB        rastreabilidade, versionamento, evidência
        ↓
HUMANO              aprova os gates (commit / push / PR) e decisões relevantes
```

Cada camada de artefato tem um papel fixo:

```text
REGRA    política / limite / autoridade            (rules/)
SKILL    procedimento repetível que cumpre a regra  (.claude/skills/ e skills/)
AGENT    mentor/orquestrador por domínio            (agents/)
PROMPT   comando colável que inicia um fluxo        (prompts/)
MEMORY   estado atual (hot)                         (memory/)
CONTEXT  evidência e narrativa (cold)               (reports/, context/, backup_context/)
```

## Ordem de carregamento no Projeto no Claude

Pedagogia, na ordem: `instructions/00` → `01` → `02` → `03` → `04` → `05` → `06`
→ `07` → `08` → `09` → `10` → `11`. Índice comentado em
[`instructions/README.md`](instructions/README.md).

Governança, em seguida: `rules/00-operating-model.md` (sempre) e as regras
`12`–`16` conforme o domínio da tarefa. Índice em
[`rules/README.md`](rules/README.md).

Antes de qualquer trabalho: `memory/CURRENT_CONTEXT.md`.

## Regras ativas

Autoridades técnicas do projeto. Em conflito, a regra vence a skill e a memory.
Precedência interna: 16 > 15 > 14 > 13 > 12.

| Regra | Uma frase |
|-------|-----------|
| [`00`](rules/00-operating-model.md) | Digest de ~1 página de todo o modelo — porta de entrada de baixo custo de tokens. |
| [`12`](rules/12-claude-code-artifact-automation.md) | Edição cirúrgica de artefatos, com comentário `<!-- ALTERADO YYYY-MM-DD: … -->` no ponto alterado. |
| [`13`](rules/13-universal-memory-context-compaction.md) | `memory/` é hot context enxuto (~500–1.500 palavras); `backup_context/` é cold; compactação obrigatória com backup. |
| [`14`](rules/14-git-safe-publishing.md) | **Gate 1** = staging + commit; **Gate 2** = push; **PR** = autorização separada; **Gate 3** = merge (humano); **Gate 4** = sync & cleanup pós-merge. Operações destrutivas nunca automáticas. |
| [`15`](rules/15-universal-execution-reports.md) | Toda execução significativa gera 1 relatório imutável em `reports/report_task_DD-MM-YY_HH-mm.md`. |
| [`16`](rules/16-pedagogical-checkpoints.md) | 5 checkpoints pedagógicos obrigatórios; §8 consolida commits por escopo ("1 frase = 1 commit"). |

## Fluxo de trabalho prático

Os 7 passos abaixo são orquestrados, em ordem, pela skill
[`.claude/skills/cc-flow`](.claude/skills/cc-flow/SKILL.md) — que não duplica
nenhuma das 3 skills citadas, só sequencia e acrescenta o pré-voo de branch do
passo 1 (checar/criar a branch **antes** de editar).

1. **Branch** a partir de `main` atualizada.
2. **Editar** com edição cirúrgica (Regra 12) — mudar o mínimo, comentar o ponto alterado.
3. **Checkpoints pedagógicos** (Regra 16): pausar em Análise, Proposta, Validação, Sync & Cleanup e Fronteira. Skill: [`.claude/skills/pedagogical-checkpoint`](.claude/skills/pedagogical-checkpoint/SKILL.md).
4. **Encerrar com Git** pela skill [`.claude/skills/git-closure`](.claude/skills/git-closure/SKILL.md): proposta de commit → **Gate 1** (commit) → **Gate 2** (push) → **PR** → merge humano (**Gate 3**).
5. **Relatório** pela skill [`.claude/skills/execution-report`](.claude/skills/execution-report/SKILL.md) (Regra 15).
6. **Pós-merge — Gate 4** (`rules/14` §12): com autorização explícita, sincronizar `main` (Regra 13 reconcilia a memory) e apagar a branch local e a remota.
7. **Parar** ao fim da unidade de trabalho (Regra 16 §2.5) e pedir o próximo passo.

## Mapa de diretórios

```text
instructions/            pedagogia: currículo, protocolos, catálogos, progress ledger
rules/                   governança canônica: 00 (digest) + 12–16
.claude/skills/          skills operacionais executáveis: git-closure, execution-report, pedagogical-checkpoint, cc-flow (orquestra as 3)
skills/                  skills pedagógicas (ensinam o humano); skills/operational/ = ponteiros para as executáveis
agents/                  agents pedagógicos (mentores por domínio)
memory/                  hot context: CURRENT_CONTEXT.md
backup_context/          cold storage: snapshots de memory pré-compactação
reports/                 audit trail: 1 relatório por execução significativa
context/                 chat_history/ (narrativa), codes/ (código praticado), commands/ (comandos)
prompts/                 prompts operacionais reutilizáveis (coláveis)
knowledge/               hub de referência QA e material de apoio
legacy/                  artefatos arquivados — não são fonte de estado
scripts/                 utilitários (ex.: validate-utf8.ps1)
laboratorio-powershell/  sandbox de exercícios PowerShell
```

## Transição entre sessões

Não há arquivo especial de handoff. Uma sessão nova recupera o estado lendo, em
ordem, `memory/CURRENT_CONTEXT.md` + `rules/00-operating-model.md` e validando o
Git com comandos baratos. Os procedimentos executáveis vivem em
`.claude/skills/`. Contexto narrativo detalhado, só se a tarefa exigir, em
`reports/` (mais recente) e `context/chat_history/`.

## Roadmap pedagógico

Fonte de verdade: [`instructions/10-progress-ledger.md`](instructions/10-progress-ledger.md)
(módulos M001–M008, matriz de competências, missão atual) e
[`instructions/03-curriculum.md`](instructions/03-curriculum.md) (roadmap).
Este README não reproduz o progresso.

## Evolução do pacote

O pacote é vivo: cada assunto técnico novo em trabalho real deve virar
aprendizado registrado, skill criada/atualizada, fonte oficial adicionada,
exercício prático e nível registrado no Ledger.

## Histórico de versões

Resumo. O detalhe está no `git log` e em `legacy/`.

| Versão | Data | Mudança-chave |
|--------|------|---------------|
| V1 | 08/2026 | Pacote base: instruções, currículo, filosofia de mentoria. |
| V2 | 08/2026 | Skills pedagógicas individuais + snapshots do contexto QA. |
| V3 | 08/2026 | `skills/` sem subpastas — padrão `<nome>-skill.md`. |
| V4 | 08/2026 | Biblioteca de prompts operacionais em `prompts/`. |
| V5 | 08/2026 | `context/` separa `chat_history/`, `codes/`, `commands/`. |
| V6 | 27/08/2026 | Plataforma migra de GPT personalizado para Projeto no Claude. |
| — | 01/09/2026 | Regras 12–16, skills executáveis em `.claude/skills/`, memory compacta (`rules/00`, reorganização da raiz). |
