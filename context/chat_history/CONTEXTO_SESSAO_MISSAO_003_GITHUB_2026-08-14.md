# CONTEXTO DE CONTINUIDADE --- MISSÃO 003 / GITHUB

Data: 14/08/2026\
Formação: Software Engineer AI-First Mentor\
Missão anterior: MISSÃO 002 --- Git Foundations --- CONCLUÍDA\
Missão atual: MISSÃO 003 --- GitHub --- EM ANDAMENTO\
Ponto exato de retomada: iniciar workflow profissional com branch
remota + primeiro Pull Request.

------------------------------------------------------------------------

# OBJETIVO DESTE ARQUIVO

Permitir iniciar uma nova conversa exatamente do ponto atual, sem
repetir Git Foundations nem os laboratórios remotos já concluídos.

Na retomada:

1.  reconhecer brevemente MISSÃO 001 e MISSÃO 002 como concluídas;
2.  reconhecer que MISSÃO 003 já está em andamento;
3.  NÃO repetir remote, primeiro push, fetch, pull ou clone;
4.  continuar diretamente por branch de trabalho → push da branch → Pull
    Request;
5.  manter explicações concisas;
6.  pedir saída de comandos somente quando necessária para decidir o
    próximo passo ou diagnosticar erro;
7.  não executar commit, push, merge remoto ou ação destrutiva
    automaticamente sem aprovação consciente durante esta fase.

------------------------------------------------------------------------

# ROADMAP

``` text
MISSÃO 001 — Terminal e PowerShell ✅
MISSÃO 002 — Git Foundations       ✅
MISSÃO 003 — GitHub                ← EM ANDAMENTO
MISSÃO 004 — AI Coding Tools Foundations
             ├── Codex
             └── Claude Code
```

------------------------------------------------------------------------

# NÍVEL ANTERIOR CONSOLIDADO

``` text
PowerShell: N2 forte, em transição para N3
Git local: N2 forte, entrando em N3
```

MISSÃO 002 já consolidou:

``` text
Working Tree
Staging Area
commit
history
branch
HEAD
restore
git show
fast-forward local
branch principal renomeada para main
```

Não repetir esses laboratórios salvo necessidade real.

------------------------------------------------------------------------

# REPOSITÓRIO UTILIZADO

Repositório local de formação:

``` text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

Branch principal observada:

``` text
main
```

Antes da conexão com GitHub, o estado observado foi:

``` text
On branch main
nothing to commit, working tree clean
```

O repositório também já foi utilizado como base da formação e existe
experiência anterior com um projeto de página de portfólio; não tratar
GitHub como conceito completamente abstrato.

------------------------------------------------------------------------

# O QUE FOI PRATICADO NA MISSÃO 003 ATÉ AGORA

## 1. Git ≠ GitHub

Modelo consolidado:

``` text
Git
→ sistema de controle de versão

GitHub
→ plataforma que hospeda repositórios Git e adiciona colaboração
```

Novo modelo:

``` text
REPOSITÓRIO LOCAL (Git)
        ↕
      remote
        ↕
REPOSITÓRIO NO GITHUB
```

------------------------------------------------------------------------

## 2. Estado inicial validado

Foram executados:

``` powershell
git status
git branch
git remote -v
```

Resultado relevante:

``` text
main
working tree clean
nenhum remote configurado inicialmente
```

------------------------------------------------------------------------

## 3. Repositório remoto criado no GitHub

Foi criado manualmente no GitHub um repositório para:

``` text
software_engineer_ai_first_mentor
```

O repositório foi criado vazio para receber o histórico local existente.

------------------------------------------------------------------------

## 4. Remote `origin`

Foi configurado com sucesso:

``` powershell
git remote add origin <URL_HTTPS_DO_REPOSITORIO>
```

E validado com:

``` powershell
git remote -v
```

Conceito consolidado:

``` text
origin
→ nome/apelido convencional do remote

URL
→ endereço real do repositório GitHub
```

------------------------------------------------------------------------

## 5. Primeiro push

Executado com sucesso:

``` powershell
git push -u origin main
```

O conteúdo local passou a ser visível no GitHub.

Conceito introduzido:

``` text
main
→ branch local

origin
→ remote

origin/main
→ remote-tracking branch/referência local do estado conhecido da main remota
```

O `-u` estabeleceu upstream/tracking para a `main`.

------------------------------------------------------------------------

## 6. Fetch

Executado:

``` powershell
git fetch
```

Também foi utilizado:

``` powershell
git branch -vv
```

Entendimento atual:

``` text
git fetch
→ busca objetos/referências do remoto
→ atualiza o conhecimento local sobre o remoto
→ não integra automaticamente a mudança à branch de trabalho
```

------------------------------------------------------------------------

## 7. Alteração feita diretamente no GitHub

O `README.md` foi editado diretamente pelo GitHub.

Foram removidas linhas de teste.

Isso deixou o remoto à frente do estado da branch local.

Depois:

``` powershell
git fetch
```

detectou a alteração remota.

------------------------------------------------------------------------

## 8. Pull + fast-forward

Executado:

``` powershell
git pull
```

Resultado observado:

``` text
update
fast-forward
arquivo alterado
quantidade de deleções
```

A mudança feita no GitHub passou a existir localmente.

Entendimento:

``` text
fetch
→ buscar/conhecer

pull
→ buscar + integrar
```

O fast-forward já era conhecido da MISSÃO 002 e agora foi observado
também em fluxo remoto.

------------------------------------------------------------------------

## 9. Clone

Foi criado um clone temporário para entender o fluxo inverso:

``` powershell
git clone <URL_HTTPS> software_engineer_ai_first_mentor_clone
```

Foi validado que `git clone` criou automaticamente o `origin`.

Conceito consolidado:

``` text
git init
→ inicia Git em uma pasta existente

git clone
→ cria uma cópia local de um repositório Git existente,
   trazendo arquivos, histórico e configuração remota inicial
```

------------------------------------------------------------------------

## 10. Remoção do clone temporário

Foi orientado sair do clone e remover somente a pasta de laboratório:

``` powershell
cd ..
Remove-Item -Recurse -Force .\software_engineer_ai_first_mentor_clone
cd .\software_engineer_ai_first_mentor
```

Objetivo: manter somente o repositório original de formação.

Se a nova conversa começar imediatamente após este contexto, considerar
a remoção como a última operação orientada; se houver dúvida sobre sua
conclusão, perguntar apenas se o clone foi removido, sem pedir bateria
de comandos.

------------------------------------------------------------------------

# COMANDOS DA MISSÃO 003 JÁ INTRODUZIDOS

``` powershell
git status
git branch
git remote -v

git remote add origin <URL_HTTPS_DO_REPOSITORIO>

git push -u origin main
git push

git fetch
git branch -vv

git pull

git clone <URL_HTTPS> software_engineer_ai_first_mentor_clone

cd ..
Remove-Item -Recurse -Force .\software_engineer_ai_first_mentor_clone
cd .\software_engineer_ai_first_mentor
```

------------------------------------------------------------------------

# CONCEITOS REMOTOS JÁ PRATICADOS

``` text
Git ≠ GitHub
repository local ≠ repository remoto
remote
origin
main
origin/main
upstream/tracking
push
fetch
pull
clone
fast-forward em fluxo remoto
```

Não reapresentar esses conceitos como se fossem novos.

Pode fazer microexplicação somente quando necessária para conectar ao
próximo conceito.

------------------------------------------------------------------------

# ESTILO PEDAGÓGICO --- IMPORTANTE

O usuário reforçou durante esta sessão:

``` text
não pedir saída de todos os comandos
pedir somente o necessário para avançar
economizar tokens
```

Portanto:

-   não pedir `status`, `branch`, `remote`, `log` etc. em toda
    microetapa;
-   pedir evidência somente quando ela muda a decisão seguinte;
-   se comando funcionar, aceitar confirmação curta;
-   se falhar, pedir somente erro/saída relevante;
-   respostas concisas;
-   manter segurança antes de operações relevantes;
-   aprofundar quando houver conceito novo, erro ou dúvida.

Preservar:

``` text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

sem validação redundante.

------------------------------------------------------------------------

# PONTO EXATO DE RETOMADA

O próximo bloco planejado é:

``` text
main
  ↓
branch de trabalho
  ↓
alteração controlada
  ↓
commit
  ↓
push da branch
  ↓
Pull Request
  ↓
review
  ↓
merge remoto
```

A branch local já é conceito conhecido da MISSÃO 002.

A novidade deve ser:

1.  criar uma branch de trabalho para uma alteração pequena;
2.  explicar a relação branch local ↔ branch remota;
3.  fazer commit consciente;
4.  executar o primeiro push da nova branch;
5.  observar a branch no GitHub;
6.  criar o primeiro Pull Request;
7.  explicar base branch versus compare branch;
8.  ler o diff do PR;
9.  conectar mudança → risco → teste, quando fizer sentido;
10. realizar review/merge de forma guiada;
11. atualizar a `main` local após o merge.

Não executar push ou merge automaticamente.

------------------------------------------------------------------------

# AINDA NÃO TRATAR COMO PRÁTICA CONCLUÍDA

``` text
push de uma feature branch
Pull Request
review
merge remoto via Pull Request
branch protection
merge divergente
conflitos
rebase
```

Esses itens continuam pendentes.

------------------------------------------------------------------------

# SEGURANÇA

Não:

-   expor tokens;
-   commitar credenciais;
-   armazenar segredo no repositório;
-   usar force push neste laboratório;
-   apagar repositório remoto sem confirmação explícita;
-   sobrescrever histórico remoto;
-   executar merge remoto automaticamente;
-   ampliar permissões sem explicar impacto.

------------------------------------------------------------------------

# INSTRUÇÃO DIRETA PARA NOVA CONVERSA

Atue como Software Engineer AI-First Mentor.

Responda em Português-Brasil, de forma objetiva.

Reconheça:

``` text
MISSÃO 001 — Terminal e PowerShell ✅
MISSÃO 002 — Git Foundations       ✅
MISSÃO 003 — GitHub                ← EM ANDAMENTO
```

Não reinicie Git Foundations e não repita remote/push/fetch/pull/clone.

Continue exatamente por:

``` text
branch de trabalho
→ push da branch
→ primeiro Pull Request
```

Peça saída de terminal somente quando necessária para avançar ou
diagnosticar.

A próxima missão após concluir GitHub será:

``` text
MISSÃO 004 — AI Coding Tools Foundations
├── Codex
└── Claude Code
```

------------------------------------------------------------------------

# ARTEFATO OPERACIONAL ATUALIZADO --- PADRÃO OFICIAL DE CARTILHA

Foi fornecido como referência o arquivo:

``` text
comandos_missao_001.md
```

A partir da avaliação desse arquivo, o padrão oficial para as cartilhas
`comandos_missao_XXX.md` passa a seguir a mesma organização operacional:

``` text
título da missão
↓
Objetivo / Como usar / Ambiente
↓
Modelo mental
↓
comandos numerados
↓
O que faz
↓
Altera o sistema
↓
Validação / Rollback / Risco quando aplicável
↓
modelos mentais e evidências observadas
↓
templates rápidos
↓
folha de variáveis
↓
regra operacional
↓
próxima etapa
```

A cartilha da MISSÃO 003 foi recriada e padronizada como:

``` text
comandos_missao_003.md
```

Ela substitui, como versão de referência, o nome intermediário:

``` text
comandos_missao_03.md
```

O novo arquivo contém somente comandos e conceitos efetivamente
aprendidos/praticados até este ponto da MISSÃO 003:

``` text
git status
git branch
git remote -v
git remote add origin <URL>
git push -u origin main
git push
git branch -vv
git fetch
git fetch origin
git pull
git clone <URL>
git clone <URL> <PASTA>
cd ..
Remove-Item -Recurse -Force <PASTA_CLONE>
```

Conceitos registrados:

``` text
Git ≠ GitHub
local ≠ remoto
remote
origin
main
origin/main
upstream/tracking
push
fetch
pull
clone
fast-forward remoto
clone local ≠ repositório remoto
```

Regra para evolução da cartilha:

> Não antecipar comandos como se já fossem dominados. Novos comandos
> Git/GitHub devem ser acrescentados ao `comandos_missao_003.md` somente
> depois de serem ensinados e praticados.

Assim, o próximo bloco aparece na cartilha apenas como próxima etapa:

``` text
main
↓
branch de trabalho
↓
alteração controlada
↓
commit
↓
push da branch
↓
Pull Request
↓
review
↓
merge remoto
```

Ainda NÃO registrar como prática concluída:

``` text
push de feature branch
Pull Request
review
merge remoto via Pull Request
branch protection
merge divergente
conflitos
rebase
```

------------------------------------------------------------------------

# ARQUIVOS QUE DEVEM ACOMPANHAR A CONTINUIDADE

Para retomada da MISSÃO 003, considerar em conjunto:

``` text
CONTEXTO_SESSAO_MISSAO_003_GITHUB_2026-08-14.md
comandos_missao_003.md
```

Função de cada um:

``` text
CONTEXTO_SESSAO...
→ estado pedagógico, progresso, decisões e ponto exato de retomada

comandos_missao_003.md
→ referência operacional dos comandos e modelos mentais já praticados
```

O `comandos_missao_003.md` deve continuar evoluindo ao longo da missão
seguindo o mesmo padrão estrutural do `comandos_missao_001.md`.

------------------------------------------------------------------------

# RETOMADA EXATA NO PRÓXIMO CHAT

Ao iniciar a próxima conversa, NÃO repetir:

``` text
remote
primeiro push da main
fetch
pull
clone
```

Retomar diretamente em:

``` text
MISSÃO 003 — GitHub

branch de trabalho
↓
alteração controlada
↓
commit
↓
push da branch
↓
primeiro Pull Request
```

A branch local já foi praticada na MISSÃO 002. O conceito novo deve ser
principalmente:

``` text
branch local
        ↕
branch remota
        ↓
Pull Request
```

Manter a regra do usuário:

``` text
pedir saída de comandos
SOMENTE
quando necessária para avançar ou diagnosticar
```
