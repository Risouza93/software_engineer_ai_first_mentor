# CONTEXTO DE CONTINUIDADE — MISSÃO 004 / CODEX FOUNDATIONS CONCLUÍDO

Data: 14/08/2026  
Formação: Software Engineer AI-First Mentor  
Missões anteriores: MISSÕES 001–003 — CONCLUÍDAS  
Missão atual: MISSÃO 004 — AI Coding Tools Foundations  
Estado: Codex Foundations concluído; Claude Code Foundations adiado por dependência corporativa.  
Ponto exato de retomada no próximo chat: avançar para a próxima etapa disponível do roadmap sem iniciar Claude Code; quando a empresa liberar licença e instalar/configurar Claude CLI, retomar a Parte B da MISSÃO 004 e depois executar a comparação Codex × Claude Code.

---

# ROADMAP ATUAL

```text
MISSÃO 001 — Terminal e PowerShell          ✅
MISSÃO 002 — Git Foundations                ✅
MISSÃO 003 — GitHub                         ✅
MISSÃO 004 — AI Coding Tools Foundations    ◐ PARCIAL
             ├── Codex Foundations          ✅ CONCLUÍDO
             └── Claude Code Foundations    ⏸ BLOQUEADO / ADIADO
                                                 dependência: licença + CLI/configuração pela empresa

PRÓXIMA ETAPA DISPONÍVEL
MISSÃO 005 — Branching                      ← RETOMAR NO NOVO CHAT
```

Claude Code NÃO deve ser tratado como concluído ou pulado definitivamente. Está apenas adiado até a dependência corporativa ser resolvida.

---

# ESTADO CONSOLIDADO

Níveis anteriores preservados:

```text
PowerShell: N2 forte, em transição para N3
Git local: N2 forte, entrando em N3
GitHub: fluxo profissional básico executado de forma guiada (N2)
```

Codex Foundations:

```text
N2 forte — execução guiada concluída, com debugging real e tomada de decisão assistida.
Não promover automaticamente para N3: autonomia deve ser comprovada em desafios posteriores.
```

Repositório de formação:

```text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

Branch principal:

```text
main
```

---

# MISSÃO 004 — PRINCÍPIO OPERACIONAL CONSOLIDADO

```text
GPT PERSONALIZADO
Professor / Mentor
        ↓
Coding Agent
Codex
        ↓
Filesystem + Terminal + Repositório
        ↓
Git / GitHub
Rastreabilidade
        ↓
Humano / QA
Validação e decisão
```

Regra de autonomia:

```text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```

Guardrails:

```text
SANDBOX
"até onde tecnicamente pode agir"
        +
PERMISSÕES / APPROVALS
"quando precisa de aprovação"
        +
PROMPT
"qual é o escopo operacional autorizado"
        +
GIT DIFF / STATUS
"o que realmente mudou"
        +
HUMANO
"validar, aceitar, corrigir ou rejeitar"
```

Separação consolidada:

```text
capacidade técnica
≠
autorização operacional
≠
resultado correto
≠
aceitação humana
```

---

# CODEX FOUNDATIONS — CONCLUÍDO

## Instalação e autenticação

Codex observado:

```text
OpenAI Codex v0.147.0
model: gpt-5.6-sol
directory: ~\Documents\ia\software_engineer_ai_first_mentor
```

Autenticação concluída via conta ChatGPT.

Nenhum segredo/token foi exposto.

## Sandbox e permissões

Estado observado:

```text
Permissions: Workspace (Ask for approval)
```

Menu estudado:

```text
Read Only
Ask for approval (non-admin sandbox) — utilizado
Approve for me
Full Access
```

Não foi ampliado para Full Access.

Conceitos:

```text
workspace ≠ read only
sandbox ≠ prompt
permissão ≠ confiança
```

## Primeiro laboratório — somente leitura

Codex analisou o repositório com proibição explícita de alterar arquivos/Git.

Validação independente:

```powershell
git status --short
```

Resultado naquele momento:

```text
<sem saída>
```

Conclusão: tarefa somente leitura validada por Git.

## Segundo laboratório — alteração controlada

Foi autorizado alterar somente `README.md`, adicionando:

```markdown
## Laboratório Codex

Foi realizada uma primeira análise somente leitura do repositório com Codex.
```

Validação:

```powershell
git diff -- README.md
git status --short
```

Warning LF/CRLF foi observado e deliberadamente não tratado nesta missão.

## Sessão, contexto e comandos operacionais

Praticado/observado:

```text
/status
/permissions
/diff
/review
/resume
/exit
```

Estudado conceitualmente:

```text
/new
/fork
/archive
/delete
/compact
/mention
/ide
/model
/plan
```

Outros recursos foram apenas descobertos no menu e NÃO devem ser tratados como dominados:

```text
/memories
/skills
/hooks
/mcp
/plugins
/subagents
/goal
/experimental
```

Modelo mental:

```text
FILESYSTEM
≠
GIT
≠
SESSÃO
≠
CONTEXTO DO MODELO
```

`/compact` foi entendido, mas não executado artificialmente porque não havia necessidade real.

---

# LABORATÓRIO DE AI REVIEW

O comando:

```text
/review
```

identificou possível inconsistência em referências de arquivos de continuidade.

Finding:

```text
referências internas apontavam para nomes antigos/inexistentes
```

O finding NÃO foi aceito automaticamente.

Fluxo de validação:

```text
AI REVIEW
↓
HIPÓTESE
↓
Get-ChildItem confirmou nomes reais
↓
Select-String confirmou referências antigas
↓
VERDADEIRO POSITIVO
↓
humano autorizou correção limitada
↓
Codex corrigiu
↓
Select-String validou referências novas
```

Comandos usados:

```powershell
Get-ChildItem .\context\chat_history\*MISSAO_004* | Select-Object Name

Select-String `
  -Path .\context\chat_history\CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md `
  -Pattern "CONTEXTO.*MISSAO_004"
```

Lição:

```text
/review
→ análise por IA

finding
→ hipótese até ser validada

evidência independente
→ confirma/refuta

humano
→ decide
```

---

# GIT — REGISTRO REAL DA SESSÃO

Durante o encerramento o estado observado incluiu:

```text
 M README.md
 D context/chat_history/CONTEXTO_INICIO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
?? context/chat_history/CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
?? context/chat_history/CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
?? context/commands/comandos_missao_004.md
```

Depois, por decisão humana, foram executados:

```powershell
git add .
git commit -m "Correções no contexto"
git push
```

Commit observado:

```text
72ab9b3
```

Resumo observado:

```text
4 files changed, 1143 insertions(+)
rename context/chat_history/{CONTEXTO_INICIO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md => CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md} (100%)
create mode 100644 context/chat_history/CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
create mode 100644 context/commands/comandos_missao_004.md
```

O usuário informou que o push também foi concluído.

Não assumir Working Tree clean em outro chat sem executar nova validação.

---

# DEBUGGING REAL — CODEX NÃO RESOLVIDO NO PATH

Sintoma:

```powershell
codex resume
```

retornou:

```text
CommandNotFoundException
```

Evidências:

```powershell
Get-Command codex -All
where.exe codex
```

não localizaram o comando.

Busca encontrou o executável versionado:

```text
C:\Users\richard.feitosa\.codex\packages\standalone\releases\0.147.0-x86_64-pc-windows-msvc\bin\codex.exe
```

Execução por caminho absoluto funcionou, provando que a instalação estava funcional.

Foi localizado também o diretório estável:

```text
C:\Users\richard.feitosa\AppData\Local\Programs\OpenAI\Codex\bin
```

contendo `codex.exe`.

Diagnóstico:

```text
codex.exe existe
+
funciona por caminho absoluto
+
PATH persistente inicialmente não estava disponível na sessão PowerShell
=
problema de resolução/PATH, não falha do Codex
```

O diretório estável foi adicionado ao PATH do usuário.

Foi observada a diferença:

```text
PATH persistente do usuário
≠
$env:PATH de processo PowerShell já aberto
```

Após abrir novo processo/terminal, `codex resume` funcionou.

---

# CONTINUIDADE DE SESSÃO — VALIDADA

Sessão original:

```text
01a00095-7351-7c63-ba1c-45e608fdf0db
```

Após sair e usar:

```powershell
codex resume
```

a sessão retomada apresentou o mesmo Session ID:

```text
01a00095-7351-7c63-ba1c-45e608fdf0db
```

Também foram preservados:

```text
Directory: ~\Documents\ia\software_engineer_ai_first_mentor
Permissions: Workspace (Ask for approval)
Model: gpt-5.6-sol
```

Conclusão:

```text
/exit
→ encerra execução atual

codex resume
→ permite localizar e retomar chat salvo

mesmo Session ID
→ evidência de continuidade da sessão
```

---

# CLAUDE CODE — ESTADO OFICIAL

Claude Code Foundations NÃO foi executado.

Motivo externo:

```text
empresa ainda não liberou a licença
+
Claude CLI ainda não foi instalado/configurado pela infraestrutura
```

Tratamento:

```text
ADIADO / BLOQUEADO POR DEPENDÊNCIA
```

Quando a dependência for liberada, retomar:

```text
MISSÃO 004 — Parte B — Claude Code Foundations
↓
documentação oficial atual
↓
pré-requisitos corporativos
↓
validar instalação/configuração fornecida pela infraestrutura
↓
autenticação
↓
permissões
↓
tarefa somente leitura
↓
alteração controlada
↓
git diff/status
↓
validação
↓
comparação Codex × Claude Code baseada em evidências
```

Não inventar instalação nem contornar controles corporativos.

---

# NÃO REPETIR COMO CONCEITO NOVO

Codex:

```text
instalação básica
autenticação
sandbox inicial
primeira tarefa somente leitura
primeira alteração controlada
/status
/permissions
/diff
/review
sessão/contexto introdutórios
resume
debugging de PATH realizado nesta sessão
```

Microexplicações continuam permitidas quando necessárias.

---

# PONTO EXATO DE RETOMADA NO NOVO CHAT

Como Claude Code está bloqueado, avançar temporariamente no roadmap:

```text
MISSÃO 005 — Branching
```

Antes de qualquer operação Git que altere estado:

```powershell
git status --short
```

Não assumir Working Tree clean.

Quando Claude Code for liberado pela empresa, pausar no ponto seguro e retomar a Parte B da MISSÃO 004.

---

# ESTILO PEDAGÓGICO

Preservar:

```text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

Para coding agents:

```text
LER
↓
REVISAR
↓
PERMITIR ALTERAÇÃO CONTROLADA
↓
REVISAR DIFF
↓
TESTAR / VALIDAR
↓
DECIDIR
```

Pedir saídas de comandos somente quando necessárias.

Não pedir baterias de comandos.

Separar sempre:

```text
FATO
EVIDÊNCIA
HIPÓTESE
TESTE
CONCLUSÃO
```

---

# ARTEFATOS A MANTER

```text
context/chat_history/CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
context/chat_history/CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
context/commands/comandos_missao_004.md
10_PROGRESS_LEDGER.md
```

Este novo contexto substitui, para continuidade pedagógica, o snapshot parcial anterior.


---

# POWERSHELL — HISTÓRICO PERSISTENTE E BUSCA POR PREFIXO

Foi identificado que o PowerShell já utiliza o módulo:

```text
PSReadLine 2.0.0
```

Histórico persistente observado:

```text
C:\Users\richard.feitosa\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
```

Configuração observada:

```text
HistorySaveStyle: SaveIncrementally
```

Conclusão:

```text
não foi necessário criar um novo arquivo de histórico
```

O PSReadLine já salva comandos incrementalmente em arquivo persistente.

Key handlers observados antes da customização:

```text
F8        → HistorySearchBackward
Shift+F8  → HistorySearchForward
UpArrow   → PreviousHistory
DownArrow → NextHistory
Ctrl+r    → ReverseSearchHistory
Ctrl+s    → ForwardSearchHistory
```

Objetivo do usuário:

```text
digitar prefixo
↓
PageUp / PageDown
↓
navegar por comandos anteriores compatíveis
```

Configuração praticada na sessão:

```powershell
Set-PSReadLineKeyHandler -Key PageUp -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key PageDown -Function HistorySearchForward
```

Conceito:

```text
UpArrow / DownArrow
→ navegação geral pelo histórico

PageUp / PageDown configurados
→ busca no histórico usando o prefixo digitado
```

Para persistir a configuração entre sessões, foi orientado utilizar o PowerShell Profile:

```powershell
$PROFILE
Test-Path $PROFILE
```

Se necessário:

```powershell
New-Item -ItemType File -Path $PROFILE -Force
```

Linhas a manter no profile:

```powershell
Set-PSReadLineKeyHandler -Key PageUp -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key PageDown -Function HistorySearchForward
```

Validação:

```powershell
Get-PSReadLineKeyHandler |
Where-Object { $_.Key -in @("PageUp", "PageDown") } |
Select-Object Key, Function
```

Inspeção do histórico persistente:

```powershell
Get-Content (Get-PSReadLineOption).HistorySavePath
```

Últimos comandos:

```powershell
Get-Content (Get-PSReadLineOption).HistorySavePath -Tail 20
```

Modelo mental consolidado:

```text
COMANDO EXECUTADO
↓
PSReadLine
↓
ConsoleHost_history.txt
↓
nova sessão PowerShell
↓
prefixo digitado
↓
PageUp / PageDown
↓
histórico filtrado pelo prefixo
```

Esse aprendizado reforça PowerShell Foundations e melhora a ergonomia operacional para as próximas missões.

---

# PONTO DE RETOMADA ATUALIZADO

Após registrar o fechamento do Codex Foundations e a melhoria de histórico do PowerShell:

```text
MISSÃO 005 — Branching
```

continua sendo a próxima etapa disponível.

Claude Code permanece:

```text
ADIADO / BLOQUEADO POR DEPENDÊNCIA CORPORATIVA
```

Retomar apenas quando licença e CLI/configuração corporativa estiverem disponíveis.
