# COMANDOS — MISSÃO 001 → PREPARAÇÃO PARA MISSÃO 002

> **Objetivo:** servir como referência operacional dos comandos aprendidos até agora, evitando decorar sintaxe repetitiva.
>
> **Como usar:** substitua os campos `<...>` pelos valores do seu contexto. Antes de comandos que alteram estado, confira o diretório atual e entenda o impacto.
>
> **Ambiente:** Windows + PowerShell

---

## 0. Modelo mental

```text
OBTER → FILTRAR → SELECIONAR
```

No PowerShell, os comandos frequentemente produzem **objetos**. O pipeline `|` envia esses objetos ao próximo comando.

- `$_` = objeto atual passando pelo pipeline.
- `.Propriedade` = propriedade daquele objeto.
- `-eq` = comparação "é igual a".

---

# 1. Diretório atual

## `Get-Location`

```powershell
Get-Location
```

**O que faz:** mostra o diretório atual do PowerShell.  
**Altera o sistema:** não.  
**Uso diário:** confirmar onde você está antes de criar, remover ou executar algo.  
**Rollback:** não necessário.

---

# 2. Listar arquivos e diretórios

## `Get-ChildItem`

```powershell
Get-ChildItem
```

**O que faz:** lista arquivos e diretórios da localização atual.  
**Altera o sistema:** não.

Com um caminho:

```powershell
Get-ChildItem "<CAMINHO>"
```

Exemplo de preenchimento:

```text
<CAMINHO> = C:\Dev\meu-projeto
```

---

# 3. Navegação

## `Set-Location`

Caminho configurável:

```powershell
Set-Location "<CAMINHO>"
```

Caminho relativo:

```powershell
Set-Location ".\<PASTA>"
```

Diretório pai:

```powershell
Set-Location ..
```

Diretório atual:

```powershell
Set-Location .
```

**O que faz:** muda o diretório atual da sessão.  
**Validação:**

```powershell
Get-Location
```

**Erro estudado:** `PathNotFound` / `ObjectNotFound` quando o caminho não existe.

---

# 4. Criar diretório

```powershell
New-Item -ItemType Directory -Name "<NOME_DA_PASTA>"
```

Campos:

```text
<NOME_DA_PASTA> = laboratorio-powershell
```

**O que faz:** cria um diretório.  
**Altera o sistema:** sim, filesystem.

**Validação:**

```powershell
Get-ChildItem
```

**Rollback:**

```powershell
Remove-Item ".\<NOME_DA_PASTA>"
```

> `Remove-Item` é destrutivo. Confirme o alvo antes de executar.

---

# 5. Criar arquivo

```powershell
New-Item -ItemType File -Name "<NOME_DO_ARQUIVO>"
```

Exemplo:

```text
<NOME_DO_ARQUIVO> = teste.txt
```

**Altera o sistema:** sim, cria arquivo.

---

# 6. Gravar conteúdo

```powershell
"<CONTEUDO>" | Set-Content ".\<ARQUIVO>"
```

Campos:

```text
<CONTEUDO> = Minha primeira linha no PowerShell
<ARQUIVO>  = teste.txt
```

**O que faz:** grava conteúdo no arquivo.  
**Atenção:** `Set-Content` pode substituir o conteúdo existente.

---

# 7. Ler arquivo

```powershell
Get-Content ".\<ARQUIVO>"
```

Campo:

```text
<ARQUIVO> = teste.txt
```

**O que faz:** lê o conteúdo.  
**Altera o sistema:** não.

---

# 8. Inspecionar objetos PowerShell

```powershell
Get-ChildItem | Get-Member
```

**O que faz:** mostra tipo, propriedades e métodos dos objetos recebidos pelo pipeline.

Evidência observada durante a missão:

```text
TypeName: System.IO.FileInfo
```

---

# 9. Selecionar propriedades

```powershell
Get-ChildItem | Select-Object Name, Length
```

Template:

```powershell
<COMANDO> | Select-Object <PROPRIEDADE_1>, <PROPRIEDADE_2>
```

**O que faz:** produz objetos contendo somente as propriedades escolhidas.

---

# 10. Filtrar objetos

Forma simples estudada:

```powershell
Get-ChildItem | Where-Object Extension -eq ".txt"
```

Forma reutilizável:

```powershell
<COMANDO> | Where-Object { $_.<PROPRIEDADE> -eq <VALOR> }
```

Exemplo:

```powershell
Get-ChildItem | Where-Object { $_.Extension -eq ".log" }
```

**Modelo mental:**

```text
$_            → objeto atual
.Extension    → propriedade
-eq           → igual a
".log"        → valor esperado
```

---

# 11. Pipeline completo

Template reutilizável:

```powershell
<COMANDO_PARA_OBTER> |
    Where-Object { $_.<PROPRIEDADE> -eq <VALOR> } |
    Select-Object <PROPRIEDADE_1>, <PROPRIEDADE_2>
```

Exemplo com arquivos:

```powershell
Get-ChildItem |
    Where-Object { $_.Extension -eq ".txt" } |
    Select-Object Name, Length
```

Exemplo com conexões TCP:

```powershell
Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq <PORTA> } |
    Select-Object LocalAddress, LocalPort, State, OwningProcess
```

---

# 12. Processos

## Listar processos

```powershell
Get-Process
```

**O que faz:** obtém os processos em execução.

## Investigar um PID

```powershell
Get-Process -Id <PID>
```

Com propriedades específicas:

```powershell
Get-Process -Id <PID> |
    Select-Object ProcessName, Id, StartTime, Path
```

Campos:

```text
<PID> = número do processo
```

## Investigar vários PIDs

```powershell
Get-Process -Id <PID_1>,<PID_2> |
    Select-Object ProcessName, Id, Path
```

**Regra:** PID identifica uma instância de processo naquele momento; não trate PID como identidade permanente.

> `Stop-Process` não foi utilizado na missão. Inspecionar antes de alterar.

---

# 13. Variáveis PowerShell

```powershell
<VARIAVEL> = <VALOR>
```

Exemplos estudados:

```powershell
$numero = 10
$texto = "10"
$idade = 30
$idade = $idade + 1
```

**Conceito:** número e string podem parecer semelhantes visualmente, mas possuem tipos e comportamentos diferentes.

Para inspecionar o tipo de um valor:

```powershell
$numero.GetType()
$texto.GetType()
```

Tipos observados:

```text
System.Int32
System.String
```

---

# 14. Variáveis de ambiente

```powershell
$env:USERNAME
$env:USERPROFILE
$env:PATH
```

**O que fazem:** consultam variáveis de ambiente da sessão/processo.

**Regra:** não alterar `PATH` sem necessidade e validação.

---

# 15. Descobrir qual comando será resolvido

```powershell
Get-Command <COMANDO>
```

Exemplos estudados:

```powershell
Get-Command git
Get-Command node
Get-Command code
```

Template:

```powershell
Get-Command "<NOME_DO_COMANDO>"
```

**Uso:** investigar se e como o PowerShell resolve um comando.

**Erro estudado:** `CommandNotFoundException`.

Um comando não encontrado **não prova sozinho** que a ferramenta não está instalada. Investigue nome, instalação, PATH, caminho e sessão.

---

# 16. Conexões TCP

```powershell
Get-NetTCPConnection
```

**O que faz:** inspeciona conexões/endpoints TCP conhecidos pelo Windows.  
**Altera o sistema:** não.

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
Bound       → endpoint associado a endereço/porta
Listen      → aguardando conexões
Established → conexão TCP estabelecida
```

---

# 17. Investigar uma porta

Template:

```powershell
Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq <PORTA> } |
    Select-Object LocalAddress, LocalPort, State, OwningProcess
```

Campo:

```text
<PORTA> = 7768
```

Depois, com o `OwningProcess` encontrado:

```powershell
Get-Process -Id <OWNING_PROCESS> |
    Select-Object ProcessName, Id, Path
```

**Modelo profissional:**

```text
porta
↓
OwningProcess
↓
PID
↓
processo
```

---

# 18. Localhost / loopback

```powershell
ping localhost
```

**O que faz:** resolve `localhost` e realiza teste de alcance usando ping.

Endereços observados:

```text
127.0.0.1 → loopback IPv4
::1       → loopback IPv6
```

**Conceito:**

```text
localhost ≠ endereço IP ≠ porta
```

---

# 19. Resolver nomes

```powershell
Resolve-DnsName <HOST>
```

Exemplos:

```powershell
Resolve-DnsName localhost
Resolve-DnsName google.com
```

Template:

```powershell
Resolve-DnsName "<DOMINIO>"
```

Campos:

```text
<DOMINIO> = example.com
```

Registros estudados:

```text
A     → IPv4
AAAA  → IPv6
```

**TTL:** tempo relacionado à validade/cache da informação DNS.

**Regra de debugging:** mudança de IP não significa automaticamente falha.

---

# 20. Requisição HTTP/HTTPS

No Windows PowerShell usado durante a missão:

```powershell
Invoke-WebRequest "https://<HOST>" -UseBasicParsing
```

Campo:

```text
<HOST> = example.com
```

**O que faz:** realiza uma requisição HTTP/HTTPS.  
**Altera configuração:** não; porém gera comunicação de rede externa.

Estrutura mental da resposta:

```text
HTTP Response
├── StatusCode
├── Headers
└── Body/Content
```

---

# 21. Guardar resposta HTTP em variável

```powershell
$response = Invoke-WebRequest "https://<HOST>" -UseBasicParsing
```

Depois:

```powershell
$response.StatusCode
$response.Headers
$response.Content
```

**O que faz:** mantém o objeto da resposta em `$response` para inspeção.

Exemplo observado:

```text
StatusCode: 200
Content-Type: text/html
```

**Importante:** body não significa necessariamente JSON. Pode ser HTML, JSON, texto, XML, bytes etc.

---

# 22. Testar conectividade TCP

```powershell
Test-NetConnection <HOST> -Port <PORTA>
```

Exemplo estudado:

```powershell
Test-NetConnection localhost -Port 54321
```

Campos editáveis:

```text
<HOST>  = localhost
<PORTA> = 54321
```

Propriedades importantes:

```text
PingSucceeded
TcpTestSucceeded
RemoteAddress
RemotePort
```

**Interpretação estudada:**

```text
PingSucceeded = True
TcpTestSucceeded = False
```

não significa simplesmente "a rede caiu".

Investigue por camada.

---

# 23. Diagnóstico de porta sem listener

Primeiro:

```powershell
Test-NetConnection <HOST> -Port <PORTA>
```

Depois, para uma porta local:

```powershell
Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq <PORTA> } |
    Select-Object LocalAddress, LocalPort, State, OwningProcess
```

Se houver PID:

```powershell
Get-Process -Id <PID> |
    Select-Object ProcessName, Id, Path
```

Modelo de investigação:

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

---

# 24. Relação completa construída na MISSÃO 001

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

HTTPS
↓
TCP / porta padrão 443
↓
TLS
↓
HTTP Request
↓
Servidor
↓
HTTP Response
├── Status
├── Headers
└── Body
```

---

# 25. Templates rápidos para o dia a dia

## Onde estou?

```powershell
Get-Location
```

## O que existe aqui?

```powershell
Get-ChildItem
```

## Ir para uma pasta

```powershell
Set-Location "<CAMINHO>"
```

## Procurar arquivos por extensão

```powershell
Get-ChildItem |
    Where-Object { $_.Extension -eq "<EXTENSAO>" } |
    Select-Object Name, Length
```

```text
<EXTENSAO> = .txt
```

## Investigar processo

```powershell
Get-Process -Id <PID> |
    Select-Object ProcessName, Id, StartTime, Path
```

## Investigar porta local

```powershell
Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq <PORTA> } |
    Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess
```

## Porta → processo

```powershell
$connection = Get-NetTCPConnection |
    Where-Object { $_.LocalPort -eq <PORTA> }

$connection |
    Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess

Get-Process -Id $connection.OwningProcess |
    Select-Object ProcessName, Id, Path
```

> Se houver múltiplas conexões/PIDs, a investigação precisa considerar essa multiplicidade.

## Resolver domínio

```powershell
Resolve-DnsName "<DOMINIO>"
```

## Testar host + porta

```powershell
Test-NetConnection "<HOST>" -Port <PORTA>
```

## Fazer requisição web e guardar resposta

```powershell
$response = Invoke-WebRequest "https://<HOST>" -UseBasicParsing
```

## Inspecionar resposta

```powershell
$response.StatusCode
$response.Headers
$response.Content
```

## Descobrir resolução de ferramenta/comando

```powershell
Get-Command "<COMANDO>"
```

---

# 26. Folha de variáveis — copie e preencha

```text
<CAMINHO>          =
<PASTA>            =
<NOME_DA_PASTA>    =
<NOME_DO_ARQUIVO>  =
<ARQUIVO>          =
<CONTEUDO>         =
<EXTENSAO>         =
<COMANDO>          =
<PROPRIEDADE>      =
<VALOR>            =
<PID>              =
<PID_1>            =
<PID_2>            =
<OWNING_PROCESS>   =
<PORTA>            =
<HOST>             =
<DOMINIO>          =
```

---

# 27. Regra operacional

Não é necessário decorar todos os comandos.

O objetivo é reconhecer:

```text
O QUE EU QUERO DESCOBRIR OU ALTERAR?
↓
QUAL OBJETO/RECURSO POSSUI ESSA INFORMAÇÃO?
↓
QUAL COMANDO O OBTÉM?
↓
PRECISO FILTRAR?
↓
QUAIS PROPRIEDADES PRECISO VER?
↓
COMO VALIDO?
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

Antes de diagnosticar:

```text
FATO ≠ HIPÓTESE

SINTOMA
↓
EVIDÊNCIA
↓
HIPÓTESE
↓
TESTE
↓
CONCLUSÃO
```

---

## Próxima etapa

**MISSÃO 002 — Git Foundations**

Este arquivo deve continuar evoluindo durante a formação: novos comandos Git podem ser acrescentados somente depois de serem aprendidos e praticados.
