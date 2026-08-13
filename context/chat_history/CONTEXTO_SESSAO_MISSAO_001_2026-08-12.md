# CONTEXTO DE CONTINUIDADE — MISSÃO 001

Data de encerramento desta sessão: 12/08/2026
Formação: Software Engineer AI-First Mentor
Missão atual: MISSÃO 001 — Terminal e PowerShell
Status: EM ANDAMENTO

## Objetivo da missão

Construir fundamentos operacionais de Terminal e PowerShell antes de avançar para Git/GitHub, seguindo o roadmap oficial.

Método usado:
CONCEITO → DEMO → LAB → ERRO INTENCIONAL → DEBUG → DESAFIO → VALIDAÇÃO.

Nível-alvo da missão: N2 — Executo guiado, começando a demonstrar autonomia pontual em direção ao N3.

## Ambiente observado

- Windows
- PowerShell
- Diretório de trabalho do projeto:
  C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
- Diretório atual ao final:
  C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor\laboratorio-powershell

Ferramentas cuja resolução foi validada com Get-Command:

- Git: C:\Program Files\Git\cmd\git.exe
- Node: C:\Program Files\nodejs\node.exe
- VS Code CLI: C:\Users\richard.feitosa\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd

Versões observadas:
- Git: 2.44.0.1 (conforme saída de Get-Command)
- Node: 22.19.0.0 (conforme saída de Get-Command)

## Conteúdo concluído na MISSÃO 001

### LAB 001.1 — Diretório atual

Comando:
Get-Location

Aprendido:
- terminal;
- PowerShell;
- diretório atual;
- localização no filesystem.

### LAB 001.2 — Listagem do filesystem

Comando:
Get-ChildItem

Aprendido:
- listar arquivos e diretórios;
- observar estado sem alterá-lo;
- noções iniciais de Mode, Length e Name.

### LAB 001.3 — Navegação

Comandos:
Set-Location .\software_engineer_ai_first_mentor
Get-Location

Aprendido:
- caminho absoluto;
- caminho relativo;
- `.` como diretório atual;
- `..` como diretório pai;
- Set-Location/cd.

### LAB 001.4 — Erro intencional: caminho inexistente

Comando:
Set-Location .\pasta-que-nao-existe

Erro observado:
- ObjectNotFound
- PathNotFound

Diagnóstico praticado:
SINTOMA → EVIDÊNCIA → HIPÓTESE → TESTE → CONCLUSÃO → CORREÇÃO.

Foi validado com Get-ChildItem que a pasta não existia e com Get-Location que uma falha no Set-Location não mudou o diretório atual.

### LAB 001.5 — Alteração reversível do filesystem

Comandos estudados:
New-Item -ItemType Directory -Name laboratorio-powershell
Remove-Item .\laboratorio-powershell

Aprendido:
- diferença entre comando de leitura e comando que altera estado;
- rollback;
- risco de comandos destrutivos.

### LAB 001.6 — Arquivos e conteúdo

Foi criado:
teste.txt

Conteúdo:
Minha primeira linha no PowerShell

Comandos:
New-Item -ItemType File -Name teste.txt
"Minha primeira linha no PowerShell" | Set-Content .\teste.txt
Get-Content .\teste.txt

Aprendido:
- criar arquivo;
- gravar conteúdo;
- ler conteúdo;
- Set-Content pode substituir conteúdo existente.

### LAB 001.7 — Objetos e pipeline

Comandos:
Get-ChildItem | Get-Member
Get-ChildItem | Select-Object Name, Length

Evidência:
TypeName: System.IO.FileInfo

Aprendido:
- PowerShell trabalha com objetos no pipeline;
- propriedades e métodos;
- propriedades como Name, Length, Extension e FullName;
- Select-Object.

### LAB 001.8 — Filtragem

Foi criado:
outro.log

Comando:
Get-ChildItem | Where-Object Extension -eq ".txt"

Resultado:
somente teste.txt.

Aprendido:
- Where-Object;
- propriedade Extension;
- operador -eq.

### LAB 001.9 — Pipeline completo + desafio

Pipeline executado:
Get-ChildItem | Where-Object { $_.Extension -eq ".txt" } | Select-Object Name, Length

Desafio realizado autonomamente:
alterar o filtro para `.log`.

Comando criado pelo aluno:
Get-ChildItem | Where-Object { $_.Extension -eq ".log" } | Select-Object Name, Length

Resultado:
outro.log, Length 17.

Aprendido:
OBTER → FILTRAR → SELECIONAR.

Introdução a:
$_ = objeto atual passando pelo pipeline.

### LAB 001.10 — Processos

Comando:
Get-Process

Processos observados incluíram:
- AnyDesk
- AppActions
- ApplicationFrameHost

Aprendido:
- diferença conceitual entre programa instalado e processo em execução;
- processos também são objetos PowerShell.

### LAB 001.11 — PID

Pipeline:
Get-Process | Where-Object ProcessName -eq "AnyDesk" | Select-Object ProcessName, Id, CPU

Foram observadas duas instâncias de AnyDesk com PIDs distintos.

Investigação:
Get-Process -Id 5928 | Select-Object ProcessName, Id, StartTime, Path

Evidência observada:
- ProcessName: AnyDesk
- Id: 5928
- StartTime: 12/08/2026 02:03:56
- Path: sem valor retornado

Aprendido:
- PID = Process Identifier;
- mesmo nome pode corresponder a processos diferentes;
- PID não deve ser tratado como identidade permanente;
- inspecionar antes de alterar;
- Stop-Process NÃO foi usado.

### LAB 001.12/001.13 — Variáveis e tipos

Exemplos:
$numero = 10
$texto = "10"

Tipos observados:
- System.Int32
- System.String

Também foi praticado:
$idade = 30
$idade = $idade + 1

Resultado:
31.

Aprendido:
- variável;
- atribuição;
- número vs string;
- tipo influencia comportamento;
- introdução à lógica/programação.

### LAB 001.14 — Variáveis de ambiente e PATH

Comandos:
$env:USERNAME
$env:USERPROFILE
$env:PATH

Foi compreendido:
- variável normal vs variável de ambiente;
- PATH como lista de diretórios relevantes para resolução de executáveis;
- não alterar PATH sem necessidade e validação.

### LAB 001.15 — Resolução de comandos

Comandos:
Get-Command git
Get-Command node
Get-Command code

Todos foram resolvidos corretamente.

Aprendido:
- PATH e Get-Command não são a mesma coisa;
- Get-Command ajuda a investigar qual comando será resolvido pelo PowerShell.

### LAB 001.16 — Erro intencional: comando inexistente

Comandos:
Get-Command ferramenta-que-nao-existe
ferramenta-que-nao-existe

Erro observado:
CommandNotFoundException

Modelo de diagnóstico construído:

Sintoma:
comando não reconhecido.

Hipóteses possíveis:
- nome incorreto;
- ferramenta não instalada;
- ferramenta instalada mas fora do PATH;
- caminho incorreto;
- sessão ainda não refletiu alteração recente de ambiente.

Regra:
não concluir "não está instalado" apenas pelo sintoma; investigar por evidências.

## Estado pedagógico atual

Competências demonstradas até aqui:

- navegar no filesystem com orientação;
- distinguir caminho absoluto/relativo;
- listar/criar/remover itens de laboratório;
- criar, gravar e ler arquivo;
- entender pipeline básico;
- reconhecer objetos/propriedades;
- filtrar e selecionar objetos;
- adaptar um pipeline conhecido para novo requisito sem receita pronta;
- inspecionar processos;
- entender PID;
- usar variáveis;
- distinguir Int32 de String;
- inspecionar variáveis de ambiente;
- explicar conceitualmente PATH;
- usar Get-Command;
- diagnosticar PathNotFound e CommandNotFoundException de forma orientada a evidências.

Não considerar a MISSÃO 001 encerrada ainda.

## PONTO EXATO PARA RETOMADA

A sessão deve continuar a partir de:

### LAB 001.17 — Portas e rede

Objetivo pedagógico imediato:
construir a relação:

Aplicação
↓
Processo
↓
PID
↓
Porta
↓
Conexão/rede
↓
HTTP (posteriormente)

Próximos tópicos esperados da MISSÃO 001:
1. portas;
2. conexões TCP;
3. localhost/loopback;
4. noções de DNS;
5. noções iniciais de HTTP;
6. comandos seguros de inspeção de rede;
7. possível erro intencional/debug de conectividade;
8. fechamento/retrospectiva da MISSÃO 001;
9. atualização do Progress Ledger;
10. somente depois avançar para MISSÃO 002 — Git Foundations.

## Instrução para a próxima sessão

Atue como Software Engineer AI-First Mentor.

Não reinicie a MISSÃO 001.
Não repita os laboratórios já concluídos, exceto se necessário para revisão curta.
Retome diretamente no LAB 001.17 — Portas e rede.

Mantenha:
- Português-Brasil;
- ELI5 → conceito técnico → exemplo → uso profissional → armadilhas;
- prática guiada;
- explicar o que cada comando faz;
- o que muda no sistema;
- saída esperada;
- validação;
- risco;
- rollback quando aplicável;
- debugging por evidências;
- progressão de autonomia;
- conexão com QA/Software Engineering quando relevante.

Regra central:
APRENDER → EXECUTAR → OBSERVAR → EXPLICAR → REPETIR SEM AJUDA.

Não fazer commit, push, merge ou ações destrutivas automaticamente.
