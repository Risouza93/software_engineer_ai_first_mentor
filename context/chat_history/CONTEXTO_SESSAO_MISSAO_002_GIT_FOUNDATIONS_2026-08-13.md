# CONTEXTO DE CONTINUIDADE — MISSÃO 002 / GIT FOUNDATIONS

Data: 13/08/2026  
Formação: Software Engineer AI-First Mentor  
Missão atual: MISSÃO 002 — Git Foundations  
Missão anterior: MISSÃO 001 — Terminal e PowerShell — CONCLUÍDA  
Status atual: Git local em andamento  
Próximo ponto exato: `git restore --staged <arquivo>`

---

# OBJETIVO DESTE ARQUIVO

Permitir que uma nova conversa continue exatamente do ponto atual.

Na próxima conversa:

1. reconhecer brevemente que a MISSÃO 001 está concluída;
2. reconhecer que a MISSÃO 002 já está em andamento;
3. NÃO reiniciar Git Foundations;
4. NÃO repetir `git init`, primeiro `git add`, primeiro commit ou o laboratório de `git restore`;
5. continuar diretamente pelo conceito de retirar uma alteração da staging area sem perder a alteração no working tree;
6. introduzir e praticar `git restore --staged <arquivo>`;
7. continuar priorizando Git LOCAL;
8. NÃO avançar prematuramente para GitHub, `push`, Pull Request ou operações remotas.

---

# MISSÃO 001 — STATUS

MISSÃO 001 — Terminal e PowerShell: CONCLUÍDA.

Nível registrado anteriormente:

```text
PowerShell: N2 forte, em transição para N3
```

Não repetir os laboratórios da MISSÃO 001, salvo revisão pontual necessária.

---

# MISSÃO 002 — O QUE JÁ FOI APRENDIDO

## 1. Problema que Git resolve

Foi construído o entendimento de que Git é usado para controle de versão e permite manter histórico e comparar estados de um projeto.

Foi diferenciada a existência de arquivos no filesystem da existência de versões registradas no Git.

Modelo inicial:

```text
arquivos no disco
↓
Git observa/controla estados
↓
commits
↓
histórico
```

Também foi consolidado:

```text
Git ≠ GitHub
```

Toda a prática realizada até agora foi Git LOCAL.

---

# 2. Repositório Git

Antes de inicializar o repositório foi executado:

```powershell
Get-Location
git status
```

Resultado do `git status`:

```text
fatal: not a git repository (or any of the parent directories): .git
```

Foi entendido que:

```text
pasta no filesystem
≠
repositório Git
```

Depois foi inicializado o repositório com:

```powershell
git init
```

O Git passou a reconhecer a pasta como repositório.

Diretório de trabalho usado:

```text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

---

# 3. Diretório `.git`

Foi inspecionado com:

```powershell
Get-ChildItem .git
```

Foram observados:

```text
hooks
info
objects
refs
config
description
HEAD
```

Modelo construído:

```text
.git
→ estrutura interna/metadados do repositório
→ configurações, referências, objetos e informações necessárias ao Git
```

Não aprofundar ainda todos os componentes internos.

Regra mantida:

```text
não alterar manualmente .git durante os laboratórios
```

---

# 4. Working Tree e Untracked

Após `git init`, `git status` mostrou os arquivos existentes como:

```text
Untracked files
```

Foi entendido:

```text
arquivo existir no filesystem
≠
arquivo já possuir versão registrada no Git
```

Definição operacional atual:

```text
UNTRACKED
→ arquivo existe no working tree
→ Git ainda não começou a acompanhá-lo no histórico
```

Foi introduzido o conceito de Working Tree.

---

# 5. Staging Area e `git add`

Foi escolhido somente o arquivo:

```text
README.md
```

Executado:

```powershell
git add .\README.md
```

Depois `git status` mostrou:

```text
Changes to be committed:
        new file: README.md
```

Os demais arquivos permaneceram `Untracked`.

Foi consolidado:

```text
git add
→ não cria commit
→ não envia nada ao GitHub
→ prepara o estado atual do arquivo para o próximo commit
```

Modelo:

```text
WORKING TREE
↓
git add
↓
STAGING AREA
```

Entendimento demonstrado pelo aluno:

se somente `README.md` estiver staged, somente ele deverá participar do próximo commit.

---

# 6. Identidade Git

Antes do primeiro commit foram investigados:

```powershell
git config user.name
git config user.email
git config --global user.name
git config --global user.email
git config --local user.name
git config --local user.email
```

Inicialmente não havia identidade configurada.

Foi explicada a diferença conceitual entre:

```text
GLOBAL
→ configuração do usuário reutilizada por repositórios

LOCAL
→ configuração específica do repositório
→ pode sobrescrever configuração global
```

Depois foi configurada identidade global e validada.

Não é necessário repetir essa configuração na próxima conversa.

---

# 7. Primeiro commit

Primeiro commit criado:

```powershell
git commit -m "docs: adicionar README inicial"
```

Resultado:

```text
[master (root-commit) 75fd660] docs: adicionar README inicial
1 file changed, 209 insertions(+)
create mode 100644 README.md
```

Foi entendido:

```text
root-commit
→ primeiro commit do histórico

75fd660
→ hash abreviado do commit
```

`git log --oneline` confirmou:

```text
75fd660 (HEAD -> master) docs: adicionar README inicial
```

HEAD e branch `master` foram apenas introduzidos superficialmente.

Não aprofundar branches ainda.

---

# 8. Tracked + Modified

Foi adicionada uma alteração ao `README.md` depois do primeiro commit.

`git status` passou a mostrar:

```text
Changes not staged for commit:
        modified: README.md
```

Foi consolidada a diferença:

```text
UNTRACKED
≠
TRACKED + MODIFIED
≠
STAGED
```

Definição operacional:

```text
TRACKED
→ Git já conhece/acompanha o arquivo

MODIFIED
→ conteúdo atual do working tree difere do estado conhecido/preparado
```

---

# 9. `git diff`

Foi executado:

```powershell
git diff
```

E observada a alteração no README.

Modelo construído:

```text
git status
→ QUAL é o estado?

git diff
→ O QUE mudou?
```

---

# 10. Experimento A / B / C — conceito central já consolidado

Foi realizado um laboratório para provar que o mesmo arquivo pode possuir estados diferentes simultaneamente.

Modelo:

```text
HISTÓRICO
Versão A

STAGING AREA
Versão B

WORKING TREE
Versão C
```

Fluxo realizado:

1. README possuía versão A no histórico.
2. Uma alteração foi feita.
3. Executado:

```powershell
git add .\README.md
```

4. Essa alteração tornou-se a versão B staged.
5. O README foi alterado novamente SEM novo `git add`.
6. Surgiu a versão C somente no working tree.

`git status` mostrou o mesmo arquivo nas duas categorias:

```text
Changes to be committed:
        modified: README.md

Changes not staged for commit:
        modified: README.md
```

O aluno compreendeu que, se fosse realizado um commit nesse estado:

```text
Versão B → seria commitada
Versão C → ficaria de fora
```

---

# 11. `git diff` versus `git diff --staged`

Foram executados e comparados:

```powershell
git diff
git diff --staged
```

Modelo consolidado:

```text
git diff
→ compara staging area com working tree
→ mostra alterações ainda não staged

git diff --staged
→ compara último commit com staging area
→ mostra o que está preparado para o próximo commit
```

No laboratório:

```text
git diff --staged
→ mostrava a primeira alteração

git diff
→ mostrava a segunda alteração
```

Esse experimento foi compreendido corretamente pelo aluno.

---

# 12. Segundo commit

Foi executado, SEM adicionar novamente a versão C:

```powershell
git commit -m "docs: adiciona linha de laboratório Git"
```

Resultado:

```text
[master af8bc81] docs: adiciona linha de laboratório Git
1 file changed, 2 insertions(+)
```

Depois:

```powershell
git log --oneline
```

mostrou:

```text
af8bc81 (HEAD -> master) docs: adiciona linha de laboratório Git
75fd660 docs: adicionar README inicial
```

O laboratório provou que:

```text
commit
→ registra o estado staged

commit
≠
registrar automaticamente toda alteração existente no working tree
```

A segunda alteração permaneceu como:

```text
modified: README.md
```

---

# 13. Primeiro rollback seguro — `git restore`

A segunda alteração do README estava somente no working tree.

O aluno identificou corretamente que, para descartá-la sem alterar histórico, a camada afetada deveria ser:

```text
WORKING TREE
```

Foi executado:

```powershell
git restore .\README.md
```

Depois:

```powershell
git status
git diff
```

Resultado:

- `README.md` deixou de aparecer como `modified`;
- `git diff` não retornou diferenças para ele;
- os demais arquivos continuaram `Untracked`.

Modelo consolidado:

```text
git restore <arquivo>
→ atua no working tree
→ descarta alteração local não staged
→ não apaga commits existentes
```

Regra de segurança:

```text
git restore <arquivo>
→ pode perder alteração local
→ observar com git status/git diff antes de executar
```

---

# 14. Estado exato do repositório ao encerrar

Histórico conhecido:

```text
af8bc81 (HEAD -> master) docs: adiciona linha de laboratório Git
75fd660 docs: adicionar README inicial
```

`README.md`:

```text
tracked
sem alteração local pendente após git restore
```

Staging area:

```text
sem nova alteração preparada
```

Outros arquivos/pastas continuam `Untracked`, incluindo:

```text
00_MASTER_CONTEXT.md
01_SYSTEM_INSTRUCTIONS.md
02_LEARNING_PROTOCOL.md
03_CURRICULUM.md
04_POWERSHELL_GIT_GITHUB.md
05_AI_FIRST_ENGINEERING.md
06_SKILLS_CATALOG.md
07_AGENTS_CATALOG.md
08_PROMPT_LIBRARY.md
09_SOURCE_POLICY.md
10_PROGRESS_LEDGER.md
agents/
context/
knowledge/
laboratorio-powershell/
prompts/
skills/
```

Não adicionar esses arquivos automaticamente.

---

# 15. Warning observado — LF / CRLF

Durante `git diff` e `git add` apareceu:

```text
warning: in the working copy of 'README.md',
LF will be replaced by CRLF the next time Git touches it
```

Também houve representação estranha de caracteres acentuados em algumas saídas do terminal, por exemplo:

```text
laborat<F3>rio
```

e em uma saída de commit houve representação visual incorreta, enquanto `git log` posteriormente exibiu a mensagem corretamente.

Foi explicado que são camadas distintas:

```text
Git state
→ tracked / modified / staged

Line endings
→ LF / CRLF

Encoding
→ representação/exibição de caracteres
```

NÃO alterar `core.autocrlf` ou configurações de encoding automaticamente na retomada.

Investigar quando pedagogicamente apropriado, sem desviar do fundamento atual.

---

# MODELO MENTAL ATUAL CONSOLIDADO

O aluno já demonstrou entendimento deste fluxo:

```text
FILESYSTEM
↓
WORKING TREE
↓
git add
↓
STAGING AREA
↓
git commit
↓
COMMIT
↓
HISTÓRICO
```

Também entende:

```text
git status
→ estado

git diff
→ alteração não staged

git diff --staged
→ alteração preparada para commit
```

E:

```text
git restore <arquivo>
→ descarta mudança não staged no working tree
```

---

# PONTO EXATO PARA RETOMADA

A última orientação dada foi:

> O próximo passo natural é aprender o movimento inverso da staging area: tirar algo do staging sem perder a alteração do arquivo.

Introduzir agora:

```powershell
git restore --staged <arquivo>
```

Objetivo pedagógico imediato:

```text
DESCARTAR ALTERAÇÃO
≠
TIRAR DO STAGING
```

A nova conversa deve começar diretamente desse ponto.

Sugestão de laboratório:

1. criar uma alteração controlada no `README.md`;
2. observar com `git status` e `git diff`;
3. executar `git add .\README.md`;
4. validar com `git status` e `git diff --staged`;
5. explicar que a alteração está staged;
6. executar:

```powershell
git restore --staged .\README.md
```

7. validar que:
   - a alteração NÃO foi perdida;
   - saiu da staging area;
   - voltou a aparecer como mudança não staged no working tree;
8. comparar conceitualmente:

```text
git restore README.md
→ descarta mudança do working tree

git restore --staged README.md
→ remove da staging area
→ preserva mudança no working tree
```

Não executar automaticamente o laboratório; conduzir passo a passo.

---

# REGRAS PEDAGÓGICAS PARA CONTINUAR MISSÃO 002

Continuar usando:

```text
CONCEITO
↓
DEMO
↓
LAB
↓
ERRO INTENCIONAL
↓
DEBUG
↓
DESAFIO
↓
VALIDAÇÃO
```

Para cada comando Git explicar:

```text
O QUE É
POR QUE EXISTE
O QUE O COMANDO FAZ
O QUE MUDA
COMO VALIDAR
RISCO
ROLLBACK / RECUPERAÇÃO
```

Antes de alterar estado:

```text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

Não fazer automaticamente:

- commit;
- push;
- merge;
- rebase;
- reset destrutivo;
- remoção de trabalho;
- operações remotas;
- ações destrutivas.

Commit só deve ocorrer como parte explícita e explicada do laboratório.

---

# ROADMAP — NÃO AVANÇAR AINDA

Sequência oficial:

```text
MISSÃO 001 — Terminal e PowerShell ✅
↓
MISSÃO 002 — Git Foundations ← EM ANDAMENTO
↓
MISSÃO 003 — GitHub
↓
MISSÃO 004 — AI Coding Tools Foundations
├── Codex
└── Claude Code
```

Prioridade atual:

```text
Git LOCAL
```

Ainda não iniciar:

```text
GitHub
remote
push
Pull Request
Codex
Claude Code
```

---

# INSTRUÇÃO DIRETA PARA A NOVA CONVERSA

Atue como Software Engineer AI-First Mentor.

Responda em Português-Brasil.

Reconheça brevemente o ponto de continuidade e prossiga diretamente com:

```text
git restore --staged <arquivo>
```

Comece pela diferença conceitual:

```text
DESCARTAR UMA ALTERAÇÃO
versus
RETIRAR UMA ALTERAÇÃO DA STAGING AREA
```

Depois conduza um laboratório seguro usando `README.md`.

Não reinicie a MISSÃO 002.

Não repita fundamentos já comprovados, salvo microrevisão necessária.

Continue avaliando entendimento pelas explicações do aluno, não por memorização de comandos.

Princípio:

```text
APRENDER
↓
EXECUTAR
↓
OBSERVAR
↓
EXPLICAR
↓
REPETIR SEM AJUDA
```
