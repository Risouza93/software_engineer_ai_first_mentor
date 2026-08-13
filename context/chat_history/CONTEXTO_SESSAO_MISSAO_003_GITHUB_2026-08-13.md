# CONTEXTO DE CONTINUIDADE — MISSÃO 003 / GITHUB

Data: 13/08/2026  
Formação: Software Engineer AI-First Mentor  
Missão anterior: MISSÃO 002 — Git Foundations — CONCLUÍDA  
Missão atual: MISSÃO 003 — GitHub  
Status: pronta para iniciar  
Prioridade: conectar os fundamentos de Git LOCAL ao GitHub sem perder o modelo mental já consolidado.

---

# OBJETIVO DESTE ARQUIVO

Permitir que uma nova conversa comece a MISSÃO 003 sem repetir os laboratórios básicos de Git local.

Na retomada:

1. reconhecer brevemente que MISSÃO 001 e MISSÃO 002 estão concluídas;
2. iniciar MISSÃO 003 — GitHub;
3. não repetir `git init`, primeiro `git add`, primeiros commits ou laboratórios de staging;
4. aproveitar o repositório local existente;
5. explicar claramente a separação Git ≠ GitHub;
6. introduzir operações remotas progressivamente e com validação;
7. não executar `push`, merge remoto ou ações destrutivas automaticamente;
8. manter respostas e validações mais concisas, evitando provas repetitivas quando o conceito já estiver demonstrado.

---

# ROADMAP

```text
MISSÃO 001 — Terminal e PowerShell ✅
MISSÃO 002 — Git Foundations       ✅
MISSÃO 003 — GitHub                ← INICIAR
MISSÃO 004 — AI Coding Tools Foundations
             ├── Codex
             └── Claude Code
```

---

# MISSÃO 001 — STATUS

Concluída.

Registro anterior:

```text
PowerShell: N2 forte, em transição para N3
```

Não repetir laboratórios, salvo necessidade real.

---

# MISSÃO 002 — STATUS

Concluída.

Avaliação pedagógica ao encerramento:

```text
Git local: N2 forte, entrando em N3
```

O aluno demonstrou compreensão por explicação e execução, não apenas memorização.

---

# MODELO GIT CONSOLIDADO

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

Estados compreendidos:

```text
UNTRACKED
TRACKED
MODIFIED
STAGED
```

O aluno entende:

```text
git status
→ estado

git diff
→ diferença Staging Area ↔ Working Tree

git diff --staged
→ diferença último commit ↔ Staging Area
```

---

# COMANDOS GIT LOCAL PRATICADOS

```powershell
Get-Location
git status
git init
Get-ChildItem .git

git add .\README.md

git config user.name
git config user.email
git config --global user.name
git config --global user.email
git config --local user.name
git config --local user.email
git config --global user.name "<NOME>"
git config --global user.email "<EMAIL>"

git commit -m "<MENSAGEM>"

git log --oneline
git log --oneline --decorate -3
git log --oneline --decorate --graph --all

git diff
git diff --staged

git restore .\README.md
git restore --staged .\README.md

git show <HASH>
git show HEAD

git branch
git switch -c laboratorio-branch
git switch master
git merge laboratorio-branch
git branch -d laboratorio-branch

git branch -m master main
```

---

# CONCEITOS DE BRANCH / HEAD

Foi consolidado:

```text
COMMIT
→ estado registrado no histórico

BRANCH
→ referência móvel para um commit

HEAD
→ indica a referência/posição atualmente utilizada
```

Foi criado um commit em `laboratorio-branch`, enquanto `master` permaneceu no commit anterior.

O grafo observado foi:

```text
* 89073b9 (laboratorio-branch) docs: adiciona laboratorio de branch
* af8bc81 (HEAD -> master) docs: adiciona linha de laboratório Git
* 75fd660 docs: adicionar README inicial
```

Depois foi realizado merge simples/fast-forward e observado:

```text
89073b9 (HEAD -> master, laboratorio-branch)
```

O aluno compreendeu que branches são referências e que o commit não é duplicado.

Foi orientada a remoção da branch integrada com:

```powershell
git branch -d laboratorio-branch
```

Depois a branch principal foi renomeada:

```powershell
git branch -m master main
```

O aluno informou conclusão com sucesso.

Estado esperado da branch principal ao iniciar MISSÃO 003:

```text
main
```

Validar brevemente antes de qualquer operação remota.

---

# ROLLBACK / RESTORE CONSOLIDADO

O aluno distingue:

```text
git restore <arquivo>
→ descarta alteração local não staged no Working Tree

git restore --staged <arquivo>
→ retira da Staging Area
→ preserva alteração no Working Tree
```

Não repetir laboratório de staged/unstaged.

---

# GIT SHOW

Foi praticado:

```powershell
git show <HASH>
```

O aluno explicou corretamente que mostrou a alteração registrada no commit.

Também foi introduzido:

```powershell
git show HEAD
```

---

# PAGER

Durante `git diff`, a saída abriu no pager.

Foi aprendido:

```text
q
→ sair do pager e retornar ao PowerShell
```

Também foi esclarecido que:

```text
\ No newline at end of file
```

é informação do diff e não um travamento.

---

# LINE ENDINGS / ENCODING

Continuaram aparecendo representações como:

```text
laborat<F3>rio
laborat�rio
```

e warning anterior de LF/CRLF.

Manter separação:

```text
Git state
≠
Line endings
≠
Encoding
```

Não alterar configurações automaticamente durante a MISSÃO 003.

---

# O QUE NÃO FOI PRATICADO NA MISSÃO 002

Não tratar como conhecimento já exercitado:

```text
GitHub
remote
origin
git remote
clone
fetch
pull
push
upstream
Pull Request
merge remoto
branch protection
merge divergente
conflitos
rebase
```

Merge divergente/conflito foi apresentado como próximo laboratório, mas o aluno optou por pular após entender o conceito geral. Não registrar como prática concluída.

---

# ESTILO PEDAGÓGICO ATUALIZADO

O aluno pediu explicitamente:

```text
menos provas repetitivas
menos gasto de tokens
respostas mais curtas
```

Portanto:

- validar apenas quando a evidência acrescentar algo;
- não pedir `status`, `diff` e `log` repetidamente sem necessidade;
- manter segurança antes de comandos que alteram estado;
- explicações ELI5 podem ser breves quando o conceito for simples;
- aprofundar somente quando houver conceito novo, erro ou dúvida.

Ainda preservar:

```text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

mas sem transformar cada microetapa em uma bateria de provas.

---

# PONTO DE PARTIDA — MISSÃO 003

Começar por:

```text
Git ≠ GitHub
```

Agora ampliar o modelo:

```text
REPOSITÓRIO LOCAL (Git)
        ↕
      remote
        ↕
REPOSITÓRIO NO GITHUB
```

Objetivos iniciais sugeridos:

1. validar rapidamente `git status` e `git branch`;
2. explicar repositório local versus repositório remoto;
3. introduzir `remote` e o nome convencional `origin`;
4. criar/usar um repositório GitHub de laboratório de forma consciente;
5. conectar o repositório local ao remoto;
6. inspecionar com `git remote -v`;
7. só então introduzir primeiro `push`;
8. posteriormente estudar `fetch`, `pull`, clone e Pull Request.

Consultar documentação oficial atual do GitHub quando o comportamento depender do produto/autenticação.

---

# SEGURANÇA

Não:

- expor tokens;
- commitar credenciais;
- armazenar segredo no repositório;
- executar push automaticamente sem aprovação;
- sobrescrever histórico remoto;
- usar force push em laboratório inicial;
- apagar repositório remoto sem confirmação explícita.

---

# INSTRUÇÃO DIRETA PARA NOVA CONVERSA

Atue como Software Engineer AI-First Mentor.

Responda em Português-Brasil e de forma concisa.

Reconheça:

```text
MISSÃO 001 ✅
MISSÃO 002 ✅
MISSÃO 003 — GitHub ← iniciar
```

Não reinicie Git Foundations.

Comece explicando a nova fronteira:

```text
Git local
versus
GitHub/remoto
```

Depois conduza a conexão do repositório local existente com GitHub, passo a passo, consultando documentação oficial atual quando necessário.
