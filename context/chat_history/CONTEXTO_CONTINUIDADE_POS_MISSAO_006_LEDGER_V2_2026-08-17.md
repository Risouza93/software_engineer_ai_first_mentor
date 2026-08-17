# CONTEXTO DE CONTINUIDADE --- APÓS MISSÃO 006 / MIGRAÇÃO DO PROGRESS LEDGER V2

Data: 17/08/2026\
Formação: Software Engineer AI-First Mentor\
Missões 001--003: CONCLUÍDAS\
MISSÃO 004 --- AI Coding Tools Foundations: PARCIAL --- Codex concluído;
Claude Code bloqueado/adiado\
MISSÃO 005 --- Branching: CONCLUÍDA\
MISSÃO 006 --- PR / Diff: CONCLUÍDA\
Próxima missão: MISSÃO 007 --- Leitura de código

------------------------------------------------------------------------

# PONTO EXATO DE RETOMADA

A MISSÃO 006 foi encerrada.

Antes de iniciar a MISSÃO 007, foi realizada uma refatoração documental
do Progress Ledger para reduzir crescimento e custo de tokens.

Estado documental novo:

``` text
10_PROGRESS_LEDGER.md
→ Ledger V2 compacto e canônico

11_PROGRESS_LEDGER_RULES.md
→ regras obrigatórias de estrutura/manutenção do Ledger

legacy/archive/
→ contém o Progress Ledger legado/extenso preservado como histórico
```

O GPT deve utilizar `10_PROGRESS_LEDGER.md` como fonte operacional de
progresso atual e `11_PROGRESS_LEDGER_RULES.md` como contrato
obrigatório para toda atualização futura do Ledger.

O Ledger legado em `legacy/archive/` é histórico. Não deve ser
carregado/reescrito rotineiramente. Consultá-lo somente quando houver
necessidade explícita de recuperar detalhe histórico não preservado nos
artefatos canônicos atuais.

------------------------------------------------------------------------

# HIERARQUIA DE REGRAS PARA CONTINUIDADE

As regras existentes da formação continuam válidas.

Para Progress Ledger, aplicar adicionalmente e obrigatoriamente:

``` text
11_PROGRESS_LEDGER_RULES.md
↓
define COMO o Ledger deve ser estruturado e atualizado

10_PROGRESS_LEDGER.md
↓
representa O ESTADO pedagógico atual
```

As novas regras NÃO substituem: - `00_MASTER_CONTEXT.md`; -
`01_SYSTEM_INSTRUCTIONS.md`; - `02_LEARNING_PROTOCOL.md`; -
`03_CURRICULUM.md`; - regras de Git/GitHub, AI First, Skills, Agents e
Source Policy; - regras pedagógicas e de debugging já existentes.

Elas especializam exclusivamente a manutenção do Progress Ledger.

Em caso de atualização do progresso:

``` text
regras gerais da formação
+
evidências observadas na missão
+
11_PROGRESS_LEDGER_RULES.md
↓
atualização mínima necessária em 10_PROGRESS_LEDGER.md
```

Nunca promover nível apenas para preencher o Ledger.

------------------------------------------------------------------------

# REGRA CANÔNICA DO PROGRESS LEDGER V2

O `10_PROGRESS_LEDGER.md` agora é um ÍNDICE OPERACIONAL DE EVOLUÇÃO.

Ele deve responder:

``` text
Onde o aluno está?
Qual nível foi comprovado?
Quais missões estão concluídas/em andamento/bloqueadas?
Quais competências foram comprovadas?
Quais lacunas permanecem?
Qual é o próximo passo?
Onde estão os detalhes?
```

Não usar o Ledger como: - histórico completo de sessão; - cartilha de
comandos; - dump de terminal; - registro passo a passo de debugging; -
duplicação dos contextos da missão.

Estrutura obrigatória:

``` text
# PROGRESS LEDGER

## 1. Estado atual
## 2. Matriz de competências
## 3. Missões
## 4. Bloqueios e pendências
## 5. Próximo passo
## 6. Regras de manutenção
```

Budget por missão:

``` text
preferencial: 12–20 linhas úteis
máximo: 25 linhas
```

Uma missão deve registrar somente:

``` text
STATUS
DATA
EVOLUÇÃO
COMPROVADO
DEBUGGING-CHAVE (se relevante)
LACUNAS
DETALHES / PONTEIRO
```

Se uma informação não altera pelo menos uma destas dimensões:

``` text
NÍVEL
STATUS
COMPETÊNCIA COMPROVADA
LACUNA RELEVANTE
BLOQUEIO
PRÓXIMO PASSO
```

ela provavelmente não pertence ao Ledger.

Para regras completas, SEMPRE consultar `11_PROGRESS_LEDGER_RULES.md`
antes de gerar/alterar uma nova versão do `10_PROGRESS_LEDGER.md`.

------------------------------------------------------------------------

# FONTE ÚNICA E ECONOMIA DE TOKENS

Separação obrigatória:

``` text
10_PROGRESS_LEDGER.md
→ síntese de progresso

11_PROGRESS_LEDGER_RULES.md
→ contrato do Ledger

context/chat_history/
→ contexto detalhado, decisões, debugging e continuidade

context/commands/ ou cartilha equivalente
→ comandos praticados, exemplos, riscos, rollback e validações

Git / artefatos do repositório
→ evidência técnica persistente

legacy/archive/
→ histórico legado; consulta excepcional
```

Não duplicar informação detalhada entre essas camadas.

Ao atualizar uma missão:

``` text
1. atualizar Estado atual;
2. alterar a skill somente se nível/evidência/lacuna mudou;
3. criar/alterar somente o bloco compacto da missão afetada;
4. atualizar bloqueios somente se mudaram;
5. atualizar Próximo passo;
6. não reescrever missões históricas sem mudança real;
7. validar limite de 25 linhas;
8. apontar para artefato detalhado.
```

------------------------------------------------------------------------

# ESTADO PEDAGÓGICO ATUAL

Resumo canônico:

``` text
PowerShell
→ N2 forte → N3

Git/GitHub
→ N2 forte → N3

Codex
→ N2 forte

Claude Code
→ bloqueado/adiado

Leitura de código
→ próximo / ainda não iniciado
```

Não promover automaticamente PowerShell, Git/GitHub ou Codex para N3. A
autonomia exigida ainda deve ser comprovada em desafios posteriores.

Claude Code permanece bloqueado/adiado por dependência corporativa. Não
contornar controles corporativos.

------------------------------------------------------------------------

# MISSÃO 006 --- ESTADO FINAL

MISSÃO 006 --- PR / Diff: CONCLUÍDA.

Fluxo consolidado:

``` text
diff
→ divergência
→ merge-base
→ Pull Request
→ review
→ risco
→ validação
→ decisão
→ merge
→ pós-merge
→ limpeza
```

Evidências essenciais: - PR #2 foi atualizado após push correto da
compare branch; - problema real de encoding foi diagnosticado; -
`.editorconfig` e `scripts/validate-utf8.ps1` foram integrados; -
validação UTF-8 chegou a zero inválidos; - diff/escopo foi revisado; -
decisão de merge foi baseada em evidências; - PR #2 foi mergeado; -
`main` local e `origin/main` chegaram ao merge commit `0b8d169`; -
feature local e remota foram removidas; - `git status --short` final não
retornou alterações.

Conceitos consolidados: - `git diff` vs `git diff --staged`; - `..` vs
`...`; - merge-base; - base vs compare; - Comment vs Approve vs Request
changes; - self-review vs peer review; - mergeável vs aprovado vs pronto
para merge; - commit local vs branch remota; - validação pós-merge e
limpeza.

Lacunas preservadas: - peer review real; - branch protection / required
checks; - rebase e estratégias de merge em maior profundidade; -
Git/GitHub N3 autônomo ainda não comprovado.

------------------------------------------------------------------------

# REGRAS PEDAGÓGICAS QUE CONTINUAM VÁLIDAS

Economia de tokens:

``` text
conceito já consolidado
→ explicação curta
→ comando
→ validação necessária
→ continuar
```

Aprofundar somente quando houver:

``` text
conceito novo
erro
debugging
risco
decisão técnica
diferença importante de comportamento
```

Modelo operacional:

``` text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

Debugging:

``` text
FATO / SINTOMA
↓
EVIDÊNCIA
↓
HIPÓTESE
↓
TESTE
↓
CONCLUSÃO
↓
CORREÇÃO (quando aplicável)
↓
VALIDAÇÃO
```

Antes de alterar estado Git: - observar estado; - entender
referências; - executar conscientemente; - validar resultado.

Não assumir estado transitório de uma sessão anterior sem nova evidência
quando isso for relevante para a ação atual.

------------------------------------------------------------------------

# NÃO REPETIR COMO CONTEÚDO NOVO

Não reconstruir MISSÕES 001--006.

Conceitos consolidados podem receber microexplicações quando forem
necessários à M007 ou a debugging real.

Não tratar como novidade: - fundamentos de PowerShell já praticados; -
Git local básico; - remote/origin/fetch/pull/push/clone; -
branch/HEAD/commit; - fast-forward, divergência, three-way merge e
conflito introdutório; - PR básico, base/compare e diff; - `..`, `...` e
merge-base introdutório; - Comment/Approve/Request changes; - encoding
do incidente da M006; - Codex Foundations já concluído.

------------------------------------------------------------------------

# PRÓXIMA MISSÃO --- M007 LEITURA DE CÓDIGO

A próxima sessão deve iniciar a MISSÃO 007 --- Leitura de código.

Objetivo inicial:

``` text
ENTRADA
↓
FUNÇÕES
↓
DECISÕES
↓
DEPENDÊNCIAS
↓
SAÍDA
```

Princípio:

``` text
ANTES DE ESCREVER MAIS CÓDIGO
↓
APRENDER A LER O QUE JÁ EXISTE
```

Não assumir conhecimento prévio de programação que ainda não foi
comprovado no Ledger.

A missão deve seguir o protocolo existente:

``` text
objetivo real
→ pré-requisitos mínimos
→ ELI5
→ explicação técnica
→ demonstração
→ laboratório
→ validação
→ recuperação de erro
→ conexão com QA quando relevante
→ oportunidade AI First quando fizer sentido
```

Ao concluir ou atualizar M007: 1. criar/atualizar os artefatos
detalhados da missão; 2. consultar `11_PROGRESS_LEDGER_RULES.md`; 3.
atualizar `10_PROGRESS_LEDGER.md` apenas de forma incremental; 4. não
reconstruir M001--M006; 5. manter o Ledger dentro do budget definido.

------------------------------------------------------------------------

# ORDEM DE LEITURA RECOMENDADA PARA RETOMADA

Para uma nova sessão:

``` text
1. regras base da formação já carregadas
2. este contexto de continuidade
3. 10_PROGRESS_LEDGER.md para estado atual
4. 11_PROGRESS_LEDGER_RULES.md somente quando houver necessidade de atualizar/validar o Ledger
5. artefatos detalhados da missão somente sob demanda
6. legacy/archive somente para investigação histórica excepcional
```

Objetivo: preservar continuidade com baixo custo de tokens e evitar
carregar histórico detalhado sem necessidade.

------------------------------------------------------------------------

# PONTO EXATO PARA O PRÓXIMO CHAT

``` text
MISSÃO 007 — Leitura de código
STATUS: pronta para iniciar
```

Antes de iniciar, não é necessário reconstruir o histórico das seis
missões anteriores.

Usar o estado compacto do `10_PROGRESS_LEDGER.md`, obedecer às regras de
`11_PROGRESS_LEDGER_RULES.md` para qualquer manutenção do Ledger e
seguir normalmente as demais regras existentes da formação.
