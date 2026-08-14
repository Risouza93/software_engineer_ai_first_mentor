# PROGRESS LEDGER

## Perfil de evolução

### Git/GitHub
Nível atual: N2 forte — executa fluxo Git/GitHub guiado; entrando em N3

### PowerShell
Nível atual: N2 forte — em transição para N3

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