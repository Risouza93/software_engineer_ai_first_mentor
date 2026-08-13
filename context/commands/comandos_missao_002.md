# COMANDOS — MISSÃO 002 — GIT FOUNDATIONS

> **Objetivo:** servir como referência operacional dos comandos Git aprendidos e praticados durante a MISSÃO 002, preservando o modelo mental de Working Tree, Staging Area, Commit e Histórico.
>
> **Como usar:** substitua os campos `<...>` pelos valores do seu contexto. Antes de qualquer comando que altere estado, observe primeiro o estado atual do repositório.
>
> **Ambiente:** Windows + PowerShell
>
> **Escopo atual:** Git LOCAL. GitHub, `remote`, `push`, Pull Request e operações remotas ainda não fazem parte desta missão neste ponto.

---

## 0. Modelo mental

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

Estados já estudados:

```text
UNTRACKED
→ arquivo existe no working tree
→ Git ainda não começou a acompanhá-lo no histórico

TRACKED
→ Git já conhece/acompanha o arquivo

MODIFIED
→ conteúdo atual do working tree difere do estado conhecido/preparado

STAGED
→ estado do arquivo preparado para participar do próximo commit
```

Regra operacional:

```text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

---

# 1. Confirmar o diretório atual

## `Get-Location`

```powershell
Get-Location
```

**O que faz:** mostra o diretório atual do PowerShell.  
**Por que usamos:** Git atua sobre o repositório correspondente à pasta atual e seus diretórios pais.  
**Altera o sistema:** não.  
**Validação:** conferir visualmente o caminho retornado.  
**Rollback:** não necessário.

Diretório usado no laboratório:

```text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

---

# 2. Verificar o estado do repositório

## `git status`

```powershell
git status
```

**O que faz:** mostra o estado atual do repositório.  
**Por que existe:** responde principalmente à pergunta:

```text
QUAL É O ESTADO?
```

Pode indicar, entre outros estados já observados:

```text
Untracked files
Changes to be committed
Changes not staged for commit
```

**Altera o sistema:** não.  
**Uso diário:** executar antes e depois de operações que alterem estado.  
**Rollback:** não necessário.

Erro observado antes de existir um repositório Git:

```text
fatal: not a git repository (or any of the parent directories): .git
```

Interpretação:

```text
pasta no filesystem
≠
repositório Git
```

---

# 3. Inicializar um repositório Git

## `git init`

```powershell
git init
```

**O que faz:** inicializa um repositório Git no diretório atual.  
**O que muda:** cria a estrutura interna `.git`.  
**Altera o sistema:** sim, cria metadados do repositório.  
**Como validar:**

```powershell
git status
```

e, quando necessário:

```powershell
Get-ChildItem .git
```

Estruturas observadas dentro de `.git`:

```text
hooks
info
objects
refs
config
description
HEAD
```

**Risco:** inicializar Git na pasta errada cria um repositório no local incorreto.  
**Regra:** sempre conferir `Get-Location` antes.

> Durante os laboratórios, não alterar manualmente o conteúdo de `.git`.

---

# 4. Inspecionar o diretório interno `.git`

```powershell
Get-ChildItem .git
```

**O que faz:** lista arquivos e diretórios internos do repositório.  
**Altera o sistema:** não.

Modelo mental:

```text
.git
→ estrutura interna/metadados do repositório
→ configurações, referências, objetos e informações necessárias ao Git
```

Não é necessário dominar ainda cada componente interno.

---

# 5. Preparar um arquivo para o próximo commit

## `git add`

Arquivo específico:

```powershell
git add .\<ARQUIVO>
```

Exemplo praticado:

```powershell
git add .\README.md
```

**O que faz:** prepara o estado atual do arquivo na Staging Area.  
**O que NÃO faz:**

```text
não cria commit
não envia nada ao GitHub
```

Modelo:

```text
WORKING TREE
↓
git add
↓
STAGING AREA
```

**O que muda:** a versão atual daquele arquivo passa a estar preparada para o próximo commit.  
**Como validar:**

```powershell
git status
```

Saída observada:

```text
Changes to be committed:
        new file: README.md
```

**Risco:** preparar um arquivo que você não pretendia incluir no próximo commit.  
**Recuperação:** será estudada na sequência da missão com o movimento de retirar algo da Staging Area sem apagar a alteração do Working Tree.

---

# 6. Consultar identidade Git

## Identidade efetiva

```powershell
git config user.name
git config user.email
```

**O que faz:** consulta a configuração de identidade efetiva que o Git encontra para o contexto atual.  
**Altera o sistema:** não.

---

# 7. Consultar identidade global

```powershell
git config --global user.name
git config --global user.email
```

**O que faz:** consulta a identidade configurada globalmente para o usuário.  
**Altera o sistema:** não.

Modelo:

```text
GLOBAL
→ configuração do usuário reutilizada por repositórios
```

---

# 8. Consultar identidade local

```powershell
git config --local user.name
git config --local user.email
```

**O que faz:** consulta a identidade configurada especificamente no repositório atual.  
**Altera o sistema:** não.

Modelo:

```text
LOCAL
→ configuração específica do repositório
→ pode sobrescrever configuração global
```

---

# 9. Configurar identidade global

Templates:

```powershell
git config --global user.name "<SEU_NOME>"
git config --global user.email "<SEU_EMAIL>"
```

**O que faz:** grava identidade Git no escopo global do usuário.  
**Altera o sistema:** sim, configuração Git do usuário.  
**Como validar:**

```powershell
git config --global user.name
git config --global user.email
```

**Risco:** usar nome ou e-mail incorretos e produzir commits com autoria indesejada.  
**Regra:** não usar senha, token ou segredo nesses campos.

> A identidade global já foi configurada e validada durante a missão. Não é necessário repetir sem motivo.

---

# 10. Criar um commit

## `git commit -m`

Template:

```powershell
git commit -m "<MENSAGEM_DO_COMMIT>"
```

Primeiro commit praticado:

```powershell
git commit -m "docs: adicionar README inicial"
```

Segundo commit praticado:

```powershell
git commit -m "docs: adiciona linha de laboratório Git"
```

**O que faz:** registra no histórico o estado que estava na Staging Area.  
**Ponto central:**

```text
commit
→ registra o estado staged

commit
≠
registrar automaticamente toda alteração existente no working tree
```

**O que muda:** cria um novo commit no histórico.  
**Como validar:**

```powershell
git status
git log --oneline
```

Termos observados:

```text
root-commit
→ primeiro commit do histórico

hash
→ identificador do commit
```

**Risco:** criar um commit com conteúdo staged diferente do pretendido.  
**Regra:** antes do commit, revisar `git status` e, quando houver alterações, `git diff --staged`.

---

# 11. Ver histórico resumido

## `git log --oneline`

```powershell
git log --oneline
```

**O que faz:** mostra o histórico de commits em formato resumido.  
**Altera o sistema:** não.

Histórico observado ao final do laboratório atual:

```text
af8bc81 (HEAD -> master) docs: adiciona linha de laboratório Git
75fd660 docs: adicionar README inicial
```

Conceitos apenas introduzidos:

```text
HEAD
branch master
```

Não aprofundar branches ainda.

---

# 12. Ver alterações não staged

## `git diff`

```powershell
git diff
```

**O que faz:** compara a Staging Area com o Working Tree e mostra alterações ainda não staged.  
**Pergunta respondida:**

```text
O QUE MUDOU E AINDA NÃO ESTÁ PREPARADO?
```

Modelo:

```text
STAGING AREA
↕
git diff
↕
WORKING TREE
```

**Altera o sistema:** não.  
**Uso diário:** revisar mudanças antes de executar `git add`.  
**Rollback:** não necessário.

---

# 13. Ver alterações staged

## `git diff --staged`

```powershell
git diff --staged
```

**O que faz:** compara o último commit com a Staging Area.  
**Pergunta respondida:**

```text
O QUE ESTÁ PREPARADO PARA O PRÓXIMO COMMIT?
```

Modelo:

```text
ÚLTIMO COMMIT
↕
git diff --staged
↕
STAGING AREA
```

**Altera o sistema:** não.  
**Uso diário:** revisar exatamente o que o próximo commit registrará.  
**Rollback:** não necessário.

---

# 14. Mesmo arquivo em estados diferentes

Experimento praticado:

```text
HISTÓRICO
Versão A

STAGING AREA
Versão B

WORKING TREE
Versão C
```

Fluxo:

```powershell
git add .\README.md
```

Depois, o arquivo foi alterado novamente sem um novo `git add`.

`git status` mostrou o mesmo arquivo em duas categorias:

```text
Changes to be committed:
        modified: README.md

Changes not staged for commit:
        modified: README.md
```

Interpretação consolidada:

```text
Versão B
→ staged
→ seria incluída no commit

Versão C
→ somente no working tree
→ ficaria fora daquele commit
```

Para investigar:

```powershell
git diff --staged
git diff
```

---

# 15. Descartar alteração local não staged

## `git restore <arquivo>`

Template:

```powershell
git restore .\<ARQUIVO>
```

Exemplo praticado:

```powershell
git restore .\README.md
```

**O que faz:** restaura o arquivo no Working Tree, descartando a alteração local não staged.  
**Camada afetada:**

```text
WORKING TREE
```

**O que NÃO faz:** não apaga os commits existentes do histórico.

**Como validar:**

```powershell
git status
git diff
```

Resultado observado:

```text
README.md deixou de aparecer como modified
git diff não mostrou diferenças para ele
```

**Risco:** pode apagar trabalho local ainda não registrado.  
**Regra de segurança:** observar antes com:

```powershell
git status
git diff
```

---

# 16. `git status` versus `git diff`

Resumo:

```text
git status
→ QUAL é o estado?

git diff
→ O QUE mudou e ainda não está staged?

git diff --staged
→ O QUE está preparado para o próximo commit?
```

Sequência útil:

```powershell
git status
git diff
git diff --staged
```

Nem sempre os três produzirão saída relevante; depende do estado do repositório.

---

# 17. Warning observado — LF / CRLF

Warning observado durante `git diff` / `git add`:

```text
warning: in the working copy of 'README.md',
LF will be replaced by CRLF the next time Git touches it
```

Separação conceitual:

```text
Git state
→ tracked / modified / staged

Line endings
→ LF / CRLF

Encoding
→ representação/exibição de caracteres
```

**Regra atual:** não alterar `core.autocrlf` ou configurações de encoding automaticamente apenas por causa desse warning.

---

# 18. Templates rápidos para o dia a dia

## Onde estou?

```powershell
Get-Location
```

## Qual o estado do repositório?

```powershell
git status
```

## O que mudou no Working Tree e ainda não está staged?

```powershell
git diff
```

## O que está preparado para o próximo commit?

```powershell
git diff --staged
```

## Preparar um arquivo específico

```powershell
git add .\<ARQUIVO>
```

## Criar commit do que está staged

```powershell
git commit -m "<MENSAGEM_DO_COMMIT>"
```

## Ver histórico resumido

```powershell
git log --oneline
```

## Descartar alteração local não staged

```powershell
git restore .\<ARQUIVO>
```

---

# 19. Folha de variáveis — copie e preencha

```text
<ARQUIVO>             =
<SEU_NOME>            =
<SEU_EMAIL>           =
<MENSAGEM_DO_COMMIT>  =
```

---

# 20. Regra operacional Git

Não decorar comandos isolados.

Perguntar:

```text
EM QUAL CAMADA ESTÁ A MUDANÇA?
↓
WORKING TREE?
STAGING AREA?
HISTÓRICO?
↓
O QUE EU QUERO FAZER COM ELA?
↓
QUAL COMANDO ATUA NESSA CAMADA?
↓
COMO VOU VALIDAR?
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

Regra de investigação:

```text
FATO ≠ HIPÓTESE
```

---

# 21. Retirar alteração da Staging Area sem perder o Working Tree

## `git restore --staged`

```powershell
git restore --staged .\<ARQUIVO>
```

Exemplo praticado:

```powershell
git restore --staged .\README.md
```

**O que faz:** retira a alteração da Staging Area e preserva a alteração no Working Tree.

Comparação consolidada:

```text
git restore <arquivo>
→ descarta alteração não staged do Working Tree

git restore --staged <arquivo>
→ retira da Staging Area
→ preserva alteração no Working Tree
```

**Como validar:**

```powershell
git status
git diff
git diff --staged
```

---

# 22. Inspecionar um commit

## `git show`

```powershell
git show <HASH>
```

Exemplo praticado:

```powershell
git show af8bc81
```

**O que faz:** mostra metadados e alterações registradas em um commit específico.  
**Altera o sistema:** não.

Também foi introduzida a referência:

```powershell
git show HEAD
```

`HEAD` indica a posição/referência atualmente utilizada no histórico.

---

# 23. Listar branches locais

## `git branch`

```powershell
git branch
```

**O que faz:** lista branches locais.  
**Altera o sistema:** não.

O `*` indica a branch atualmente selecionada.

Modelo consolidado:

```text
COMMIT
→ estado registrado no histórico

BRANCH
→ referência móvel que aponta para um commit

HEAD
→ indica a referência/posição atualmente utilizada
```

---

# 24. Criar e trocar para uma nova branch

## `git switch -c`

```powershell
git switch -c <NOME_DA_BRANCH>
```

Exemplo praticado:

```powershell
git switch -c laboratorio-branch
```

**O que faz:** cria uma branch e muda para ela.  
**O que não faz:** não cria commit e não envolve GitHub.

Foi comprovado que duas branches podem inicialmente apontar para o mesmo commit e depois avançar separadamente.

---

# 25. Trocar de branch

## `git switch`

```powershell
git switch <NOME_DA_BRANCH>
```

Exemplo praticado:

```powershell
git switch master
```

**O que faz:** muda a branch atualmente selecionada.  
**Como validar:**

```powershell
git branch
```

ou:

```powershell
git log --oneline --decorate --graph --all
```

---

# 26. Visualizar histórico com referências e grafo

Forma praticada:

```powershell
git log --oneline --decorate -3
```

Forma completa praticada:

```powershell
git log --oneline --decorate --graph --all
```

Parâmetros estudados:

```text
--oneline   → formato resumido
--decorate  → mostra referências como HEAD e branches
--graph     → representa graficamente a estrutura do histórico
--all       → inclui referências/branches além da branch atual
```

Exemplo observado:

```text
* 89073b9 (laboratorio-branch) docs: adiciona laboratorio de branch
* af8bc81 (HEAD -> master) docs: adiciona linha de laboratório Git
* 75fd660 docs: adicionar README inicial
```

---

# 27. Merge simples / Fast-forward

## `git merge`

```powershell
git merge <NOME_DA_BRANCH>
```

Exemplo praticado:

```powershell
git merge laboratorio-branch
```

No laboratório, `master` não possuía commits divergentes depois da criação da branch.

O resultado foi um merge simples por avanço da referência (`fast-forward`):

```text
ANTES

master
  ↓
A ─── B
      ↑
    branch

DEPOIS

A ─── B
      ↑
master + branch
```

Foi observado:

```text
89073b9 (HEAD -> master, laboratorio-branch)
```

**Conceito:** o commit não foi duplicado; as duas referências passaram a apontar para o mesmo commit.

> Merge divergente e conflitos não foram praticados nesta missão.

---

# 28. Remover branch local integrada

## `git branch -d`

```powershell
git branch -d <NOME_DA_BRANCH>
```

Exemplo orientado após o merge:

```powershell
git branch -d laboratorio-branch
```

**O que faz:** remove a referência da branch local quando o Git considera seu trabalho integrado.  
**Importante:** remover a referência da branch não significa apagar automaticamente os commits que já fazem parte do histórico integrado.

---

# 29. Renomear uma branch local

## `git branch -m`

Com a branch atual:

```powershell
git branch -m <NOME_ATUAL> <NOVO_NOME>
```

Forma praticada para a branch principal:

```powershell
git branch -m master main
```

**O que faz:** renomeia a referência da branch.  
**O que não faz:** não reescreve os commits existentes.

Validação:

```powershell
git branch
```

Estado final informado:

```text
* main
```

---

# 30. Pager do Git

Durante `git diff` foi observado que a saída pode abrir em um pager, normalmente `less`.

Para sair:

```text
q
```

A mensagem:

```text
\ No newline at end of file
```

não indica travamento. Ela informa que a última linha do arquivo não termina com uma quebra de linha.

---

# 31. Workflow Git local consolidado

```text
git status
↓
editar
↓
git diff
↓
git add <arquivo>
↓
git diff --staged
↓
git commit
↓
git log / git show
```

Com branches:

```text
git switch -c <branch>
↓
alterar
↓
git add
↓
git commit
↓
git switch <branch-destino>
↓
git merge <branch-origem>
```

---

# 32. Templates rápidos adicionados

## Retirar arquivo do staging sem perder alteração

```powershell
git restore --staged .\<ARQUIVO>
```

## Inspecionar commit

```powershell
git show <HASH>
```

## Inspecionar commit apontado por HEAD

```powershell
git show HEAD
```

## Listar branches

```powershell
git branch
```

## Criar e entrar em branch

```powershell
git switch -c <NOME_DA_BRANCH>
```

## Trocar de branch

```powershell
git switch <NOME_DA_BRANCH>
```

## Visualizar grafo local

```powershell
git log --oneline --decorate --graph --all
```

## Integrar branch

```powershell
git merge <NOME_DA_BRANCH>
```

## Remover branch local integrada

```powershell
git branch -d <NOME_DA_BRANCH>
```

## Renomear branch

```powershell
git branch -m <NOME_ATUAL> <NOVO_NOME>
```

---

# 33. Folha de variáveis atualizada

```text
<ARQUIVO>             =
<HASH>                =
<NOME_DA_BRANCH>      =
<NOME_ATUAL>          =
<NOVO_NOME>           =
<SEU_NOME>            =
<SEU_EMAIL>           =
<MENSAGEM_DO_COMMIT>  =
```

---

# 34. Status da missão

```text
MISSÃO 002 — Git Foundations ✅ CONCLUÍDA
```

Competências praticadas:

```text
repositório Git local
.git
Working Tree
Untracked / Tracked / Modified / Staged
Staging Area
git add
commit
histórico
git status
git diff
git diff --staged
git restore
git restore --staged
git log
git show
HEAD
branch
git switch
merge simples / fast-forward
remoção de branch integrada
renomeação master → main
```

Não foram praticados nesta missão:

```text
GitHub
remote
fetch/pull/push
clone
Pull Request
merge divergente
conflitos
rebase
```

Próxima etapa oficial:

```text
MISSÃO 003 — GitHub
```
