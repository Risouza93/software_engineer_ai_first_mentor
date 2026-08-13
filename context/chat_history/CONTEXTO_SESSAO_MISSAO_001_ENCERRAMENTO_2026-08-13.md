# CONTEXTO DE CONTINUIDADE — ENCERRAMENTO MISSÃO 001 / INÍCIO MISSÃO 002

Data de encerramento desta sessão: 13/08/2026  
Formação: Software Engineer AI-First Mentor  
Missão concluída: MISSÃO 001 — Terminal e PowerShell  
Próxima missão: MISSÃO 002 — Git Foundations  
Status: MISSÃO 001 CONCLUÍDA / MISSÃO 002 PRONTA PARA INICIAR

---

## Objetivo deste arquivo

Permitir que uma nova sessão continue exatamente do ponto atual, sem reiniciar conteúdos já concluídos e sem pular os fundamentos definidos no roadmap oficial.

Na próxima sessão:

1. reconhecer que a MISSÃO 001 foi concluída;
2. não repetir seus laboratórios, salvo revisão pontual necessária;
3. iniciar diretamente a MISSÃO 002 — Git Foundations;
4. começar pelo problema que Git resolve e pelo modelo mental de Git local;
5. não avançar prematuramente para GitHub, push ou Pull Request.

---

# MISSÃO 001 — RESULTADO FINAL

## Tema

Terminal, PowerShell e fundamentos operacionais de Engenharia de Software no Windows.

## Status

CONCLUÍDA.

## Nível final avaliado

PowerShell: **N2 forte, em transição para N3**.

Interpretação:

- executa fluxos guiados com segurança;
- já adapta pipelines conhecidos para novos requisitos;
- demonstra autonomia pontual;
- consegue participar de debugging orientado a evidências;
- ainda precisa consolidar sintaxe e investigação totalmente independente antes de considerar N3 estabelecido.

---

# Conteúdo concluído

## Filesystem e navegação

Comandos praticados:

```powershell
Get-Location
Get-ChildItem
Set-Location
New-Item
Remove-Item
Set-Content
Get-Content
```

Conceitos:

- terminal;
- PowerShell;
- filesystem;
- diretório atual;
- caminho absoluto;
- caminho relativo;
- `.` e `..`;
- criação e remoção controlada;
- leitura versus alteração de estado;
- rollback;
- risco de comandos destrutivos.

Erro intencional estudado:

```text
ObjectNotFound
PathNotFound
```

---

## Objetos e pipeline

Comandos/construções praticados:

```powershell
Get-ChildItem | Get-Member
Get-ChildItem | Select-Object Name, Length
Get-ChildItem | Where-Object Extension -eq ".txt"
Get-ChildItem | Where-Object { $_.Extension -eq ".txt" } | Select-Object Name, Length
```

Desafio realizado com autonomia:

```powershell
Get-ChildItem | Where-Object { $_.Extension -eq ".log" } | Select-Object Name, Length
```

Modelo mental consolidado:

```text
OBTER
↓
FILTRAR
↓
SELECIONAR
```

Conceitos:

- objetos PowerShell;
- propriedades;
- métodos;
- pipeline;
- `$_` como objeto atual;
- `Where-Object`;
- `Select-Object`.

Ponto a continuar consolidando:

- distinguir com precisão variável, objeto e propriedade;
- construir pipelines novos sem apoio de sintaxe.

---

## Processos e PID

Comandos praticados:

```powershell
Get-Process
Get-Process -Id <PID>
Get-Process -Id <PID> | Select-Object ProcessName, Id, StartTime, Path
```

Conceitos:

- programa instalado versus processo em execução;
- PID = Process Identifier;
- processos com mesmo nome podem ter PIDs diferentes;
- PID não é identidade permanente;
- inspecionar antes de alterar.

`Stop-Process` NÃO foi utilizado.

---

## Variáveis e tipos

Exemplos praticados:

```powershell
$numero = 10
$texto = "10"
$idade = 30
$idade = $idade + 1
```

Tipos observados:

```text
System.Int32
System.String
```

Conceitos:

- variável;
- atribuição;
- número versus string;
- tipo influencia comportamento.

---

## Variáveis de ambiente, PATH e resolução de comandos

Comandos:

```powershell
$env:USERNAME
$env:USERPROFILE
$env:PATH

Get-Command git
Get-Command node
Get-Command code
```

Ferramentas previamente validadas:

- Git;
- Node;
- VS Code CLI.

Conceitos:

- variável normal versus variável de ambiente;
- PATH como lista de diretórios usada na resolução de executáveis;
- PATH e `Get-Command` não são a mesma coisa;
- não alterar PATH sem necessidade e validação.

Erro intencional:

```text
CommandNotFoundException
```

Regra aprendida:

```text
comando não encontrado
≠
prova automática de que ferramenta não está instalada
```

Investigar:

- nome;
- instalação;
- PATH;
- caminho;
- sessão/ambiente.

---

# Rede — conteúdo concluído

## Portas e TCP

Comando:

```powershell
Get-NetTCPConnection
```

Propriedades estudadas:

```text
LocalAddress
LocalPort
RemoteAddress
RemotePort
State
OwningProcess
```

Estados observados:

```text
Bound
Listen
Established
```

Modelo:

```text
Aplicação
↓
Processo
↓
PID
↓
Porta
↓
Conexão TCP
```

---

## Porta → PID → processo

Foram investigados processos reais da máquina.

Exemplo observado durante o laboratório:

```text
LocalPort: 7768
OwningProcess: 17316
ProcessName: Spotify
```

Pipeline construído pelo aluno após tentativa, correção e debugging:

```powershell
Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq 7768 } |
    Select-Object LocalAddress, LocalPort, State, OwningProcess
```

Resultado observado:

```text
127.0.0.1  7768  Listen       17316
127.0.0.1  7768  Established  17316
```

Esse exercício foi evidência importante de progressão N2 → N3.

---

## Localhost e loopback

Comando:

```powershell
ping localhost
```

Resultado observado:

```text
::1
```

Conceitos:

```text
127.0.0.1 → loopback IPv4
::1       → loopback IPv6
localhost → nome usado para referenciar o host local
```

Separação importante:

```text
localhost
≠
IP
≠
porta
```

---

## DNS

Comandos praticados:

```powershell
Resolve-DnsName localhost
Resolve-DnsName google.com
```

Para localhost foram observados:

```text
AAAA → ::1
A    → 127.0.0.1
```

Para `google.com` foram observados registros A e AAAA reais.

Conceitos:

```text
nome
↓
resolução DNS
↓
IP
```

Registros:

```text
A     → IPv4
AAAA  → IPv6
```

Também foi introduzido:

- TTL;
- cache em nível introdutório;
- mudança de IP não implica automaticamente falha.

O aluno explicou corretamente que serviços podem possuir múltiplas máquinas/endpoints e que um IP diferente não deve ser tratado automaticamente como problema.

---

# HTTP / HTTPS

Comando praticado:

```powershell
Invoke-WebRequest https://example.com
```

No ambiente atual houve aviso relacionado ao parsing do Windows PowerShell.

Foi utilizado posteriormente:

```powershell
$response = Invoke-WebRequest https://example.com -UseBasicParsing
```

Inspeção:

```powershell
$response.StatusCode
$response.Headers
```

Evidência:

```text
StatusCode = 200
```

Headers observados incluíram:

```text
Content-Type: text/html
Server: cloudflare
```

Conceitos introduzidos:

```text
HTTP Request
cliente → servidor

HTTP Response
servidor → cliente
```

Estrutura mental:

```text
HTTP Response
├── Status
├── Headers
└── Body
```

Correções pedagógicas realizadas:

- status code pertence à response;
- request e response podem possuir headers;
- body não significa necessariamente JSON;
- no laboratório, o body era HTML;
- `Content-Type` ajuda a indicar o tipo do conteúdo.

Famílias HTTP introduzidas:

```text
2xx → sucesso
3xx → redirecionamento
4xx → condição/erro relacionado à requisição/cliente
5xx → condição/erro no servidor
```

Modelo construído:

```text
https://example.com
↓
host
↓
DNS
↓
IP
↓
porta padrão 443
↓
TCP
↓
TLS
↓
HTTP Request
↓
HTTP Response
├── Status
├── Headers
└── Body
```

TLS foi apenas introduzido conceitualmente. Não aprofundar ainda sem necessidade.

---

# Erro intencional final — conectividade

Comando:

```powershell
Test-NetConnection localhost -Port 54321
```

Evidência:

```text
PingSucceeded    : True
TcpTestSucceeded : False
```

Depois foi executado:

```powershell
Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq 54321 } |
    Select-Object LocalAddress, LocalPort, State, OwningProcess
```

Resultado:

nenhum endpoint retornado.

Diagnóstico:

```text
SINTOMA
conexão TCP para localhost:54321 falhou

↓
EVIDÊNCIA
PingSucceeded = True

↓
EVIDÊNCIA
TcpTestSucceeded = False

↓
HIPÓTESE
não existe serviço TCP escutando na porta

↓
TESTE
Get-NetTCPConnection filtrado por LocalPort 54321

↓
RESULTADO
nenhum endpoint encontrado

↓
CONCLUSÃO
evidências consistentes com ausência de serviço TCP escutando
na porta 54321 naquele momento
```

Regra consolidada:

```text
host acessível
+
porta sem listener
=
conexão TCP pode falhar
```

Não concluir automaticamente:

- "a rede caiu";
- "é firewall";
- "é DNS";
- "é servidor";

sem evidências.

---

# Modelo de debugging consolidado

Usar:

```text
SINTOMA
↓
REPRODUÇÃO
↓
CAMADA
↓
EVIDÊNCIA
↓
HIPÓTESE
↓
TESTE
↓
CAUSA / CONCLUSÃO
↓
CORREÇÃO
↓
REGRESSÃO
```

Separar sempre:

```text
FATO
≠
HIPÓTESE
```

---

# Material de consulta criado

Foi criado durante a sessão:

```text
comandos_missao_002.md
```

Objetivo:

- evitar decorar comandos repetitivos;
- funcionar como cheat sheet operacional;
- conter templates com campos `<...>`;
- registrar comandos somente depois de aprendidos/praticados;
- continuar crescendo durante as próximas missões.

Regra pedagógica:

```text
não decorar sintaxe por decorar
↓
entender o problema
↓
identificar objeto/recurso
↓
escolher ferramenta
↓
consultar referência quando necessário
↓
executar
↓
validar
```

Na MISSÃO 002, acrescentar comandos Git ao cheat sheet somente depois de serem explicados e praticados.

---

# Progress Ledger

O usuário informou que o `10_PROGRESS_LEDGER.md` foi atualizado com sucesso após a retrospectiva da MISSÃO 001.

Registro acordado:

```text
MISSÃO 001 — Terminal e PowerShell
Status: concluída
PowerShell: N2 forte, em transição para N3
Próxima missão: MISSÃO 002 — Git Foundations
```

Não solicitar novamente o preenchimento do Progress Ledger no início da próxima sessão.

---

# PONTO EXATO PARA RETOMADA

## MISSÃO 002 — Git Foundations

A próxima sessão deve começar DIRETAMENTE aqui.

Não reiniciar PowerShell.

Não iniciar GitHub ainda.

Não começar por `git push`, Pull Request ou operações remotas.

Primeiro construir o problema que Git resolve e o modelo mental do Git local.

Sequência pedagógica inicial:

```text
Por que controle de versão existe?
↓
o que Git é
↓
repositório
↓
working tree
↓
estado
↓
staging area
↓
commit
↓
histórico
↓
diff
↓
recuperação segura
```

Depois evoluir conforme o roadmap.

---

# Regras para a MISSÃO 002

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

Antes de alterar estado Git:

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
- qualquer ação destrutiva.

Durante as fases iniciais, commit só deve ocorrer como parte explícita e explicada do laboratório.

---

# Objetivo pedagógico da MISSÃO 002

O aluno não deve decorar Git como lista de comandos.

Deve construir o modelo:

```text
ARQUIVOS NO DISCO
↓
WORKING TREE
↓
STAGING AREA
↓
COMMIT
↓
HISTÓRICO
```

E aprender a responder antes de executar:

```text
Onde estou?
↓
Qual é o estado do repositório?
↓
O que mudou?
↓
O que está staged?
↓
O que será registrado?
↓
Como valido?
↓
Como recupero se necessário?
```

A prioridade inicial é Git LOCAL.

GitHub será tratado posteriormente na MISSÃO 003.

---

# Conexão futura com AI Coding Tools

Roadmap oficial:

```text
MISSÃO 001 — Terminal e PowerShell ✅
↓
MISSÃO 002 — Git Foundations ← PRÓXIMO PONTO
↓
MISSÃO 003 — GitHub
↓
MISSÃO 004 — AI Coding Tools Foundations
├── Codex
└── Claude Code
```

Codex e Claude Code só devem ser introduzidos após os fundamentos necessários de Git e GitHub.

Regra de autonomia futura:

```text
LEITURA
>
ALTERAÇÃO CONTROLADA
>
EXECUÇÃO AUTÔNOMA
```

---

# Instrução direta para a próxima sessão

Atue como Software Engineer AI-First Mentor.

Responda em Português-Brasil.

Reconheça brevemente que a MISSÃO 001 está concluída e inicie:

# MISSÃO 002 — Git Foundations

Comece pela pergunta/conceito:

**"Qual problema o Git resolve?"**

Use ELI5, depois conceito técnico, exemplo profissional e primeiro laboratório seguro.

Não despeje uma lista de comandos.

Não presumir que saber executar `git` significa compreender Git.

O objetivo é construir modelo mental antes da memorização de sintaxe.

Continuar usando o princípio:

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
