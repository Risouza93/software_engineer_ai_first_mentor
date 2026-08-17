# CONTEXTO DE CONTINUIDADE — MISSÃO 006 / PR-DIFF EM ANDAMENTO

Data: 17/08/2026  
Formação: Software Engineer AI-First Mentor  
Missões anteriores: MISSÕES 001–003 — CONCLUÍDAS  
MISSÃO 004 — AI Coding Tools Foundations — PARCIAL (Codex concluído; Claude Code bloqueado/adiado por dependência corporativa)  
MISSÃO 005 — Branching — CONCLUÍDA  
Missão atual: MISSÃO 006 — PR / Diff — EM ANDAMENTO  
Ponto exato de retomada no próximo chat: concluir prevenção de encoding no repositório, revisar/commitar/pushar a correção no PR #2 e prosseguir com review formal do Pull Request.

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
MISSÃO 006 — PR / Diff                      ◐ EM ANDAMENTO
```

Claude Code continua adiado, não concluído nem descartado.

---

# REGRAS DE CONTEXTO, COMANDOS E ECONOMIA DE TOKENS

Preservar a regra:

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

Ao retomar:
- não reconstruir MISSÕES 001–005;
- não assumir Working Tree clean;
- validar estado antes de alterar;
- registrar somente fatos/evidências realmente observados;
- manter Claude Code como bloqueado/adiado;
- usar debugging por evidências.

---

# ESTADO GIT / GITHUB CONHECIDO

Repositório:

```text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

Branch de trabalho da MISSÃO 006:

```text
feature/missao-006-pr-diff
```

Último commit conhecido da feature antes da correção de encoding:

```text
6ae77ee lab: adiciona arquivo para pratica de PR e diff
```

A branch foi publicada com:

```powershell
git push -u origin feature/missao-006-pr-diff
```

Push observado como bem-sucedido e upstream configurado.

Pull Request:

```text
PR #2
Status observado: Open
Base: main
Compare: feature/missao-006-pr-diff
```

Foi criado um comentário de review apontando caracteres acentuados corrompidos no diff.

IMPORTANTE:
- não foi observado merge do PR #2;
- não foi observado commit/push da correção de encoding;
- não assumir Working Tree clean no próximo chat.

---

# DIVERGÊNCIA CONTROLADA USADA PARA APRENDER DIFF

Commit exclusivo local da main:

```text
31d1136 lab: adiciona alteracao exclusiva da main
```

Commit exclusivo da feature:

```text
6ae77ee lab: adiciona arquivo para pratica de PR e diff
```

Ancestral comum observado:

```text
37fab5f (origin/main)
```

Grafo observado:

```text
* 31d1136 (main) lab: adiciona alteracao exclusiva da main
| * 6ae77ee (feature/missao-006-pr-diff) lab: adiciona arquivo para pratica de PR e diff
|/
* 37fab5f (origin/main) Atualizando Progress Ledger
```

A alteração local exclusiva da main não foi publicada durante o laboratório.

---

# CONCEITOS CONSOLIDADOS NA MISSÃO 006 ATÉ AQUI

## Diff local

```text
git diff
→ Working Tree vs Staging/Index

git diff --staged
→ Staging/Index vs HEAD
```

Foi praticado `git add -N` para tornar um arquivo untracked visível em `git diff` sem adicionar seu conteúdo completo ao staging.

## Anatomia de diff

Foram interpretados:

```text
diff --git
new file mode
index
--- /dev/null
+++ b/arquivo
@@ -0,0 +1 @@
+linha adicionada
```

## Dois pontos vs três pontos

Foi comprovado na prática:

```text
git diff main..feature
→ compara as pontas atuais

git diff main...feature
→ compara merge-base com a ponta da feature
→ aproxima melhor a pergunta “o que a feature introduziu?”
```

Com divergência real, `main..feature` mostrou `main_pr_lab.txt` como deletado na transformação entre snapshots, embora a feature não tivesse apagado esse arquivo.

`main...feature` mostrou apenas `pr_diff_lab.txt`, introduzido pela feature desde o ancestral comum.

## PR

Modelo consolidado:

```text
base
→ onde a mudança pretende entrar

compare
→ branch que propõe a mudança
```

Preview observado no GitHub antes de criar o PR:
- 1 commit;
- 1 arquivo alterado;
- 1 adição;
- 0 deleções;
- `pr_diff_lab.txt`.

PR #2 foi criado e ficou Open.

---

# INCIDENTE DE ENCODING — DEBUGGING REAL

Sintoma:
- `git diff` mostrou sequências como `<C3>`, `<E7>`, `<E3>`, `<E1>`;
- GitHub mostrou caracteres `�` em texto com acentuação;
- `Get-Content .\pr_diff_lab.txt` no Windows PowerShell exibiu o texto corretamente.

Ambiente confirmado:

```text
Windows PowerShell 5.1
Major 5
Minor 1
Build 26100
Revision 9168
```

Hipótese consolidada:
- arquivos de laboratório criados por `Set-Content` no Windows PowerShell 5.1 foram gravados em encoding legado do Windows;
- o mesmo PowerShell conseguia lê-los, mas o conteúdo não era UTF-8 válido para ferramentas modernas/GitHub.

Primeira tentativa de varredura produziu muitos falsos positivos por erro de resolução de caminhos relativos.

Erro observado:

```text
DirectoryNotFoundException
```

Exemplo de caminho incorretamente resolvido:

```text
C:\Users\richard.feitosa\Documents\ia\context\commands\...
```

Raiz Git confirmada:

```text
C:/Users/richard.feitosa/Documents/ia/software_engineer_ai_first_mentor
```

Correção do diagnóstico:
- obter raiz com `git rev-parse --show-toplevel`;
- construir caminhos absolutos com `Join-Path`.

Após corrigir os caminhos, somente quatro arquivos foram realmente identificados como UTF-8 inválido:

```text
branching_lab.txt
feature_divergencia.txt
main_divergencia.txt
pr_diff_lab.txt
```

Esses quatro arquivos foram convertidos de encoding legado do Windows para UTF-8 sem BOM.

Validação final informada pelo usuário:

```text
Arquivos ainda inválidos como UTF-8: 0
```

Também foi observado anteriormente:

```powershell
git diff --check
```

com resultado sem saída.

IMPORTANTE:
- a validação UTF-8 chegou a zero;
- o estado Git após a conversão não foi registrado de forma conclusiva nesta continuidade;
- antes de commit/push, revisar `git status --short`, `git diff --stat` e o diff dos quatro arquivos.

---

# PREVENÇÃO DE ENCODING DEFINIDA PARA A RETOMADA

Estratégia escolhida:

```text
.editorconfig
→ charset = utf-8
→ orienta editores compatíveis a salvar texto em UTF-8

scripts/validate-utf8.ps1
→ valida arquivos textuais versionados
→ usa UTF8Encoding estrito
→ retorna exit code 1 quando encontrar arquivo inválido
```

Arquivos foram preparados pelo mentor para integração no repositório, mas NÃO registrar como commitados/publicados até existir evidência.

Regra operacional para Windows PowerShell 5.1:

```text
evitar Set-Content sem -Encoding para texto com caracteres fora de ASCII

se usar Set-Content no PowerShell 5.1
→ especificar encoding conscientemente

preferência de longo prazo
→ PowerShell moderno para UTF-8 sem BOM por padrão
```

Não usar `working-tree-encoding` de `.gitattributes` como solução automática neste momento; Git trata blobs como bytes e esse atributo adiciona conversão explícita no checkout/check-in, o que não é necessário para este repositório agora.

---

# NÃO REPETIR COMO CONCEITO NOVO

Não reconstruir do zero:

```text
git diff
git diff --staged
git add -N
anatomia básica de diff
new file mode
/dev/null
hunk header básico
branch vs commit vs HEAD
divergência
merge-base em nível introdutório
main..feature
main...feature
base vs compare
criação básica de PR
comentário de review
PowerShell 5.1 como causa do incidente de encoding
validação UTF-8 estrita
resolução de caminhos com git rev-parse + Join-Path
```

Microexplicações continuam permitidas quando necessárias.

---

# PONTO EXATO DE RETOMADA

No próximo chat:

```text
1. carregar este contexto
2. validar estado atual:
   git status --short
   git branch --show-current
3. integrar a prevenção:
   .editorconfig
   scripts/validate-utf8.ps1
4. executar:
   .\scripts\validate-utf8.ps1
5. revisar:
   git diff --stat
   git diff
6. confirmar que a correção alterou somente encoding/prevenção esperada
7. fazer staging conscientemente
8. criar commit de correção/prevenção
9. push na feature
10. confirmar atualização automática do PR #2
11. verificar se o diff do GitHub exibe acentos corretamente
12. continuar MISSÃO 006:
    comentário vs review vs Approve vs Request changes
    riscos
    testes
    decisão de merge
```

Não fazer merge automaticamente.

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

Debugging:

```text
FATO
↓
EVIDÊNCIA
↓
HIPÓTESE
↓
TESTE
↓
CONCLUSÃO
```

Aplicar permanentemente a regra de economia de tokens.
