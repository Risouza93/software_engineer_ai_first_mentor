# PROGRESS LEDGER

## Perfil de evolução

### Git/GitHub
Nível atual: **N2 forte — executa fluxo Git/GitHub guiado; entrando em N3.**

### PowerShell
Nível atual: **N2 forte — em transição para N3.**

### AI Coding Tools — Codex
Nível atual: **N2 forte — Codex Foundations concluído de forma guiada, com debugging real e validação por evidências.**

### AI Coding Tools — Claude Code
Nível atual: **não avaliado / não iniciado.**

### Leitura de código
Nível atual: preencher

### JavaScript
Nível atual: preencher

### TypeScript
Nível atual: preencher

### Python
Nível atual: preencher

### APIs
Nível atual: preencher

### SQL/PostgreSQL
Nível atual: preencher

### Containers/Podman
Nível atual: preencher

### Playwright
Nível atual: preencher

### CI/CD
Nível atual: preencher

### Observabilidade
Nível atual: preencher

### Arquitetura
Nível atual: preencher

### AI Engineering
Nível atual: preencher

---

## Registro de missão

### MISSÃO 001 - PowerShell

### Data

13/08/2026

### Tema

Terminal, PowerShell e fundamentos operacionais de Engenharia de Software no Windows.

### Problema real

Construir uma base operacional sólida para utilizar terminal e PowerShell com segurança antes de avançar para Git, GitHub, programação, APIs, automação e ferramentas AI-First.
Aprender a observar o estado da máquina, manipular arquivos de forma controlada, trabalhar com objetos e pipelines, investigar processos, compreender PATH e variáveis de ambiente e diagnosticar problemas básicos de rede por evidências.

### Nível inicial

**N0/N1 — conhecimento inicial e compreensão básica.**

Conhecia alguns conceitos e ferramentas, mas ainda não havia demonstrado execução estruturada e diagnóstico sistemático utilizando PowerShell.

### Nível final

**N2 forte — Executo guiado, com sinais de N3 — Executo sozinho.**

Já consigo adaptar comandos e pipelines conhecidos para novos requisitos e realizar partes da investigação sem receita pronta.

Ainda preciso consolidar a construção autônoma da sintaxe e o diagnóstico independente para considerar N3 estabelecido.

---

## Objetivo

Construir fundamentos de Terminal e PowerShell necessários para as próximas etapas da formação, desenvolvendo o modelo:

```text
APRENDER
↓
EXECUTAR
↓
OBSERVAR
↓
EXPLICAR
↓
DEBUGAR POR EVIDÊNCIAS
↓
REPETIR COM MENOS AJUDA
```

Compreender também a cadeia:

```text
Aplicação
↓
Processo
↓
PID
↓
Porta
↓
TCP
↓
IP
↑
DNS
↑
Nome
↓
HTTP/HTTPS
```

---

## O que executei

* Naveguei pelo filesystem.
* Listei arquivos e diretórios.
* Trabalhei com caminhos absolutos e relativos.
* Criei e removi diretórios de laboratório.
* Criei arquivos.
* Gravei e li conteúdo.
* Trabalhei com objetos PowerShell.
* Inspecionei propriedades e métodos.
* Construí pipelines.
* Filtrei objetos com `Where-Object`.
* Selecionei propriedades com `Select-Object`.
* Investiguei processos.
* Trabalhei com PID.
* Criei e manipulei variáveis.
* Diferenciei `Int32` de `String`.
* Inspecionei variáveis de ambiente.
* Compreendi a função do `PATH`.
* Investiguei resolução de comandos.
* Inspecionei conexões TCP.
* Relacionei portas com PID e processo.
* Diferenciei estados `Bound`, `Listen` e `Established`.
* Investiguei `localhost` e loopback.
* Diferenciei IPv4 e IPv6.
* Consultei resolução de nomes.
* Identifiquei registros DNS `A` e `AAAA`.
* Fiz uma requisição HTTPS real.
* Inspecionei status code, headers e body.
* Testei conectividade TCP.
* Realizei debugging de uma porta sem serviço escutando.
* Adaptei um pipeline PowerShell para investigar autonomamente uma porta específica.

---

## Comandos

Principais comandos praticados:

```powershell
Get-Location
Get-ChildItem
Set-Location
New-Item
Remove-Item
Set-Content
Get-Content
Get-Member
Select-Object
Where-Object
Get-Process
Get-Command
Get-NetTCPConnection
ping
Resolve-DnsName
Invoke-WebRequest
Test-NetConnection
```

Também trabalhei com:

```powershell
$env:USERNAME
$env:USERPROFILE
$env:PATH
```

e pipelines como:

```powershell
Get-ChildItem |
    Where-Object { $_.Extension -eq ".log" } |
    Select-Object Name, Length
```

e:

```powershell
Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq 7768 } |
    Select-Object LocalAddress, LocalPort, State, OwningProcess
```

---

## Erros

### Caminho inexistente

Foi provocado um `Set-Location` para uma pasta inexistente.

Erros observados:

```text
ObjectNotFound
PathNotFound
```

### Comando inexistente

Foi executado um comando propositalmente inexistente.

Erro observado:

```text
CommandNotFoundException
```

### Construção incorreta de pipeline

Durante o desafio de rede, inicialmente tentei utilizar:

```powershell
Get-Process
```

para consultar propriedades pertencentes a conexões TCP.

Depois identifiquei que a fonte correta dos objetos era:

```powershell
Get-NetTCPConnection
```

Também precisei corrigir a composição entre `Get-NetTCPConnection`, `Where-Object` e `Select-Object`.

### Falha intencional de conectividade

Foi testada a porta:

```text
localhost:54321
```

Resultado:

```text
PingSucceeded    : True
TcpTestSucceeded : False
```

---

## Como diagnostiquei

Utilizei o modelo:

```text
SINTOMA
↓
EVIDÊNCIA
↓
HIPÓTESE
↓
TESTE
↓
CONCLUSÃO
↓
CORREÇÃO
```

No teste de conectividade:

**Sintoma:** conexão TCP com `localhost:54321` falhou.

**Evidência 1:**

```text
PingSucceeded = True
```

O host local/loopback estava acessível.

**Evidência 2:**

```text
TcpTestSucceeded = False
```

A conexão TCP com a porta `54321` não foi estabelecida.

**Hipótese:** não existia serviço TCP escutando nessa porta.

**Teste:**

```powershell
Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq 54321 } |
    Select-Object LocalAddress, LocalPort, State, OwningProcess
```

**Resultado:** nenhum endpoint foi retornado.

**Conclusão:** as evidências eram consistentes com a ausência de um serviço TCP escutando na porta `54321` naquele momento.

Evitei concluir sem evidência que o problema era "a rede", "o firewall" ou outro componente específico.

---

## Evidências

Consegui:

* adaptar autonomamente um pipeline de `.txt` para `.log`;
* utilizar objetos e propriedades no pipeline;
* relacionar `OwningProcess` com PID;
* relacionar PID com processo;
* identificar processos reais associados a conexões TCP;
* identificar o Spotify pelo PID `17316`;
* observar a porta local `7768` nos estados `Listen` e `Established`;
* identificar `127.0.0.1` como loopback IPv4;
* observar `::1` como loopback IPv6;
* resolver `localhost` para IPv4 e IPv6;
* resolver um domínio real com `Resolve-DnsName`;
* distinguir registros `A` e `AAAA`;
* compreender que mudança de IP não significa automaticamente falha;
* realizar uma requisição HTTPS;
* receber `HTTP 200 OK`;
* inspecionar headers HTTP;
* identificar `Content-Type: text/html`;
* compreender que body não significa necessariamente JSON;
* distinguir HTTP request de HTTP response;
* investigar uma falha TCP por camadas;
* construir um pipeline para localizar uma porta sem receber a solução completa pronta.

---

## O que consigo explicar agora

Consigo explicar com minhas palavras:

* o que é terminal;
* o papel do PowerShell;
* diretório atual;
* caminho absoluto e relativo;
* filesystem;
* arquivos e diretórios;
* comandos de leitura versus comandos que alteram estado;
* objeto PowerShell;
* propriedade;
* pipeline;
* `$_` como objeto atual;
* `Where-Object`;
* `Select-Object`;
* variável;
* diferença entre número e string;
* variável de ambiente;
* finalidade do `PATH`;
* diferença entre `PATH` e `Get-Command`;
* processo;
* PID;
* porta;
* conexão TCP;
* diferença entre `Listen` e `Established`;
* localhost;
* loopback;
* IPv4 e IPv6 em nível introdutório;
* resolução de nomes;
* DNS em nível introdutório;
* registros `A` e `AAAA`;
* TTL em nível introdutório;
* relação entre nome e endereço IP;
* HTTP request;
* HTTP response;
* status code;
* headers;
* body;
* relação básica entre HTTP e HTTPS;
* porta padrão `443` para HTTPS;
* debugging orientado a evidências.

Também consigo interpretar em nível introdutório:

```text
https://example.com
↓
host
↓
DNS
↓
IP
↓
porta
↓
TCP
↓
TLS
↓
HTTP Request
↓
HTTP Response
↓
Status + Headers + Body
```

---

## O que ainda não domino

* Sintaxe PowerShell sem consulta em todos os casos.
* Construção de pipelines mais complexos.
* Scripts PowerShell.
* Funções PowerShell.
* Tratamento de erros em scripts.
* Administração avançada de processos.
* Administração de rede.
* TCP/IP em profundidade.
* IPv4 e IPv6 em profundidade.
* DNS em profundidade.
* TLS em profundidade.
* HTTP em profundidade.
* Métodos HTTP em profundidade.
* Headers e cache HTTP em profundidade.
* APIs.
* Debugging de rede de forma totalmente autônoma.
* Automação dos diagnósticos realizados manualmente.

Não preciso decorar todos os comandos. Preciso saber identificar o problema, encontrar a ferramenta adequada, compreender o comando, executá-lo com segurança e validar sua saída.

---

## Próxima missão

**MISSÃO 002 — Git Foundations**

Objetivo inicial:

```text
problema que Git resolve
↓
repositório
↓
working tree
↓
estado
↓
staging
↓
commit
↓
histórico
↓
diff
↓
recuperação
```

Princípio operacional:

```text
ANTES DE ALTERAR ESTADO
↓
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

GitHub, push, Pull Request e automações remotas serão introduzidos somente após construir os fundamentos do Git local.

## Registro de missão

### MISSÃO 002 — Git Foundations

Data: 13/08/2026  
Tema: Git local — repositório, estados, staging, commits, histórico, restore, HEAD, branches e merge simples.  
Problema real: construir domínio seguro do ciclo local do Git antes de introduzir GitHub e operações remotas.  
Nível inicial: fundamentos Git ainda em construção.  
Nível final: N2 forte, entrando em N3 em Git local.

#### Objetivo

Entender e executar o fluxo fundamental do Git local, distinguindo filesystem, Working Tree, Staging Area, commits, histórico e referências.

#### O que executei

- inicializei e inspecionei um repositório Git local;
- diferenciei arquivos untracked, tracked, modified e staged;
- preparei arquivos seletivamente com `git add`;
- configurei e validei identidade Git;
- criei commits;
- inspecionei histórico e conteúdo de commits;
- comparei Working Tree, Staging Area e último commit;
- descartei alteração não staged com `git restore`;
- retirei alteração do staging preservando o Working Tree com `git restore --staged`;
- entendi HEAD e branch como referências distintas de commits;
- criei e troquei branches;
- criei commit em uma branch separada;
- visualizei branches e histórico com grafo;
- realizei merge simples/fast-forward;
- trabalhei com remoção de branch integrada;
- renomeei a branch principal de `master` para `main`;
- aprendi a sair do pager do Git com `q`.

#### Comandos

```powershell
git status
git init
git add .\README.md
git config ...
git commit -m "<MENSAGEM>"
git log --oneline
git log --oneline --decorate --graph --all
git diff
git diff --staged
git restore .\README.md
git restore --staged .\README.md
git show <HASH>
git show HEAD
git branch
git switch -c <BRANCH>
git switch <BRANCH>
git merge <BRANCH>
git branch -d <BRANCH>
git branch -m master main
```

#### Erros / situações encontradas

- `fatal: not a git repository` antes do `git init`;
- warning relacionado a LF/CRLF;
- representação inconsistente de caracteres acentuados no terminal/diff;
- pager do Git aparentando prender o terminal;
- `\ No newline at end of file` observado no diff.

#### Como diagnostiquei

Usei principalmente:

```text
git status
→ estado

git diff
→ mudanças não staged

git diff --staged
→ mudanças staged

git log / git show
→ histórico e conteúdo registrado
```

Separei problemas de estado Git de line endings e encoding.

#### Evidências

Histórico construído durante a missão incluiu:

```text
75fd660 docs: adicionar README inicial
af8bc81 docs: adiciona linha de laboratório Git
89073b9 docs: adiciona laboratorio de branch
```

Foi observado o estado:

```text
89073b9 (HEAD -> master, laboratorio-branch)
```

após o merge simples/fast-forward.

Ao final, a branch principal foi renomeada:

```text
master → main
```

#### O que consigo explicar agora

- diferença entre Git e filesystem;
- Working Tree, Staging Area, Commit e Histórico;
- untracked, tracked, modified e staged;
- diferença entre `git diff` e `git diff --staged`;
- diferença entre descartar alteração e retirar do staging;
- por que commit registra o estado staged;
- commit versus branch versus HEAD;
- por que uma branch pode avançar sem mover outra;
- funcionamento conceitual de merge simples/fast-forward;
- que remover uma branch integrada remove a referência, não duplica/apaga o commit integrado;
- como inspecionar histórico e commits.

#### O que ainda não domino / não foi praticado

- GitHub e repositórios remotos;
- `remote`, `origin`, `fetch`, `pull`, `push` e `clone`;
- Pull Requests;
- autenticação GitHub;
- merge divergente na prática;
- conflitos e resolução;
- rebase;
- operações avançadas de recuperação/histórico.

#### Próxima missão

```text
MISSÃO 003 — GitHub
```

Objetivo inicial:

```text
Git local
↓
remote
↓
GitHub
```

Conectar conscientemente o repositório local existente a um repositório remoto e aprender o fluxo remoto sem perder rastreabilidade e segurança.

### MISSÃO 003 — GitHub

Data: 14/08/2026  
Tema: GitHub, fluxo remoto, feature branch e Pull Request  
Problema real: conectar o repositório local de formação ao GitHub e executar um fluxo profissional completo de mudança até integração na `main`.  
Nível inicial: Git local N2 forte; GitHub remoto ainda em consolidação.  
Nível final: Git/GitHub N2 forte, entrando em N3. O fluxo foi executado de forma guiada; autonomia N3 ainda deverá ser comprovada sem receita pronta.

#### Objetivo

Construir e praticar:

```text
repositório local
↕
GitHub
↓
feature branch
↓
Pull Request
↓
review
↓
merge
↓
sincronização local
```

#### O que executei

- validei o repositório local e a `main`;
- configurei o remote `origin`;
- publiquei a `main` no GitHub;
- pratiquei `fetch`, `pull` e fast-forward remoto;
- clonei o repositório e validei o `origin` criado pelo clone;
- removi o clone temporário;
- criei `feature/github-pr-lab`;
- fiz uma alteração controlada no `README.md`;
- revisei o diff antes e depois do staging;
- criei commit na feature branch;
- publiquei a feature branch com upstream;
- criei o primeiro Pull Request;
- validei `base: main` e `compare: feature/github-pr-lab`;
- revisei o diff do PR;
- relacionei mudança → impacto → risco → validação;
- realizei merge remoto conscientemente;
- atualizei a `main` local;
- removi a feature branch local;
- removi a feature branch remota;
- confirmei no GitHub que o histórico integrado permaneceu preservado.

#### Comandos

```powershell
git status
git branch
git remote -v
git remote add origin <URL_HTTPS_DO_REPOSITORIO>
git push -u origin main
git push
git branch -vv
git fetch
git fetch origin
git pull
git clone <URL_HTTPS_DO_REPOSITORIO> software_engineer_ai_first_mentor_clone

git switch -c feature/github-pr-lab
git diff
git add .\README.md
git diff --staged
git commit -m "docs: adiciona registro do laboratorio de Pull Request"
git push -u origin feature/github-pr-lab

git switch main
git pull
git branch -d feature/github-pr-lab
git push origin --delete feature/github-pr-lab
```

#### Erros

Não houve erro técnico relevante no fluxo final de feature branch → Pull Request → merge.

Durante a leitura do PR, o fluxo de aprovação formal não apareceu para o próprio autor. O review técnico foi realizado pela análise do diff, risco e validação.

#### Como diagnostiquei

Foi mantida a regra:

```text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

No Pull Request:

```text
intenção
↓
arquivos
↓
diff
↓
impacto
↓
risco
↓
validação
↓
decisão
```

#### Evidências

- `main` publicada no GitHub;
- remote `origin` configurado;
- `fetch` e `pull` praticados;
- clone realizado e removido;
- `feature/github-pr-lab` publicada;
- primeiro Pull Request criado;
- diff continha somente a alteração planejada no `README.md`;
- risco classificado como baixo por ser alteração documental;
- merge remoto concluído;
- `main` local atualizada;
- branch local removida com `git branch -d`;
- branch remota removida com `git push origin --delete`;
- histórico da alteração confirmado no GitHub após remoção da branch.

#### O que consigo explicar agora

```text
Git ≠ GitHub
local ≠ remoto
origin ≠ origin/main ≠ main
fetch ≠ pull
clone ≠ init

branch local ↔ branch remota
upstream/tracking
feature branch
base branch
compare branch
Pull Request
diff de PR
review orientado a risco
merge remoto
sincronização da main local
remoção de branch local vs remota
branch removida ≠ histórico integrado removido
```

Ponte com Quality Engineering:

```text
mudança
→ comportamento/impacto
→ risco
→ teste/validação
→ evidência
```

#### O que ainda não domino

```text
Git/GitHub N3 autônomo
branch protection
merge divergente
conflitos
rebase
review real de PR de outra pessoa
diagnóstico de falhas Git/GitHub mais complexas
```

#### Próxima missão

```text
MISSÃO 004 — AI Coding Tools Foundations
├── Codex
└── Claude Code
```

Sequência inicial:

```text
Codex
↓
documentação oficial atual
↓
pré-requisitos
↓
instalação
↓
autenticação
↓
primeira tarefa somente leitura
↓
alteração controlada
↓
git diff
↓
testes/validação
```

Regra de autonomia:

```text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```

## MISSÃO 004 — AI Coding Tools Foundations — Parte A: Codex

### Data

14/08/2026

### Tema

Codex Foundations — coding agent local, sandbox, permissões, sessão, contexto, tarefas somente leitura, alterações controladas, Git como evidência, AI review, continuidade de sessão e debugging de PATH.

### Problema real

Aprender a utilizar um coding agent com autonomia progressiva e rastreável, sem tratar a saída da IA como fonte de verdade e sem delegar responsabilidade humana.

Também foi resolvido um problema real em que o executável do Codex existia e funcionava, mas o comando `codex` não era resolvido pelo PowerShell por causa do PATH da sessão.

### Nível inicial

**N0/N1 específico em Codex CLI.**

O usuário já possuía base N2 forte em PowerShell/Git e fluxo GitHub guiado, mas ainda não havia consolidado operação consciente de coding agents locais.

### Nível atual

**N2 forte — executa Codex Foundations de forma guiada, compreende os guardrails e realizou debugging real por evidências.**

Há sinais úteis de progressão, especialmente na explicação de que capacidade técnica não elimina revisão humana e na execução do diagnóstico de PATH, mas N3 não deve ser concedido sem desafio autônomo posterior.

---

## Objetivo

Construir o modelo:

```text
OBJETIVO
↓
CONTEXTO
↓
PERMISSÃO
↓
AGENTE
↓
ALTERAÇÃO
↓
GIT / EVIDÊNCIA
↓
REVIEW
↓
VALIDAÇÃO
↓
DECISÃO HUMANA
```

E preservar a progressão:

```text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```

---

## O que executei

- instalei e autentiquei o Codex standalone no Windows;
- trabalhei com Codex v0.147.0;
- identifiquei diretório de trabalho e sandbox;
- diferenciei sandbox de modo somente leitura;
- executei tarefa de análise somente leitura;
- validei ausência de mudanças com `git status --short`;
- autorizei alteração controlada somente no `README.md`;
- revisei a alteração com `git diff -- README.md`;
- inspecionei sessão com `/status`;
- inspecionei opções de permissão com `/permissions`;
- mantive `Workspace (Ask for approval)` sem ampliar para Full Access;
- distingui capacidade técnica, autorização operacional e revisão humana;
- explorei os slash commands disponíveis sem executar recursos sem necessidade;
- usei `/diff` e comparei com Git direto;
- usei `/review`;
- tratei finding da IA como hipótese;
- validei um finding real com PowerShell;
- autorizei uma correção limitada após confirmar o finding;
- validei a correção;
- compreendi sessão, contexto e context window;
- compreendi `/compact` sem executá-lo artificialmente;
- saí do Codex e retomei uma sessão salva;
- confirmei continuidade pelo mesmo Session ID;
- investiguei `CommandNotFoundException` ao executar `codex resume`;
- usei `Get-Command`, `where.exe`, busca de executável e caminho absoluto;
- distingui PATH persistente do usuário de `$env:PATH` de processo já aberto;
- corrigi o PATH do usuário para o diretório estável do Codex;
- validei `codex resume` após abrir novo processo;
- realizei commit/push por decisão humana ao final do trabalho documental.

---

## Comandos / recursos praticados

### Codex

```text
/status
/permissions
/diff
/review
/exit
/resume
```

### PowerShell / diagnóstico

```powershell
Get-Command codex -All
where.exe codex

Get-ChildItem `
  "$env:USERPROFILE\.codex", `
  "$env:LOCALAPPDATA", `
  "$env:APPDATA" `
  -Filter "codex*.exe" `
  -Recurse `
  -ErrorAction SilentlyContinue |
  Select-Object FullName

Get-ChildItem "$env:LOCALAPPDATA\Programs\OpenAI\Codex\bin"

[Environment]::GetEnvironmentVariable("Path", "User") -split ";" |
Where-Object { $_ -like "*OpenAI*Codex*" }

$env:PATH -split ";" |
Where-Object { $_ -like "*OpenAI*Codex*" }

Get-ChildItem .\context\chat_history\*MISSAO_004* |
Select-Object Name

Select-String `
  -Path .\context\chat_history\CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md `
  -Pattern "CONTEXTO.*MISSAO_004"
```

### Git

```powershell
git status --short
git diff -- README.md
git add .
git commit -m "Correções no contexto"
git push
```

---

## Erros / situações encontradas

### Warning LF / CRLF

Foi observado warning indicando conversão futura de LF para CRLF.

Tratamento: não alterar configuração nesta missão, pois line endings não eram o objetivo do laboratório.

### Finding de AI review

`/review` apontou referências internas para arquivos inexistentes/renomeados.

O finding não foi aceito automaticamente.

Validação independente confirmou:

```text
nomes reais no filesystem
≠
referências antigas dentro do documento
```

Classificação pedagógica: **verdadeiro positivo confirmado por evidência**.

### `codex` não reconhecido

Sintoma:

```text
CommandNotFoundException
```

O executável existia e funcionava por caminho absoluto.

Causa confirmada:

```text
diretório estável do Codex não estava disponível no PATH do processo PowerShell utilizado
```

Também foi observado que atualizar o PATH persistente não atualiza retroativamente `$env:PATH` de processos já abertos.

---

## Como diagnostiquei

Fluxo aplicado:

```text
SINTOMA
↓
CAMADA
↓
EVIDÊNCIA
↓
HIPÓTESE
↓
TESTE
↓
CAUSA
↓
CORREÇÃO
↓
VALIDAÇÃO
```

Para o PATH:

```text
codex resume falhou
↓
Get-Command / where.exe não localizaram
↓
busca encontrou codex.exe
↓
execução absoluta funcionou
↓
PATH persistente e PATH da sessão foram comparados
↓
diretório estável foi adicionado
↓
novo processo herdou configuração
↓
codex resume funcionou
```

---

## Evidências

- tarefa somente leitura validada por `git status --short`;
- alteração do README revisada por Git;
- `/diff` coincidiu com o diff relevante observado diretamente;
- `/review` encontrou um finding posteriormente confirmado;
- nomes reais dos artefatos foram confirmados com `Get-ChildItem`;
- referências internas foram verificadas com `Select-String`;
- correção foi novamente validada;
- Codex foi localizado em diretório versionado e em diretório estável;
- execução por caminho absoluto provou que a instalação estava funcional;
- PATH persistente foi comparado com PATH do processo;
- `codex resume` funcionou após correção;
- a sessão retomada apresentou o mesmo Session ID:
  `01a00095-7351-7c63-ba1c-45e608fdf0db`;
- commit observado no encerramento: `72ab9b3`;
- usuário informou push concluído.

---

## O que consigo explicar agora

- coding agent versus mentor;
- coding agent versus Git;
- sandbox versus somente leitura;
- workspace e permissões;
- capacidade técnica versus autorização operacional;
- por que revisão humana continua necessária;
- sessão versus filesystem versus Git versus contexto do modelo;
- context window em nível introdutório;
- finalidade de `/status`;
- finalidade de `/permissions`;
- diferença entre `/diff` e Git direto;
- `/review` como análise, não prova;
- finding de IA como hipótese;
- autonomia com escopo;
- Git como guardrail/evidência;
- continuidade com `resume`;
- diferença entre sair e apagar uma sessão;
- resolução de comandos pelo PowerShell;
- PATH persistente versus PATH do processo atual;
- por que não se deve ampliar permissões sem necessidade.

---

## O que ainda não tratar como dominado

- Codex N3 autônomo;
- execução autônoma ampla;
- Full Access;
- bypass de controles;
- skills do Codex em profundidade;
- hooks;
- MCP;
- plugins;
- subagents;
- memories;
- configuração avançada;
- automação avançada com Codex;
- Claude Code;
- comparação Codex × Claude Code.

---

## Claude Code — dependência externa

A Parte B da MISSÃO 004 foi **adiada**, não concluída.

Motivo:

```text
licença ainda não liberada pela empresa
+
Claude CLI ainda não instalado/configurado pela infraestrutura
```

Quando liberado:

```text
retomar MISSÃO 004 — Parte B
↓
validar documentação oficial atual
↓
validar instalação/configuração corporativa
↓
autenticação
↓
permissões
↓
somente leitura
↓
alteração controlada
↓
Git diff/status
↓
validação
↓
comparação Codex × Claude Code
```

Não contornar controles corporativos.

---

## Próxima missão disponível

**MISSÃO 005 — Branching**

A formação pode avançar para Branching enquanto Claude Code permanece bloqueado.

Quando a dependência corporativa for liberada, retomar Claude Code em ponto seguro e completar a MISSÃO 004 antes de registrar a comparação final.

---

## Retrospectiva

Principal aprendizado:

```text
IA pode ler
IA pode editar
IA pode revisar
IA pode encontrar problemas

MAS

capacidade
≠
autorização
≠
correção
≠
aceitação
```

Modelo consolidado:

```text
IA auxilia
↓
ferramentas produzem evidência
↓
humano valida
↓
humano decide
```


---

## Atualização complementar — PowerShell / histórico persistente

### Tema

PSReadLine, histórico persistente e busca por prefixo com PageUp/PageDown.

### Objetivo

Melhorar a ergonomia do terminal para recuperar rapidamente comandos já usados
durante a formação e no trabalho diário.

### Evidências observadas

Módulo disponível:

```text
PSReadLine 2.0.0
```

Histórico persistente:

```text
C:\Users\richard.feitosa\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
```

Configuração:

```text
HistorySaveStyle: SaveIncrementally
```

### O que executei

- inspecionei a versão e o caminho do PSReadLine;
- identifiquei o arquivo real de histórico persistente;
- confirmei salvamento incremental;
- inspecionei key handlers relacionados a histórico;
- diferenciei navegação geral de busca por prefixo;
- configurei `PageUp` para `HistorySearchBackward`;
- configurei `PageDown` para `HistorySearchForward`;
- compreendi que a configuração pode ser persistida via `$PROFILE`;
- aprendi a inspecionar o conteúdo do histórico com `Get-Content`.

### Comandos

```powershell
Get-Module PSReadLine -ListAvailable |
Select-Object Name, Version, Path

Get-PSReadLineOption |
Select-Object HistorySavePath, HistorySaveStyle

Get-PSReadLineKeyHandler |
Where-Object { $_.Function -match "History" } |
Select-Object Key, Function

Set-PSReadLineKeyHandler -Key PageUp -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key PageDown -Function HistorySearchForward

$PROFILE
Test-Path $PROFILE

Get-PSReadLineKeyHandler |
Where-Object { $_.Key -in @("PageUp", "PageDown") } |
Select-Object Key, Function

Get-Content (Get-PSReadLineOption).HistorySavePath -Tail 20
```

### Conceitos consolidados

```text
PSReadLine
histórico persistente
HistorySavePath
SaveIncrementally
HistorySearchBackward
HistorySearchForward
PowerShell Profile
configuração de sessão
configuração persistente
```

Separação importante:

```text
ConsoleHost_history.txt
→ histórico dos comandos

$PROFILE
→ configuração carregada ao iniciar PowerShell
```

### Impacto no nível

Reforça o nível atual de PowerShell:

```text
N2 forte — em transição para N3
```

Não altera automaticamente o nível formal, mas adiciona evidência de uso mais
consciente e produtivo do ambiente.

---

## Próximo passo atualizado

```text
MISSÃO 005 — Branching
```

Claude Code Foundations continua adiado por dependência corporativa e deverá ser
retomado quando licença e CLI/configuração estiverem disponíveis.