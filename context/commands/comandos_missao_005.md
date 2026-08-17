# COMANDOS — MISSÃO 005 — BRANCHING

> **Objetivo:** referência operacional dos comandos e conceitos efetivamente praticados na MISSÃO 005.
>
> **Escopo:** branches, HEAD, comparação, fast-forward, divergência, three-way merge, conflito controlado, resolução e introdução operacional ao Vim.
>
> **Como usar:** observar o estado antes de alterar. Esta cartilha registra o laboratório executado; não substitui entendimento do histórico e do impacto.
>
> **Ambiente praticado:** Windows + PowerShell + Git.

------------------------------------------------------------------------

# 0. Modelo mental

```text
COMMIT
→ snapshot

BRANCH
→ referência móvel para commit

HEAD
→ referência da posição/branch ativa
```

Regra:

```text
OBSERVAR
↓
ENTENDER
↓
EXECUTAR
↓
VALIDAR
```

------------------------------------------------------------------------

# 1. Verificar estado antes de alterar

```powershell
git status --short
```

**Faz:** mostra alterações de Working Tree/Staging de forma compacta.  
**Altera:** não.  
**Validação praticada:** sem saída = nenhuma alteração detectada naquele momento.

------------------------------------------------------------------------

# 2. Ver branch atual

```powershell
git branch --show-current
```

**Faz:** mostra a branch atual.  
**Altera:** não.

Resultado observado inicialmente:

```text
main
```

------------------------------------------------------------------------

# 3. Criar e trocar para branch

```powershell
git switch -c feature/missao-005-branching
```

**Faz:** cria uma branch e troca HEAD para ela.  
**Altera:** referências Git/branch ativa; não cria commit automaticamente.  
**Validação:** `git branch --show-current` ou `git log --decorate`.

------------------------------------------------------------------------

# 4. Inspecionar histórico e referências

```powershell
git log --oneline --decorate --graph -5
```

Também praticado:

```powershell
git log --oneline --decorate --graph --all -7
git log --oneline --decorate --graph --all -8
```

**Faz:** exibe histórico compacto, referências e grafo.  
**`--all`:** inclui referências de outras branches na visualização.  
**Altera:** não.

Evidência inicial:

```text
d8e6688 (HEAD -> feature/missao-005-branching, main)
```

------------------------------------------------------------------------

# 5. Criar arquivo de laboratório

```powershell
New-Item .\branching_lab.txt -ItemType File
```

**Faz:** cria arquivo vazio.  
**Altera:** filesystem.  
**Rollback:**

```powershell
Remove-Item .\branching_lab.txt
```

------------------------------------------------------------------------

# 6. Escrever conteúdo

```powershell
Set-Content .\branching_lab.txt "MISSÃO 005 - alteração criada na feature branch"
```

**Faz:** substitui/grava o conteúdo do arquivo.  
**Altera:** filesystem.  
**Risco:** `Set-Content` substitui o conteúdo existente do arquivo.

------------------------------------------------------------------------

# 7. Estado de arquivo untracked

```powershell
git status --short
```

Resultado observado:

```text
?? branching_lab.txt
```

Significado:

```text
??
→ untracked
```

------------------------------------------------------------------------

# 8. Adicionar arquivo ao staging

```powershell
git add .\branching_lab.txt
```

**Faz:** adiciona o conteúdo atual do arquivo à Staging Area.  
**Altera:** índice/staging do Git.

Rollback do staging:

```powershell
git restore --staged .\branching_lab.txt
```

------------------------------------------------------------------------

# 9. Commit exclusivo da feature

```powershell
git commit -m "lab: pratica branching na missao 005"
```

Commit observado:

```text
6adf5ab
```

Conceito:

```text
commit criado na branch ativa
→ branch ativa avança
→ main permanece onde estava
```

------------------------------------------------------------------------

# 10. Trocar de volta para main

```powershell
git switch main
```

**Faz:** troca HEAD para `main` e materializa o snapshot correspondente no Working Tree.  
**Altera:** branch ativa e possivelmente arquivos do Working Tree.

Validação praticada:

```powershell
Get-ChildItem .\branching_lab.txt
```

Na `main`, o arquivo não foi localizado antes da integração.

Lição:

```text
branch ≠ pasta
git switch pode alterar arquivos materializados
```

------------------------------------------------------------------------

# 11. Comparar conteúdo entre branches

```powershell
git diff main..feature/missao-005-branching
```

**Faz:** mostra diferença de conteúdo entre as referências informadas.  
**Altera:** não.

Resultado: mostrou a criação de `branching_lab.txt` e seu conteúdo.

Foi observada representação de caracteres acentuados como `<C3>`, `<E7>`, `<E3>` na saída. O tema de encoding não foi investigado nesta missão.

------------------------------------------------------------------------

# 12. Comparar commits entre branches

```powershell
git log main..feature/missao-005-branching --oneline
```

Resultado:

```text
6adf5ab (feature/missao-005-branching) lab: pratica branching na missao 005
```

Modelo:

```text
git diff
→ conteúdo diferente

git log main..feature
→ commits alcançáveis pela feature e não pela main
```

------------------------------------------------------------------------

# 13. Fast-forward merge

Na `main`:

```powershell
git merge feature/missao-005-branching
```

Resultado confirmado pelo log:

```text
6adf5ab (HEAD -> main, feature/missao-005-branching)
```

Conceito:

```text
main não divergiu
→ Git pode avançar a referência
→ fast-forward
```

------------------------------------------------------------------------

# 14. Remover branch integrada com segurança

```powershell
git branch -d feature/missao-005-branching
```

Resultado:

```text
Deleted branch feature/missao-005-branching (was 6adf5ab).
```

**`-d`:** remoção segura de branch já integrada.  
**Risco:** remove a referência da branch; commits preservados por outras referências continuam no histórico.

Validação:

```powershell
git branch
```

------------------------------------------------------------------------

# 15. Criar branch para divergência

```powershell
git switch -c feature/missao-005-divergencia
```

Arquivo exclusivo:

```powershell
Set-Content .\feature_divergencia.txt "Alteração criada na feature"
git add .\feature_divergencia.txt
git commit -m "lab: adiciona alteracao na feature divergente"
```

Commit:

```text
b5dcbba
```

------------------------------------------------------------------------

# 16. Criar commit diferente na main

```powershell
git switch main
Set-Content .\main_divergencia.txt "Alteração criada diretamente na main durante o laboratório"
git add .\main_divergencia.txt
git commit -m "lab: adiciona alteracao divergente na main"
```

Commit:

```text
2954d75
```

Validação:

```powershell
git log --oneline --decorate --graph --all -7
```

Grafo observado:

```text
* 2954d75 (HEAD -> main)
| * b5dcbba (feature/missao-005-divergencia)
|/
* 6adf5ab
```

------------------------------------------------------------------------

# 17. Three-way merge sem conflito

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

Merge commit:

```text
cd0f534
```

Lição:

```text
divergência
≠
conflito

three-way merge
pode ser automático
```

------------------------------------------------------------------------

# 18. Criar conflito controlado

Branch:

```powershell
git switch -c feature/missao-005-conflito
```

Na feature:

```powershell
Set-Content .\branching_lab.txt "MISSÃO 005 - versão da FEATURE"
git add .\branching_lab.txt
git commit -m "lab: altera arquivo pela feature"
```

Commit:

```text
1ae9421
```

Na main:

```powershell
git switch main
Set-Content .\branching_lab.txt "MISSÃO 005 - versão da MAIN"
git add .\branching_lab.txt
git commit -m "lab: altera arquivo pela main"
```

Commit:

```text
122f40e
```

------------------------------------------------------------------------

# 19. Provocar o merge conflitante

```powershell
git merge feature/missao-005-conflito
```

Saída observada:

```text
Auto-merging branching_lab.txt
CONFLICT (content): Merge conflict in branching_lab.txt
Automatic merge failed; fix conflicts and then commit the result.
```

------------------------------------------------------------------------

# 20. Inspecionar conflito

```powershell
git status
```

Trecho observado:

```text
You have unmerged paths.
both modified: branching_lab.txt
```

Arquivo:

```powershell
Get-Content .\branching_lab.txt
```

Resultado:

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
→ versão atual/main

=======
→ separador

>>>>>>> feature/...
→ versão recebida da feature
```

------------------------------------------------------------------------

# 21. Abortar merge — comando mostrado pelo próprio Git

Durante `git status`, o Git exibiu:

```powershell
git merge --abort
```

**Finalidade:** abortar o merge em andamento e tentar retornar ao estado anterior ao merge.

**Importante:** foi apresentado pela saída do Git, mas NÃO foi executado neste laboratório.

------------------------------------------------------------------------

# 22. Resolver conteúdo manualmente

Decisão do laboratório:

```powershell
Set-Content .\branching_lab.txt "MISSÃO 005 - versão resolvida: MAIN + FEATURE"
```

Validação:

```powershell
Get-Content .\branching_lab.txt
git status --short
```

Resultado do status:

```text
UU branching_lab.txt
```

Conceito:

```text
editar conteúdo
≠
marcar conflito como resolvido
```

------------------------------------------------------------------------

# 23. Marcar resolução

```powershell
git add .\branching_lab.txt
```

**Faz:** atualiza o índice com a versão resolvida e informa ao Git que aquele conflito foi resolvido.

------------------------------------------------------------------------

# 24. Concluir merge após resolução

```powershell
git commit -m "lab: resolve conflito entre main e feature"
```

Merge commit:

```text
b859067
```

Validação:

```powershell
git log --oneline --decorate --graph --all -8
git status --short
```

Ao final, o usuário confirmou `git status --short` sem saída.

------------------------------------------------------------------------

# 25. Remover branch de conflito integrada

```powershell
git branch -d feature/missao-005-conflito
```

Validação:

```powershell
git branch
git status --short
```

Resultado final informado:

```text
* main
git status --short → sem saída
```

------------------------------------------------------------------------

# 26. Vim — modelo mínimo

Vim pode ser chamado pelo Git como editor.

```text
Vim
≠
Git
```

Modos essenciais:

```text
NORMAL
→ comandos/navegação

INSERT
→ digitação
```

Entrar em Insert:

```text
i
```

Voltar ao Normal:

```text
Esc
```

------------------------------------------------------------------------

# 27. Vim — salvar e sair

No Normal mode:

```text
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

`:qa` foi explicitamente praticado/solicitado para registro pelo usuário.

Regra operacional:

```text
perdido no Vim
→ Esc
→ comando desejado
→ Enter
```

------------------------------------------------------------------------

# 28. Vim — navegação básica explicada

```text
h → esquerda
j → baixo
k → cima
l → direita
```

Introdução apenas operacional. Não tratar Vim como dominado.

------------------------------------------------------------------------

# 29. Commits relevantes da missão

```text
6adf5ab  lab: pratica branching na missao 005
b5dcbba  lab: adiciona alteracao na feature divergente
2954d75  lab: adiciona alteracao divergente na main
cd0f534  Merge branch 'feature/missao-005-divergencia'
1ae9421  lab: altera arquivo pela feature
122f40e  lab: altera arquivo pela main
b859067  lab: resolve conflito entre main e feature
```

------------------------------------------------------------------------

# 30. Conceitos consolidados

```text
branch
HEAD
referência móvel
git switch
git switch -c
git branch
git branch -d
git diff entre branches
git log entre branches
--all
fast-forward
divergência
ancestral comum
three-way merge
merge commit
ort observado
conflito
both modified
unmerged paths
conflict markers
UU
resolução humana
git add como marcação da resolução
commit de merge após conflito
Vim operacional básico
```

------------------------------------------------------------------------

# 31. Regra de continuidade

Antes de qualquer nova operação Git:

```powershell
git status --short
```

Não assumir Working Tree clean com base nesta sessão.

A próxima missão disponível é:

```text
MISSÃO 006 — PR / Diff
```

Claude Code permanece bloqueado/adiado na Parte B da MISSÃO 004.

------------------------------------------------------------------------

# 32. Regra para futuras cartilhas

Ao finalizar cada missão:

```text
usar a cartilha anterior como modelo
↓
registrar somente comandos praticados
↓
separar praticado de apenas explicado
↓
registrar evidências
↓
explicar risco/rollback quando aplicável
↓
preservar continuidade
```

Aplicar também economia de tokens durante a formação:
explicações concisas para conceitos consolidados e aprofundamento apenas quando necessário.
