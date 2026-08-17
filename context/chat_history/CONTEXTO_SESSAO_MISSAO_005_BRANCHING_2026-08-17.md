# CONTEXTO DE CONTINUIDADE — MISSÃO 005 / BRANCHING CONCLUÍDO

Data: 17/08/2026  
Formação: Software Engineer AI-First Mentor  
Missões anteriores: MISSÕES 001–003 — CONCLUÍDAS  
MISSÃO 004 — AI Coding Tools Foundations — PARCIAL (Codex concluído; Claude Code bloqueado/adiado por dependência corporativa)  
Missão concluída nesta sessão: MISSÃO 005 — Branching  
Ponto exato de retomada no próximo chat: iniciar MISSÃO 006 — PR / Diff, preservando o estado e as regras de continuidade abaixo.

---

# ROADMAP ATUAL

```text
MISSÃO 001 — Terminal e PowerShell          ✅
MISSÃO 002 — Git Foundations                ✅
MISSÃO 003 — GitHub                         ✅
MISSÃO 004 — AI Coding Tools Foundations    ◐ PARCIAL
             ├── Codex Foundations          ✅ CONCLUÍDO
             └── Claude Code Foundations    ⏸ BLOQUEADO / ADIADO
MISSÃO 005 — Branching                      ✅ CONCLUÍDO

PRÓXIMA ETAPA DISPONÍVEL
MISSÃO 006 — PR / Diff                      ← RETOMAR NO NOVO CHAT
```

Claude Code continua adiado, não concluído nem descartado. Quando a empresa liberar licença e CLI/configuração, retomar a Parte B da MISSÃO 004 em ponto seguro.

---

# REGRAS DE CONTEXTO, COMANDOS E ECONOMIA DE TOKENS

Estas regras devem ser preservadas nos próximos arquivos de continuidade e de comandos.

## Economia de tokens

Durante laboratórios:

```text
conceito já consolidado
→ explicação curta
→ comando
→ validação necessária
→ continuar
```

Aprofundar somente quando houver:

```text
conceito novo
erro
debugging
risco
decisão técnica
diferença importante de comportamento
```

Evitar:
- repetir longamente conceitos já consolidados;
- pedir saídas de comandos sem necessidade;
- pedir baterias de comandos quando uma evidência basta;
- reconstruir missões concluídas do zero.

## Regra para arquivos de contexto

Ao encerrar uma missão/sessão significativa:

```text
usar como modelo o contexto de continuidade anterior
↓
registrar somente fatos/evidências realmente observados
↓
preservar roadmap e bloqueios anteriores
↓
registrar estado Git conhecido sem assumi-lo no próximo chat
↓
registrar conceitos consolidados
↓
registrar o que NÃO deve ser repetido como conceito novo
↓
definir ponto exato de retomada
↓
registrar pendências reais
↓
preservar regra de economia de tokens
```

O contexto deve permitir iniciar outro chat exatamente do ponto anterior sem reconstrução extensa.

## Regra para arquivos de comandos

Ao encerrar uma missão:

```text
usar como modelo a cartilha de comandos da missão anterior
↓
registrar comandos realmente praticados
↓
explicar objetivo / efeito / validação / risco / rollback quando aplicável
↓
registrar saídas/evidências importantes
↓
separar comando praticado de comando apenas explicado
↓
não inventar comandos ou resultados
```

O arquivo de comandos é referência operacional, não substitui entendimento nem revisão humana.

---

# ESTADO CONSOLIDADO

Níveis anteriores preservados:

```text
PowerShell: N2 forte, em transição para N3
Git local: N2 forte, entrando em N3
GitHub: fluxo profissional básico executado de forma guiada (N2)
Codex Foundations: N2 forte
Claude Code: não iniciado / bloqueado
```

MISSÃO 005 demonstrou execução guiada de branching, merge e resolução de conflito. Não promover automaticamente para N3: autonomia deve ser comprovada posteriormente sem receita pronta.

Repositório:

```text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

Branch principal ao final do laboratório:

```text
main
```

Última validação informada:

```powershell
git status --short
```

Resultado:

```text
<sem saída>
```

IMPORTANTE: não assumir Working Tree clean em outro chat. Executar nova validação antes de alterar estado.

---

# MISSÃO 005 — MODELO MENTAL CONSOLIDADO

```text
COMMIT
→ snapshot do projeto

BRANCH
→ referência móvel para um commit

HEAD
→ indica a branch/referência atualmente ativa
```

Criação de branch:

```text
main
 ↓
 A
 ↑
feature
```

Após commit exclusivo na feature:

```text
main
 ↓
 A ─── B
       ↑
     feature
       ↑
      HEAD
```

Separações:

```text
branch ≠ pasta separada
branch ≠ cópia completa do projeto
trocar branch pode alterar o Working Tree
diff de branches ≠ log de commits entre branches
divergência ≠ conflito
resolver conteúdo ≠ marcar resolução no Git ≠ concluir merge
```

---

# LABORATÓRIO 1 — CRIAÇÃO, DIVERGÊNCIA SIMPLES E FAST-FORWARD

Estado inicial validado:

```text
git status --short → sem saída
branch atual → main
```

Branch criada:

```powershell
git switch -c feature/missao-005-branching
```

Saída:

```text
Switched to a new branch 'feature/missao-005-branching'
```

Validação inicial:

```powershell
git log --oneline --decorate --graph -5
```

Evidência:

```text
d8e6688 (HEAD -> feature/missao-005-branching, main)
```

As duas branches apontavam para o mesmo commit.

Arquivo de laboratório criado:

```powershell
New-Item .\branching_lab.txt -ItemType File
Set-Content .\branching_lab.txt "MISSÃO 005 - alteração criada na feature branch"
```

Estado:

```text
?? branching_lab.txt
```

Staging:

```powershell
git add .\branching_lab.txt
```

Commit:

```powershell
git commit -m "lab: pratica branching na missao 005"
```

Commit observado:

```text
6adf5ab
```

Evidência:

```text
6adf5ab (HEAD -> feature/missao-005-branching)
d8e6688 (main)
```

Ao executar:

```powershell
git switch main
```

`Get-ChildItem .\branching_lab.txt` não localizou o arquivo na `main`, comprovando que o Working Tree foi materializado conforme o snapshot da branch selecionada.

Comparação de conteúdo:

```powershell
git diff main..feature/missao-005-branching
```

Mostrou `branching_lab.txt` e seu conteúdo somente na feature.

Comparação de commits:

```powershell
git log main..feature/missao-005-branching --oneline
```

Resultado:

```text
6adf5ab (feature/missao-005-branching) lab: pratica branching na missao 005
```

Merge na `main`:

```powershell
git merge feature/missao-005-branching
```

Resultado comprovado pelo log como fast-forward:

```text
6adf5ab (HEAD -> main, feature/missao-005-branching)
```

Branch removida com segurança:

```powershell
git branch -d feature/missao-005-branching
```

Resultado:

```text
Deleted branch feature/missao-005-branching (was 6adf5ab).
```

---

# LABORATÓRIO 2 — DIVERGÊNCIA REAL E THREE-WAY MERGE SEM CONFLITO

Branch:

```text
feature/missao-005-divergencia
```

Commit exclusivo da feature:

```text
b5dcbba lab: adiciona alteracao na feature divergente
```

Commit exclusivo da `main`:

```text
2954d75 lab: adiciona alteracao divergente na main
```

Grafo observado:

```text
* 2954d75 (HEAD -> main)
| * b5dcbba (feature/missao-005-divergencia)
|/
* 6adf5ab
```

Como as branches alteraram arquivos diferentes, o merge foi automático:

```powershell
git merge feature/missao-005-divergencia
```

Saída:

```text
Merge made by the 'ort' strategy.
feature_divergencia.txt | 1 +
1 file changed, 1 insertion(+)
create mode 100644 feature_divergencia.txt
```

Merge commit observado:

```text
cd0f534 (HEAD -> main) Merge branch 'feature/missao-005-divergencia'
```

Conceito:

```text
FAST-FORWARD
→ não existe divergência da branch de destino
→ referência pode simplesmente avançar

THREE-WAY MERGE
→ branches divergiram a partir de ancestral comum
→ Git combina os históricos
→ pode criar merge commit

THREE-WAY MERGE
≠
conflito obrigatório
```

---

# LABORATÓRIO 3 — CONFLITO CONTROLADO E RESOLUÇÃO MANUAL

Branch:

```text
feature/missao-005-conflito
```

Mesma linha de `branching_lab.txt` foi alterada de formas diferentes.

Commit na feature:

```text
1ae9421 lab: altera arquivo pela feature
```

Commit na main:

```text
122f40e lab: altera arquivo pela main
```

Divergência observada:

```text
* 122f40e (HEAD -> main)
| * 1ae9421 (feature/missao-005-conflito)
|/
* cd0f534
```

Merge:

```powershell
git merge feature/missao-005-conflito
```

Saída:

```text
Auto-merging branching_lab.txt
CONFLICT (content): Merge conflict in branching_lab.txt
Automatic merge failed; fix conflicts and then commit the result.
```

`git status` mostrou:

```text
You have unmerged paths.
both modified: branching_lab.txt
```

Arquivo mostrou conflict markers:

```text
<<<<<<< HEAD
MISSÃO 005 - versão da MAIN
=======
MISSÃO 005 - versão da FEATURE
>>>>>>> feature/missao-005-conflito
```

Interpretação:

```text
<<<<<<< HEAD
→ versão da branch atual (main)

=======
→ separador

>>>>>>> feature/...
→ versão da branch sendo integrada
```

Resolução humana escolhida:

```powershell
Set-Content .\branching_lab.txt "MISSÃO 005 - versão resolvida: MAIN + FEATURE"
```

Após editar, `git status --short` ainda mostrou:

```text
UU branching_lab.txt
```

Lição:

```text
arquivo corrigido no filesystem
≠
Git considerar conflito resolvido
```

Resolução marcada:

```powershell
git add .\branching_lab.txt
```

Merge concluído:

```powershell
git commit -m "lab: resolve conflito entre main e feature"
```

Merge commit:

```text
b859067 (HEAD -> main) lab: resolve conflito entre main e feature
```

Branch de conflito foi removida com `git branch -d` e o usuário confirmou:

```text
git branch → main
git status --short → sem saída
```

---

# VIM — INTRODUÇÃO OPERACIONAL CONCLUÍDA

Vim apareceu como editor durante operação Git.

Separação:

```text
Vim ≠ Git
```

Modelo mínimo:

```text
NORMAL
  │
  └─ i → INSERT
           │
           └─ Esc → NORMAL
```

Comandos explicados:

```text
i
→ entrar em Insert mode

Esc
→ voltar ao Normal mode

:w
→ salvar

:q
→ sair

:wq
→ salvar e sair

:q!
→ sair descartando alterações

:qa
→ sair de todas as janelas/buffers aplicáveis

:qa!
→ forçar saída de todos descartando alterações não salvas
```

Navegação básica explicada:

```text
h → esquerda
j → baixo
k → cima
l → direita
```

Regra operacional:

```text
se estiver perdido
→ Esc
→ escolher conscientemente o comando
```

`:qa` foi explicitamente solicitado pelo usuário para registro.

Vim foi apenas introduzido operacionalmente; não tratar como competência aprofundada.

---

# CONCEITOS CONSOLIDADOS NA MISSÃO 005

```text
branch como referência móvel
HEAD
branch atual
criação + troca com git switch -c
Working Tree acompanha branch selecionada
comparação entre branches
git diff main..feature
git log main..feature
fast-forward
divergência
ancestral comum
three-way merge
merge commit
estratégia ort observada
conflito de conteúdo
unmerged paths
both modified
conflict markers
HEAD dentro de conflict marker
resolução manual
UU
git add para marcar resolução
git commit para concluir merge
git branch -d para remoção segura
Vim operacional básico
```

---

# NÃO REPETIR COMO CONCEITO NOVO

Não reconstruir do zero:

```text
o que é branch em nível introdutório
HEAD em nível introdutório
git switch -c
git branch --show-current
git branch
git branch -d
git diff entre branches
git log entre branches
fast-forward
divergência
three-way merge básico
merge commit
conflito básico
conflict markers
resolução manual básica
git add após conflito
commit de resolução
Vim: i, Esc, :w, :q, :wq, :q!, :qa, :qa!
```

Microexplicações continuam permitidas quando necessárias.

---

# GIT — COMMITS RELEVANTES DA MISSÃO 005

```text
6adf5ab  lab: pratica branching na missao 005
b5dcbba  lab: adiciona alteracao na feature divergente
2954d75  lab: adiciona alteracao divergente na main
cd0f534  Merge branch 'feature/missao-005-divergencia'
1ae9421  lab: altera arquivo pela feature
122f40e  lab: altera arquivo pela main
b859067  lab: resolve conflito entre main e feature
```

Não foi realizado push durante esta missão após esses laboratórios.

O `git status` durante a resolução informou que a `main` estava à frente de `origin/main` por 8 commits naquele momento.

Não assumir que esse número continuará igual no próximo chat.

---

# PONTO EXATO DE RETOMADA

No próximo chat:

```text
1. carregar este contexto
2. preservar MISSÃO 004 / Claude Code como bloqueada
3. iniciar MISSÃO 006 — PR / Diff
4. antes de qualquer alteração:
   git status --short
5. não repetir MISSÃO 005
```

Objetivo inicial da MISSÃO 006:

```text
intenção
↓
commits
↓
arquivos
↓
diff
↓
risco
↓
review
↓
PR
```

A MISSÃO 006 deve aproveitar diretamente os conceitos de branch, histórico, divergência e diff consolidados aqui.

---

# ESTILO PEDAGÓGICO

Preservar:

```text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

E a regra:

```text
ANTES DE ALTERAR ESTADO
↓
OBSERVAR ESTADO
↓
ENTENDER IMPACTO
↓
EXECUTAR
↓
VALIDAR
```

Separar debugging em:

```text
FATO
EVIDÊNCIA
HIPÓTESE
TESTE
CONCLUSÃO
```

Aplicar permanentemente a regra de economia de tokens definida neste contexto.
