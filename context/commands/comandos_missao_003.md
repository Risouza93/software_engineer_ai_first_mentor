# COMANDOS --- MISSÃO 003 --- GITHUB

> **Objetivo:** servir como referência operacional dos comandos
> Git/GitHub aprendidos e praticados na MISSÃO 003, evitando decorar
> sintaxe repetitiva.
>
> **Como usar:** substitua os campos `<...>` pelos valores do seu
> contexto. Antes de comandos que alteram estado local ou remoto,
> confirme o repositório/branch envolvidos e entenda o impacto.
>
> **Ambiente:** Windows + PowerShell + Git + GitHub

------------------------------------------------------------------------

## 0. Modelo mental

``` text
REPOSITÓRIO LOCAL (Git)
        ↕
      remote
        ↕
REPOSITÓRIO NO GITHUB
```

Separações importantes:

``` text
Git
→ sistema de controle de versão

GitHub
→ plataforma que hospeda repositórios Git e adiciona colaboração

main
→ branch local

origin
→ nome convencional do remote principal

origin/main
→ referência local que representa o estado conhecido da main no origin
```

Fluxo remoto básico praticado:

``` text
LOCAL ── push ──► GITHUB

LOCAL ◄─ fetch ── GITHUB
       conhecer mudanças

LOCAL ◄─ pull ─── GITHUB
       buscar + integrar
```

------------------------------------------------------------------------

# 1. Verificar estado do repositório

## `git status`

``` powershell
git status
```

**O que faz:** mostra branch atual e estado do Working Tree/Staging
Area.\
**Altera o sistema:** não.\
**Uso diário:** entender o estado antes de operações Git relevantes.\
**Rollback:** não necessário.

Estado observado no início da missão:

``` text
On branch main
nothing to commit, working tree clean
```

------------------------------------------------------------------------

# 2. Verificar branch local

## `git branch`

``` powershell
git branch
```

**O que faz:** lista branches locais e marca a branch atual com `*`.\
**Altera o sistema:** não.

Estado observado:

``` text
* main
```

------------------------------------------------------------------------

# 3. Inspecionar remotes

## `git remote -v`

``` powershell
git remote -v
```

**O que faz:** lista os remotes configurados e as URLs utilizadas para
`fetch` e `push`.\
**Altera o sistema:** não.

Na primeira execução da missão, não houve saída:

``` text
<sem saída>
```

Isso indicou que o repositório local ainda não possuía um remote
configurado.

Modelo mental:

``` text
origin
→ apelido local

URL
→ endereço do repositório remoto
```

------------------------------------------------------------------------

# 4. Adicionar um remote

## `git remote add`

Template:

``` powershell
git remote add <NOME_DO_REMOTE> <URL_DO_REPOSITORIO>
```

Forma praticada:

``` powershell
git remote add origin <URL_HTTPS_DO_REPOSITORIO>
```

Campos:

``` text
<NOME_DO_REMOTE>          = origin
<URL_HTTPS_DO_REPOSITORIO> = URL HTTPS do repositório no GitHub
```

**O que faz:** registra no repositório local o endereço de outro
repositório Git.\
**Altera o sistema:** sim, altera a configuração Git local (`.git`).\
**Não faz:** não envia commits nem arquivos ao GitHub.

**Validação:**

``` powershell
git remote -v
```

Saída esperada conceitualmente:

``` text
origin  <URL> (fetch)
origin  <URL> (push)
```

------------------------------------------------------------------------

# 5. Primeiro push da `main`

## `git push -u origin main`

``` powershell
git push -u origin main
```

**O que faz:** envia a branch `main` local ao remote `origin`.\
**Altera o sistema:** sim, altera o repositório remoto.\
**Comunicação externa:** sim.

Componentes:

``` text
git push
→ enviar referências/commits

-u
→ configurar upstream/tracking

origin
→ remote de destino

main
→ branch enviada
```

Relação criada:

``` text
main
  ↕
origin/main
```

Depois do upstream configurado, em condições normais:

``` powershell
git push
```

pode ser suficiente para novos envios da branch acompanhada.

> Durante a formação inicial, `push` deve ser executado conscientemente.
> Não usar `--force`.

------------------------------------------------------------------------

# 6. Inspecionar tracking/upstream

## `git branch -vv`

``` powershell
git branch -vv
```

**O que faz:** mostra detalhes das branches locais, incluindo upstream
quando configurado.\
**Altera o sistema:** não.

Exemplo conceitual:

``` text
* main <HASH> [origin/main] <MENSAGEM>
```

Separação:

``` text
origin
≠
origin/main
≠
main
```

------------------------------------------------------------------------

# 7. Buscar mudanças remotas sem integrar

## `git fetch`

``` powershell
git fetch
```

**O que faz:** busca objetos e referências do remote e atualiza o
conhecimento local sobre o estado remoto.\
**Altera o Working Tree:** não integra automaticamente mudanças aos
arquivos da branch atual.\
**Comunicação externa:** sim.

Modelo mental:

``` text
GitHub
  ↓
git fetch
  ↓
origin/main

main permanece separada até uma integração
```

Forma explícita reutilizável:

``` powershell
git fetch <NOME_DO_REMOTE>
```

Exemplo:

``` powershell
git fetch origin
```

------------------------------------------------------------------------

# 8. Alteração remota praticada

Durante a missão, o `README.md` foi alterado diretamente pelo GitHub.

Foram removidas linhas de teste.

Depois:

``` powershell
git fetch
```

permitiu ao Git local conhecer o novo estado remoto antes de integrar a
mudança à `main`.

Situação conceitual:

``` text
main
 ↓
A ───── B
        ↑
   origin/main
```

O commit `B` existia no remoto e a `main` local ainda estava em `A`.

------------------------------------------------------------------------

# 9. Buscar e integrar mudanças

## `git pull`

``` powershell
git pull
```

**O que faz:** busca mudanças do remote configurado e as integra à
branch local atual.\
**Altera o sistema:** pode alterar branch, histórico e Working Tree
local.

Modelo estudado:

``` text
fetch
→ buscar/conhecer

pull
→ buscar + integrar
```

Resultado observado no laboratório:

``` text
fast-forward
```

O Git também apresentou: - arquivo alterado; - quantidade de
alterações/deleções.

Depois do fast-forward:

``` text
        main
         ↓
A ───── B
         ↑
    origin/main
```

------------------------------------------------------------------------

# 10. Fast-forward no fluxo remoto

O conceito de fast-forward já havia sido aprendido em Git local e foi
observado novamente durante `git pull`.

Modelo:

``` text
ANTES

main
 ↓
A ───── B
        ↑
   origin/main


DEPOIS

A ───── B
        ↑
       main
        ↑
   origin/main
```

**Conceito:** não foi necessário criar um commit de merge; a referência
local pôde simplesmente avançar até o commit já existente.

------------------------------------------------------------------------

# 11. Clonar um repositório

## `git clone`

Template:

``` powershell
git clone <URL_DO_REPOSITORIO>
```

Forma praticada, definindo outro nome para a pasta:

``` powershell
git clone <URL_HTTPS_DO_REPOSITORIO> software_engineer_ai_first_mentor_clone
```

**O que faz:** cria uma nova cópia local de um repositório Git
existente.\
**Altera o sistema:** sim, cria diretório, arquivos e metadados Git
locais.\
**Comunicação externa:** sim.

O clone trouxe/configurou:

``` text
arquivos
histórico Git
.git
referências
origin
```

Diferença estudada:

``` text
git init
→ inicia Git em uma pasta/repositório local

git clone
→ cria uma cópia local de um repositório Git existente
```

------------------------------------------------------------------------

# 12. Navegar para o clone

Antes de clonar, foi usado:

``` powershell
cd ..
```

Depois:

``` powershell
cd .\software_engineer_ai_first_mentor_clone
```

**O que faz:** muda o diretório atual do PowerShell.\
**Validação relevante no clone:**

``` powershell
git remote -v
```

Foi observado que o `origin` já havia sido configurado pelo `git clone`.

------------------------------------------------------------------------

# 13. Remover o clone de laboratório

Primeiro, sair da pasta clonada:

``` powershell
cd ..
```

Depois:

``` powershell
Remove-Item -Recurse -Force .\software_engineer_ai_first_mentor_clone
```

**O que faz:** remove recursivamente a pasta local utilizada no
laboratório.\
**Altera o sistema:** sim, filesystem.\
**Risco:** destrutivo; confirme exatamente o alvo antes de executar.

**Importante:**

``` text
apagar clone local
≠
apagar repositório no GitHub
```

Voltar ao repositório original:

``` powershell
cd .\software_engineer_ai_first_mentor
```

------------------------------------------------------------------------

# 14. Relação completa construída até aqui

``` text
REPOSITÓRIO LOCAL
│
├── main
├── commits
├── Working Tree
└── .git
     │
     └── origin
           │
           ▼
       REPOSITÓRIO GITHUB
           │
           └── main
```

Operações:

``` text
git remote add
→ registrar endereço remoto

git push
→ LOCAL → REMOTO

git fetch
→ REMOTO → conhecimento/referências locais

git pull
→ REMOTO → buscar + integrar na branch local

git clone
→ REMOTO → criar novo repositório local
```

------------------------------------------------------------------------

# 15. Templates rápidos para o dia a dia

## Em qual estado Git estou?

``` powershell
git status
```

## Qual é minha branch?

``` powershell
git branch
```

## Quais remotes estão configurados?

``` powershell
git remote -v
```

## Adicionar remote

``` powershell
git remote add <NOME_DO_REMOTE> <URL_DO_REPOSITORIO>
```

## Primeiro push com upstream

``` powershell
git push -u <NOME_DO_REMOTE> <BRANCH>
```

Exemplo praticado:

``` powershell
git push -u origin main
```

## Push depois do upstream configurado

``` powershell
git push
```

## Consultar tracking das branches

``` powershell
git branch -vv
```

## Buscar mudanças sem integrar

``` powershell
git fetch
```

Ou explicitamente:

``` powershell
git fetch <NOME_DO_REMOTE>
```

## Buscar e integrar

``` powershell
git pull
```

## Clonar

``` powershell
git clone <URL_DO_REPOSITORIO>
```

## Clonar escolhendo o nome da pasta

``` powershell
git clone <URL_DO_REPOSITORIO> <NOME_DA_PASTA>
```

------------------------------------------------------------------------

# 16. Folha de variáveis --- copie e preencha

``` text
<NOME_DO_REMOTE>           =
<URL_DO_REPOSITORIO>       =
<URL_HTTPS_DO_REPOSITORIO> =
<BRANCH>                   =
<NOME_DA_PASTA>            =
<HASH>                     =
<MENSAGEM>                 =
```

------------------------------------------------------------------------

# 17. Regra operacional Git/GitHub

Não é necessário decorar todos os comandos.

O objetivo é reconhecer:

``` text
ONDE ESTÁ A MUDANÇA?
↓
LOCAL OU REMOTO?
↓
QUERO APENAS OBSERVAR OU INTEGRAR?
↓
QUAL BRANCH ESTÁ ENVOLVIDA?
↓
QUAL REMOTE ESTÁ ENVOLVIDO?
↓
O COMANDO ALTERA ESTADO?
↓
COMO VALIDO SOMENTE O NECESSÁRIO?
```

Antes de alterar estado:

``` text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

Separações que devem permanecer claras:

``` text
Git ≠ GitHub

local ≠ remoto

origin ≠ origin/main ≠ main

fetch ≠ pull

clone ≠ init
```

> Não expor tokens, senhas ou credenciais. Não usar `force push` no
> laboratório inicial.

------------------------------------------------------------------------

# 18. Branch de trabalho e revisão local

Forma praticada:

```powershell
git switch -c feature/github-pr-lab
git branch
git diff
git add .\README.md
git diff --staged
git commit -m "docs: adiciona registro do laboratorio de Pull Request"
```

Fluxo consolidado:

```text
main
↓
feature branch
↓
alteração controlada
↓
git diff
↓
staging
↓
git diff --staged
↓
commit
```

`git diff` foi usado para revisar a mudança antes do staging e `git diff --staged` para revisar exatamente o que entraria no commit.

---

# 19. Primeiro push de feature branch

```powershell
git push -u origin feature/github-pr-lab
```

**O que faz:** publica a feature branch no `origin` e configura upstream/tracking.  
**Altera o sistema:** sim, altera o repositório remoto.  
**Comunicação externa:** sim.

Modelo:

```text
feature/github-pr-lab
        ↕
origin/feature/github-pr-lab
```

Não foi utilizado `--force`.

---

# 20. Primeiro Pull Request

No GitHub foi validado:

```text
base:    main
compare: feature/github-pr-lab
```

Modelo mental:

```text
compare / feature branch
        │
        │ propõe mudança para
        ▼
base / main
```

Antes da criação do PR, o diff foi revisado.

Evidência do laboratório:

```text
arquivo: README.md
mudança: uma linha documental
risco: baixo
validação: revisão do diff
```

O Pull Request foi entendido como proposta de integração, não como sinônimo de merge.

---

# 21. Review orientado a risco

Fluxo praticado:

```text
intenção
↓
commits
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

Ponte com QA Engineering:

```text
mudança
→ comportamento/impacto
→ risco
→ teste/validação
→ evidência
```

---

# 22. Merge remoto via Pull Request

O merge foi realizado conscientemente pela interface do GitHub após revisão do diff.

Efeito:

```text
feature/github-pr-lab
        │
        │ Pull Request
        ▼
       main remota
```

O merge remoto não atualizou automaticamente a `main` local.

---

# 23. Atualizar a `main` local

```powershell
git switch main
git pull
```

Resultado:

```text
main remota após merge
↓
git pull
↓
main local atualizada
```

---

# 24. Remover a feature branch local

```powershell
git branch -d feature/github-pr-lab
```

**O que faz:** remove a referência da branch local já integrada.  
**Altera o sistema:** sim, localmente.

Foi usado `-d`, não `-D`.

```text
-d
→ exclusão segura

-D
→ exclusão forçada; não utilizada
```

---

# 25. Remover a feature branch remota

```powershell
git push origin --delete feature/github-pr-lab
```

**O que faz:** remove a branch no remote `origin`.  
**Altera o sistema:** sim, remotamente.

Foi confirmado no GitHub:

```text
branch remota removida
≠
histórico integrado removido
```

O histórico da alteração permaneceu preservado na `main`.

---

# 26. Workflow profissional concluído

```text
main
↓
git switch -c feature/github-pr-lab
↓
alteração controlada
↓
git diff
↓
git add .\README.md
↓
git diff --staged
↓
git commit
↓
git push -u origin feature/github-pr-lab
↓
Pull Request
↓
base vs compare
↓
review do diff
↓
risco + validação
↓
merge remoto
↓
git switch main
↓
git pull
↓
git branch -d feature/github-pr-lab
↓
git push origin --delete feature/github-pr-lab
```

---

# 27. Conceitos consolidados ao final da MISSÃO 003

```text
Git ≠ GitHub
local ≠ remoto
remote / origin
main / origin/main
upstream/tracking
push / fetch / pull / clone
fast-forward remoto
branch local ↔ branch remota
feature branch
remote-tracking branch
base branch
compare branch
Pull Request
diff de PR
review orientado a risco
merge remoto via Pull Request
sincronização da main local pós-merge
limpeza de branch local
limpeza de branch remota
branch removida ≠ histórico integrado removido
```

Ainda não tratar como prática concluída:

```text
branch protection
merge divergente
conflitos
rebase
```

---

# 28. Templates rápidos adicionados

## Criar e trocar para feature branch

```powershell
git switch -c <FEATURE_BRANCH>
```

## Revisar alteração não staged

```powershell
git diff
```

## Preparar arquivo específico

```powershell
git add <ARQUIVO>
```

## Revisar staging

```powershell
git diff --staged
```

## Criar commit

```powershell
git commit -m "<MENSAGEM>"
```

## Primeiro push da feature branch

```powershell
git push -u origin <FEATURE_BRANCH>
```

## Voltar para a main

```powershell
git switch main
```

## Remover branch local integrada

```powershell
git branch -d <FEATURE_BRANCH>
```

## Remover branch remota

```powershell
git push origin --delete <FEATURE_BRANCH>
```

---

# 29. MISSÃO 003 — CONCLUÍDA

```text
MISSÃO 001 — Terminal e PowerShell          ✅
MISSÃO 002 — Git Foundations                ✅
MISSÃO 003 — GitHub                         ✅
MISSÃO 004 — AI Coding Tools Foundations    ← PRÓXIMA
             ├── Codex
             └── Claude Code
```

Evidência final:

```text
repositório local conectado ao GitHub
↓
fluxo remoto praticado
↓
feature branch criada e publicada
↓
primeiro Pull Request criado
↓
diff e risco revisados
↓
merge remoto concluído
↓
main local atualizada
↓
branches de laboratório removidas
↓
histórico integrado preservado
```

## Próxima etapa

**MISSÃO 004 — AI Coding Tools Foundations**

```text
Codex
↓
instalação
↓
autenticação
↓
primeira tarefa somente leitura
↓
alteração controlada
↓
Git diff
↓
Claude Code
↓
mesmo laboratório
↓
comparação baseada em evidências
```

Regra oficial:

```text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```
