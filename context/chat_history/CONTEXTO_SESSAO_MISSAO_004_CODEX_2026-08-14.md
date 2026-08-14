# CONTEXTO DE CONTINUIDADE — MISSÃO 004 / CODEX FOUNDATIONS

Data: 14/08/2026  
Formação: Software Engineer AI-First Mentor  
Missões anteriores: MISSÕES 001–003 — CONCLUÍDAS  
Missão atual: MISSÃO 004 — AI Coding Tools Foundations  
Parte atual: Parte A — Codex  
Ponto exato de retomada: continuar Codex Foundations após o primeiro laboratório controlado, estudando sessão, contexto, permissões e comandos essenciais; depois fechar o laboratório Codex antes de iniciar Claude Code.

---

# ROADMAP ATUAL

```text
MISSÃO 001 — Terminal e PowerShell          ✅
MISSÃO 002 — Git Foundations                ✅
MISSÃO 003 — GitHub                         ✅
MISSÃO 004 — AI Coding Tools Foundations    ← EM ANDAMENTO
             ├── Codex                      ← EM ANDAMENTO
             └── Claude Code                ← NÃO INICIAR AINDA
```

---

# ESTADO CONSOLIDADO ANTERIOR

Nível pedagógico observado:

```text
PowerShell: N2 forte, em transição para N3
Git local: N2 forte, entrando em N3
GitHub: fluxo profissional básico executado de forma guiada (N2)
```

Não promover automaticamente para N3: autonomia deverá ser comprovada em desafios posteriores.

Repositório de formação:

```text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

Branch principal:

```text
main
```

A MISSÃO 003 já havia consolidado:

```text
Git ≠ GitHub
local ≠ remoto
remote / origin
main / origin/main
upstream/tracking
push / fetch / pull / clone
feature branch
Pull Request
review de diff
merge remoto
sincronização pós-merge
limpeza de branches
```

Ainda não tratar como dominado:

```text
branch protection
merge divergente
conflitos
rebase
Git/GitHub N3 autônomo
```

---

# MISSÃO 004 — PRINCÍPIO OPERACIONAL

Arquitetura:

```text
GPT PERSONALIZADO
Professor / Mentor
        ↓
Codex + Claude Code
Execução assistida
        ↓
Git / GitHub
Rastreabilidade
        ↓
QA Engineering
Validação
```

Regra oficial de autonomia:

```text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```

Guardrail praticado:

```text
SANDBOX
"até onde o agente pode agir"
        +
PROMPT
"o que o agente deve fazer"
        +
GIT DIFF / STATUS
"o que ele realmente fez"
        +
HUMANO
"aceitar, corrigir ou rejeitar"
```

---

# PARTE A — CODEX: O QUE JÁ FOI EXECUTADO

## 1. Instalação

Foi utilizado o instalador standalone oficial para Windows/PowerShell.

A instalação foi concluída antes da validação pedagógica de pré-requisito originalmente planejada.

Codex observado após instalação:

```text
OpenAI Codex v0.147.0
model: gpt-5.6-sol
directory: ~\Documents\ia\software_engineer_ai_first_mentor
```

---

## 2. Autenticação

Autenticação concluída com conta ChatGPT.

Evidência observada:

```text
✓ Signed in with your ChatGPT account
```

Nenhum segredo, token ou credencial foi exposto no chat.

---

## 3. Sandbox

Foi selecionado sandbox sem permissão de administrador.

Evidência observada:

```text
Sandbox ready
Codex can now safely edit files and execute commands in your computer
```

Conceito consolidado:

```text
sandbox ≠ somente leitura
```

O sandbox estabelece limites técnicos, mas o agente ainda pode possuir capacidade de editar arquivos e executar comandos dentro desses limites.

---

# PRIMEIRO LABORATÓRIO — SOMENTE LEITURA

Foi solicitado ao Codex que analisasse o repositório sem:

```text
alterar arquivos
criar arquivos
mover arquivos
excluir arquivos
modificar Git
commit
push
pull
merge
```

Objetivos solicitados:

```text
identificar propósito do repositório
descrever estrutura principal
identificar missão atual
citar arquivos usados como evidência
separar fatos de inferências
```

O Codex respondeu com análise baseada em evidências e separou explicitamente inferências.

Entre os arquivos citados por ele:

```text
README.md
00_MASTER_CONTEXT.md
01_SYSTEM_INSTRUCTIONS.md
02_LEARNING_PROTOCOL.md
03_CURRICULUM.md
05_AI_FIRST_ENGINEERING.md
06_SKILLS_CATALOG.md
07_AGENTS_CATALOG.md
10_PROGRESS_LEDGER.md
context/chat_history/CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
```

Ele afirmou não ter realizado alterações.

Validação independente executada:

```powershell
git status --short
```

Resultado:

```text
<sem saída>
```

Conclusão:

```text
tarefa somente leitura executada
↓
resposta humana revisada
↓
Git confirmou ausência de mudanças
```

---

# SEGUNDO LABORATÓRIO — ALTERAÇÃO CONTROLADA

Foi solicitado ao Codex:

```text
alterar somente README.md
adicionar pequena seção "Laboratório Codex"
registrar a primeira análise somente leitura
não alterar nenhum outro arquivo
não criar arquivos
não executar git add
não executar commit
não executar push/pull/merge
```

O Codex concluiu a alteração.

Review humano:

```powershell
git diff -- README.md
```

Diff observado:

```diff
+## Laboratório Codex
+
+Foi realizada uma primeira análise somente leitura do repositório com Codex.
```

Também apareceu o aviso:

```text
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it
```

Tratamento pedagógico:

```text
não é erro do laboratório
não corrigir/configurar line endings agora
assunto separado para momento apropriado
```

Depois foi solicitado:

```powershell
git status --short
```

O usuário confirmou a validação como feita e a continuidade pedagógica assumiu que somente `README.md` estava modificado.

IMPORTANTE PARA O NOVO CHAT:
Antes de qualquer operação Git que altere estado, se o estado atual for relevante, validar novamente. Não assumir Working Tree clean.

---

# ESTADO ATUAL DO README

Existe uma alteração local deliberada e ainda não commitada:

```markdown
## Laboratório Codex

Foi realizada uma primeira análise somente leitura do repositório com Codex.
```

Não foi executado durante este laboratório:

```text
git add
git commit
git push
git pull
git merge
```

Não commitar automaticamente.

---

# CONCEITOS NOVOS JÁ ENSINADOS NA MISSÃO 004

```text
Codex como coding agent local
mentor ≠ coding agent
coding agent ≠ Git
sandbox
sandbox ≠ somente leitura
autonomia com escopo
prompt como fronteira operacional
Git como validação independente
fato ≠ inferência
evidência de repositório
review humano de saída de IA
review humano de diff produzido por IA
```

Fluxo praticado:

```text
PROMPT CONTROLADO
↓
CODEX LÊ / ALTERA DENTRO DO ESCOPO
↓
HUMANO REVISA
↓
GIT DIFF / STATUS
↓
EVIDÊNCIA
↓
DECISÃO HUMANA
```

---

# NÃO REPETIR COMO CONCEITO NOVO

Não reiniciar instalação ou explicar do zero:

```text
o que é Codex
instalação básica
login básico
primeiro sandbox
primeira tarefa somente leitura
primeiro git status de validação
primeira alteração controlada
primeiro git diff produzido por Codex
```

Microexplicações são permitidas quando necessárias para conectar conceitos novos.

---

# PONTO EXATO DE RETOMADA

Continuar:

```text
MISSÃO 004 — AI Coding Tools Foundations
Parte A — Codex
```

Próximo bloco já definido pedagogicamente:

```text
sessão
contexto
permissões
comandos essenciais do Codex
```

Objetivo:

- entender como operar Codex no dia a dia;
- não transformar a aula em lista para decorar;
- manter autonomia limitada;
- entender quando uma ação exige revisão/permissão;
- preservar Git como fonte de evidência;
- fechar o primeiro laboratório Codex somente depois dessas bases.

Ainda NÃO iniciar Claude Code antes de completar e fechar o laboratório Codex.

---

# DEPOIS DO BLOCO OPERACIONAL CODEX

Sequência planejada:

```text
fechar laboratório Codex
↓
registrar evidências necessárias
↓
Parte B — Claude Code
↓
documentação oficial atual
↓
pré-requisitos
↓
instalação
↓
autenticação
↓
tarefa somente leitura
↓
alteração controlada
↓
git diff
↓
testes/validação
↓
comparação Codex × Claude Code
```

---

# SEGURANÇA

Nunca:

- expor token, chave ou credencial;
- commitar segredo ou `.env` sensível;
- ampliar permissões sem explicar impacto;
- aceitar saída da IA sem revisão;
- executar commit, push ou merge automaticamente na fase inicial;
- executar ação destrutiva sem aprovação explícita.

Antes de alterações futuras:

```text
objetivo
↓
arquivos envolvidos
↓
estado Git
↓
permissão consciente
↓
alteração
↓
git diff
↓
teste/validação
↓
decisão humana
```

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

E para coding agents:

```text
LER
↓
REVISAR
↓
PERMITIR ALTERAÇÃO CONTROLADA
↓
REVISAR DIFF
↓
TESTAR
↓
DECIDIR
```

Pedir saída de comandos somente quando necessária para avançar ou diagnosticar.

Não pedir baterias de comandos.

Aceitar confirmações curtas quando forem evidência suficiente.

---

# ARTEFATOS DE CONTINUIDADE

Anterior:

```text
comandos_missao_003.md
CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
```

Criados neste encerramento parcial:

```text
CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
comandos_missao_004.md
```

A cartilha `comandos_missao_004.md` contém somente comandos e conceitos efetivamente ensinados/praticados até este ponto.
