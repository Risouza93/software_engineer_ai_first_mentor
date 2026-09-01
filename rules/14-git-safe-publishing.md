# REGRA CANÔNICA — GIT SAFE PUBLISHING

**Versão:** 1.0  
**Data:** 27/08/2026  
**Escopo:** universal — aplicável a qualquer repositório Git assistido por Claude/Claude Code

## 1. Finalidade

Esta regra define como o Claude Code deve encerrar alterações com Git de forma segura, auditável e com aprovação humana explícita.

Princípio:

```text
INSPEÇÃO
→ automática

DIFF / VALIDAÇÃO
→ automática

PROPOSTA DE STAGING
→ automática

STAGING + COMMIT
→ somente após GATE 1 humano

PUSH
→ somente após GATE 2 humano

PR
→ autorização separada, se aplicável
```

A autorização para editar arquivos NÃO implica autorização para commit, push ou publicação remota.

---

## 2. Modelo mental obrigatório

```text
git status
→ quais arquivos mudaram?

git diff
→ o que mudou antes do staging?

git diff --staged
→ o que está prestes a entrar no commit?

git commit
→ o que foi gravado localmente?

git show HEAD
→ o que realmente entrou no commit?

git push
→ o que será publicado no remoto?
```

---

## 3. Baseline obrigatório

Antes de preparar qualquer commit, executar:

```powershell
git status
git status --short
git branch --show-current
git branch -vv
git log --oneline --decorate --graph -10
```

Se a branch atual for `main` ou `master`, parar antes do staging e informar o risco.

Não criar commit na branch principal sem autorização explícita.

---

## 4. Diff como evidência obrigatória

Antes do staging:

```powershell
git diff --stat
git diff
git diff --check
git status --short
```

Inspecionar também arquivos untracked individualmente quando forem candidatos ao commit.

Nunca propor commit sem analisar o diff real.

Classificar:

```text
DEVE ENTRAR
→ ...

NÃO DEVE ENTRAR
→ ...

PRECISA DE DECISÃO
→ ...

RISCOS
→ ...
```

---

## 5. Proposta de staging e commit

Com base no diff, propor:

- arquivos específicos para staging;
- mensagem de commit;
- justificativa;
- comandos exatos que seriam executados.

Preferir:

```powershell
git add <arquivo1> <arquivo2>
```

Evitar por padrão:

```powershell
git add .
git add -A
```

quando for possível selecionar explicitamente os arquivos.

Nesta etapa, apenas MOSTRAR os comandos.

Não executar staging nem commit.

---

## 6. GATE 1 — autorização para staging + commit

Parar e solicitar autorização explícita.

Formato recomendado:

```text
GATE 1 — COMMIT

Arquivos:
→ ...

Mensagem:
→ ...

Comandos planejados:
→ ...

Posso preparar o staging, validar o staged diff e, se ele corresponder ao plano aprovado, realizar o commit?
```

Somente prosseguir após autorização explícita.

Silêncio não é autorização.

Autorização anterior para editar arquivos não é autorização para commit.

---

## 7. Staged diff obrigatório

Após autorização do Gate 1:

```powershell
git add <arquivos-aprovados>
git status
git status --short
git diff --staged --stat
git diff --staged
git diff --staged --check
```

Validar:

- arquivos staged são exatamente os aprovados;
- conteúdo staged corresponde ao plano;
- nenhum arquivo incidental entrou;
- nenhum segredo entrou;
- `git diff --staged --check` está limpo.

Se houver divergência, NÃO fazer commit.

Parar e reportar.

---

## 8. Commit

Somente quando:

```text
GATE 1 aprovado
+
staging corresponde ao plano
+
staged diff validado
```

executar:

```powershell
git commit -m "<mensagem-aprovada>"
```

Não alterar silenciosamente a mensagem aprovada.

Depois validar:

```powershell
git status
git status --short
git log -1 --oneline --decorate
git show --stat --oneline HEAD
git show --format=fuller --stat HEAD
```

Quando necessário para comprovar o patch:

```powershell
git show HEAD
```

---

## 9. GATE 2 — autorização para push

Após o commit, não executar push automaticamente.

Verificar:

```powershell
git branch --show-current
git branch -vv
git status
git log --oneline --decorate --graph -5
```

Determinar:
- branch local;
- upstream;
- commit a publicar;
- remote;
- comando exato.

Se a branch não tiver upstream:

```powershell
git push -u origin <branch-atual>
```

Se upstream estiver correto:

```powershell
git push
```

Apresentar:

```text
GATE 2 — PUSH

Branch local:
→ ...

Destino remoto:
→ ...

Commit:
→ ...

Comando:
→ ...

Posso enviar este commit para o remoto agora?
```

Somente prosseguir após nova autorização explícita.

Autorização para commit NÃO autoriza push.

---

## 10. Pós-push

Após autorização e push:

```powershell
git status
git branch -vv
git log -1 --oneline --decorate
```

Reportar:

```text
PUSH
→ realizado / falhou

BRANCH LOCAL
→ ...

UPSTREAM
→ ...

COMMIT
→ ...

SINCRONIZAÇÃO
→ ...

WORKING TREE
→ ...

PRÓXIMO PASSO
→ ...
```

---

## 11. Pull Request

Pull Request exige autorização separada quando houver ferramenta capaz de criá-lo.

Antes de criar PR, apresentar:

- branch origem;
- branch destino;
- commits envolvidos;
- título sugerido;
- resumo sugerido.

Não criar automaticamente.

---

## 12. Operações proibidas por padrão

Não executar sem autorização específica:

```powershell
git merge
git rebase
git reset --hard
git clean
git commit --amend
git push --force
git push --force-with-lease
git checkout -- .
git restore .
```

Também não:
- descartar trabalho;
- alterar Git global;
- incluir segredos/tokens;
- publicar diretamente em branch principal sem autorização.

---

## 13. Regra de segurança para branch principal

Se `git branch --show-current` retornar `main` ou `master`:

```text
PARAR
→ explicar
→ sugerir branch dedicada
→ aguardar decisão humana
```

Não preparar staging/commit automaticamente na branch principal.

---

## 14. Relação com regras de artefatos

Se o projeto possuir regras de edição/automação de artefatos, elas devem ser respeitadas antes desta política de publicação.

Exemplo:

```text
editar artefatos
→ política local de edição

atualizar memória
→ política local/universal de memory

publicar alterações
→ esta regra Git
```

Esta política governa staging, commit, push e publicação; não substitui regras de conteúdo.

---

## 15. Critério de sucesso

O encerramento deve permitir responder com evidência:

```text
O que mudou?
→ git diff

O que foi selecionado?
→ git diff --staged

O que foi gravado?
→ git show HEAD

O que foi publicado?
→ push + upstream

Quem autorizou commit?
→ humano

Quem autorizou push?
→ humano
```

---

## 16. Fluxo canônico

```text
STATUS
↓
BRANCH
↓
LOG
↓
DIFF
↓
DIFF --CHECK
↓
REVISÃO
↓
PROPOSTA DE STAGING
↓
PROPOSTA DE COMMIT
↓
🛑 GATE 1
↓
STAGING
↓
STAGED DIFF
↓
STAGED DIFF --CHECK
↓
COMMIT
↓
SHOW / LOG / STATUS
↓
🛑 GATE 2
↓
PUSH
↓
VALIDAÇÃO FINAL
```

Nunca priorizar velocidade sobre rastreabilidade.

---

<!-- ALTERADO 2026-08-27: relatórios persistentes de execução delegados à regra canônica 15. -->
<!-- ALTERADO 2026-09-01: nome do arquivo da regra 15 atualizado para o caminho real em rules/. -->
## 17. Relatório da execução

A persistência do relatório técnico da execução segue:

`rules/15-universal-execution-reports.md`

A criação do relatório não concede autorização para staging, commit ou push.

O relatório somente pode entrar no staging após aparecer no Gate 1 e ser aprovado pelo humano.
