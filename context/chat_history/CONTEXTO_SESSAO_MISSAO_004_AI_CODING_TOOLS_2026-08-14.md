# CONTEXTO DE CONTINUIDADE — INÍCIO DA MISSÃO 004 / AI CODING TOOLS FOUNDATIONS

Data: 14/08/2026  
Formação: Software Engineer AI-First Mentor  
Missão anterior: MISSÃO 003 — GitHub — CONCLUÍDA  
Missão atual: MISSÃO 004 — AI Coding Tools Foundations — PRÓXIMA  
Ponto exato de retomada: iniciar Codex Foundations, consultando documentação oficial atual e validando somente os pré-requisitos necessários.

---

# ROADMAP ATUAL

```text
MISSÃO 001 — Terminal e PowerShell          ✅
MISSÃO 002 — Git Foundations                ✅
MISSÃO 003 — GitHub                         ✅
MISSÃO 004 — AI Coding Tools Foundations    ← INICIAR
             ├── Codex
             └── Claude Code
```

---

# ESTADO CONSOLIDADO

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

Estado final observado pedagogicamente:

```text
main local atualizada após merge do PR
feature/github-pr-lab removida localmente
feature/github-pr-lab removida remotamente
histórico da alteração preservado na main/GitHub
```

Não assumir Working Tree clean sem nova evidência caso isso seja necessário para uma operação futura.

---

# MISSÃO 003 — CONCLUÍDO

Já estavam consolidados:

```text
Git ≠ GitHub
local ≠ remoto
remote
origin
main
origin/main
upstream/tracking
primeiro push da main
fetch
pull
clone
fast-forward remoto
```

No bloco final foram praticados:

```powershell
git switch -c feature/github-pr-lab
git branch
git diff
git add .\README.md
git diff --staged
git commit -m "docs: adiciona registro do laboratorio de Pull Request"
git push -u origin feature/github-pr-lab
```

Primeiro Pull Request:

```text
base: main
compare: feature/github-pr-lab
```

Review:

```text
intenção
→ arquivos
→ diff
→ impacto
→ risco
→ validação
→ decisão
```

Laboratório:

```text
arquivo: README.md
mudança: uma linha documental
risco: baixo
validação: revisão do diff
```

Depois:

```text
merge remoto via Pull Request
↓
git switch main
↓
git pull
```

Higiene pós-merge:

```powershell
git branch -d feature/github-pr-lab
git push origin --delete feature/github-pr-lab
```

Foi confirmado no GitHub que a branch remota foi removida e o histórico da alteração integrada permaneceu preservado.

---

# NÃO REPETIR COMO CONCEITO NOVO

```text
Git local básico
Working Tree / Staging Area
commit básico
branch local básica
HEAD
restore
remote / origin
push da main
fetch
pull
clone
fast-forward básico
primeiro push de feature branch
Pull Request básico
base vs compare
review básico de diff
merge remoto básico via PR
limpeza pós-merge
```

Microexplicações são permitidas apenas quando necessárias para conectar a MISSÃO 004.

Ainda não tratar como dominado:

```text
branch protection
merge divergente
conflitos
rebase
Git/GitHub N3 autônomo
```

---

# MISSÃO 004 — OBJETIVO

Introduzir Codex e Claude Code como ferramentas de engenharia com rastreabilidade, revisão humana e autonomia progressiva.

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

Regra oficial:

```text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```

---

# PARTE A — CODEX

Sequência:

```text
consultar documentação oficial atual
↓
identificar pré-requisitos atuais
↓
validar ambiente
↓
instalar
↓
validar instalação
↓
autenticar
↓
entender diretório/repositório e permissões
↓
primeira tarefa SOMENTE LEITURA
↓
revisar resultado
↓
alteração pequena e controlada
↓
git diff
↓
testes/validação
```

Não iniciar Claude Code antes de completar o primeiro laboratório controlado com Codex.

---

# PARTE B — CLAUDE CODE

Depois do laboratório Codex, executar laboratório equivalente:

```text
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
```

---

# PARTE C — COMPARAÇÃO

Comparar com evidências:

```text
instalação
autenticação
UX
contexto
permissões
qualidade da leitura
qualidade da alteração
controle humano
diff produzido
testes
rastreabilidade
pontos fortes
limitações
```

---

# POLÍTICA DE FONTES

Como CLIs, instalação e autenticação podem mudar:

Para Codex:
- documentação oficial OpenAI;
- repositório/documentação oficial quando aplicável.

Para Claude Code:
- documentação oficial Anthropic;
- repositório/documentação oficial quando aplicável.

Para runtimes e Windows:
- documentação oficial correspondente.

Não ensinar comando atual dependente de versão apenas por memória.

---

# SEGURANÇA

Nunca:

- expor token, chave ou credencial;
- commitar segredo ou `.env` sensível;
- ampliar permissões sem explicar impacto;
- começar com alteração irrestrita;
- aceitar saída da IA sem revisão;
- executar commit, push ou merge automaticamente na fase inicial;
- executar ação destrutiva sem aprovação explícita.

Antes de permitir alteração por coding agent:

```text
objetivo
↓
arquivos envolvidos
↓
rastreabilidade Git
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

Preservar a preferência operacional registrada:

```text
pedir saída de comandos SOMENTE
quando necessária para avançar ou diagnosticar
```

Portanto:

- respostas objetivas;
- não pedir bateria de comandos;
- aceitar confirmação curta quando tudo funcionar;
- aprofundar conceitos novos, erros, riscos e permissões;
- preservar OBSERVAR → ENTENDER → EXECUTAR → VALIDAR.

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
TESTAR
↓
DECIDIR
```

---

# RETOMADA EXATA NO PRÓXIMO CHAT

Começar diretamente:

```text
MISSÃO 004 — AI Coding Tools Foundations
Parte A — Codex
```

Primeiro bloco:

1. reconhecer MISSÕES 001–003 como concluídas;
2. explicar brevemente o papel do Codex no modelo AI-First;
3. consultar documentação oficial atual;
4. identificar requisitos e instalação atuais para o ambiente Windows/PowerShell;
5. validar somente o necessário;
6. instalar e validar;
7. autenticar sem expor segredo;
8. executar a primeira tarefa somente leitura dentro do repositório de formação.

---

# ARTEFATOS DE CONTINUIDADE

```text
comandos_missao_003_ATUALIZADO.md
CONTEXTO_INICIO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
```

O primeiro fecha operacionalmente a MISSÃO 003.

O segundo é o ponto oficial de entrada da MISSÃO 004.

Ao iniciar a MISSÃO 004, criar/evoluir uma nova cartilha operacional apenas com comandos e conceitos efetivamente ensinados e praticados.
