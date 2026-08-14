# COMANDOS — MISSÃO 004 — AI CODING TOOLS FOUNDATIONS

> **Objetivo:** servir como referência operacional dos comandos e conceitos
> efetivamente aprendidos e praticados na MISSÃO 004 até o ponto atual.
>
> **Escopo atual:** Parte A — Codex Foundations.
>
> **Como usar:** esta cartilha não substitui revisão humana. Antes de permitir
> alterações por coding agents, confirme objetivo, escopo, estado Git e impacto.
>
> **Ambiente praticado:** Windows + PowerShell + Git + GitHub + Codex

------------------------------------------------------------------------

## 0. Modelo mental

```text
GPT PERSONALIZADO
Professor / Mentor
        ↓
Codex
Coding agent / execução assistida
        ↓
Filesystem + terminal + repositório
        ↓
Git
Rastreabilidade
        ↓
Humano
Revisão e decisão
```

Regra de autonomia:

```text
LEITURA
>
ALTERAÇÃO
>
EXECUÇÃO AUTÔNOMA
```

Modelo de guardrails praticado:

```text
SANDBOX
"até onde pode agir"
        +
PROMPT
"o que deve fazer"
        +
GIT DIFF / STATUS
"o que realmente fez"
        +
HUMANO
"aceitar, corrigir ou rejeitar"
```

------------------------------------------------------------------------

# 1. Instalar Codex no Windows

Forma oficial standalone praticada:

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://chatgpt.com/codex/install.ps1 | iex"
```

**O que faz:** executa o instalador oficial do Codex para Windows via PowerShell.  
**Altera o sistema:** sim, instala a ferramenta.  
**Comunicação externa:** sim.  
**Risco:** executar scripts remotos altera o sistema; usar somente fonte oficial e revisar procedência.  
**Rollback:** depende da forma/versão de instalação; consultar documentação oficial atual antes de remover.

> Instalação é dependente de versão. Consultar documentação oficial OpenAI antes de reutilizar este comando no futuro.

------------------------------------------------------------------------

# 2. Iniciar e autenticar o Codex

Após a instalação, o Codex foi iniciado pelo fluxo oferecido pelo instalador.

Autenticação observada:

```text
✓ Signed in with your ChatGPT account
```

**Conceito:** a autenticação conecta o CLI à conta autorizada para uso do Codex.

**Segurança:**

```text
não copiar token
não colar segredo no chat
não commitar credencial
```

------------------------------------------------------------------------

# 3. Estado observado da sessão

Estado registrado no primeiro laboratório:

```text
OpenAI Codex v0.147.0
model: gpt-5.6-sol
directory: ~\Documents\ia\software_engineer_ai_first_mentor
```

Sandbox observado:

```text
Sandbox ready
Codex can now safely edit files and execute commands in your computer
```

Separação importante:

```text
sandbox
≠
somente leitura
```

O sandbox limita tecnicamente o ambiente de atuação.

O prompt ainda precisa limitar operacionalmente a tarefa.

------------------------------------------------------------------------

# 4. Primeiro prompt — análise somente leitura

Prompt praticado:

```text
Analise este repositório somente em modo de leitura.

Não altere, crie, mova ou exclua arquivos.
Não execute comandos que modifiquem o repositório, o Git ou o sistema.
Não faça commit, push, pull ou merge.

Quero que você:
1. identifique o propósito deste repositório;
2. descreva a estrutura principal de diretórios e arquivos;
3. identifique, pelas evidências encontradas no repositório, qual é a missão atual da formação;
4. indique quais arquivos você usou como evidência.

Ao final, separe claramente fatos encontrados de inferências.
```

**Objetivo:** testar leitura de repositório, descoberta de contexto, evidências e separação entre fatos e inferências.

**Alteração permitida:** nenhuma.

Fluxo:

```text
REPOSITÓRIO
↓
Codex inspeciona
↓
Codex encontra evidências
↓
Codex responde
↓
humano revisa
↓
Git valida ausência de mudanças
```

------------------------------------------------------------------------

# 5. Validar que o agente não alterou o repositório

Comando praticado:

```powershell
git status --short
```

**O que faz:** mostra de forma compacta alterações detectadas no Working Tree e Staging Area.  
**Altera o sistema:** não.  
**Uso no laboratório:** validar independentemente a afirmação do Codex de que não havia alterado arquivos.

Resultado observado após a tarefa somente leitura:

```text
<sem saída>
```

Conclusão do laboratório:

```text
Codex afirmou não alterar
↓
Git não mostrou mudanças
↓
evidência independente obtida
```

------------------------------------------------------------------------

# 6. Primeiro prompt — alteração controlada

Prompt praticado:

```text
Faça uma única alteração controlada no arquivo README.md.

Adicione ao final uma pequena seção chamada "Laboratório Codex", registrando que foi realizada uma primeira análise somente leitura do repositório com Codex.

Regras:
- altere somente README.md;
- não altere nenhum outro arquivo;
- não execute git add, commit, push, pull ou merge;
- não crie arquivos;
- mantenha a alteração pequena;
- depois da edição, informe exatamente o que foi alterado;
- não faça nenhuma outra alteração.
```

**Objetivo:** permitir a primeira escrita com escopo mínimo e explícito.

Escopo:

```text
arquivo permitido: README.md
arquivos adicionais: nenhum
Git add: proibido
commit: proibido
push/pull/merge: proibidos
```

Conceito:

```text
AUTONOMIA COM ESCOPO
```

O agente recebe capacidade de alterar, mas dentro de uma intenção e fronteira explicitamente definidas.

------------------------------------------------------------------------

# 7. Revisar o arquivo alterado

Comando praticado:

```powershell
git diff -- README.md
```

**O que faz:** mostra as diferenças não staged do `README.md` em relação ao estado registrado pelo Git.  
**Altera o sistema:** não.  
**Uso profissional:** revisar exatamente o conteúdo produzido pelo agente antes de aceitar a alteração.

Diff observado:

```diff
+## Laboratório Codex
+
+Foi realizada uma primeira análise somente leitura do repositório com Codex.
```

Review:

```text
intenção
↓
arquivo esperado
↓
conteúdo produzido
↓
impacto
↓
risco
↓
decisão
```

Resultado:

```text
alteração pequena
arquivo correto
conteúdo compatível
nenhuma remoção visível
```

------------------------------------------------------------------------

# 8. Warning de line endings observado

Durante `git diff -- README.md` apareceu:

```text
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it
```

Modelo mental introduzido:

```text
LF
→ terminação de linha comum em Linux/macOS

CRLF
→ terminação de linha historicamente comum no Windows
```

**Tratamento neste laboratório:** não alterar configuração de line endings.

Motivo:

```text
warning de line ending
≠
objetivo da MISSÃO 004
```

Assunto separado para estudo posterior quando necessário.

------------------------------------------------------------------------

# 9. Validar escopo da alteração

Novamente:

```powershell
git status --short
```

**Objetivo:** verificar se o agente respeitou a regra de alterar somente o arquivo autorizado.

Estado esperado conceitualmente:

```text
 M README.md
```

O usuário confirmou a validação como concluída antes da continuidade da missão.

> Antes de qualquer operação futura que dependa do estado atual, executar nova validação. Não assumir Working Tree clean.

------------------------------------------------------------------------

# 10. Fluxo Codex praticado até aqui

```text
INSTALAR
↓
AUTENTICAR
↓
ENTENDER SANDBOX
↓
TAREFA SOMENTE LEITURA
↓
REVISAR RESPOSTA
↓
git status --short
↓
VALIDAR AUSÊNCIA DE ALTERAÇÕES
↓
AUTORIZAR ALTERAÇÃO CONTROLADA
↓
git diff -- README.md
↓
REVISAR CONTEÚDO
↓
git status --short
↓
VALIDAR ESCOPO
↓
DECISÃO HUMANA
```

------------------------------------------------------------------------

# 11. Separações importantes

```text
GPT mentor
≠
Codex coding agent

sandbox
≠
somente leitura

capacidade técnica
≠
autorização operacional

resposta do agente
≠
evidência independente

prompt
≠
Git diff

alterar arquivo
≠
git add

git add
≠
commit

commit
≠
push
```

------------------------------------------------------------------------

# 12. Regra operacional para coding agents

Antes da alteração:

```text
OBJETIVO
↓
ARQUIVOS ENVOLVIDOS
↓
ESTADO GIT
↓
PERMISSÃO CONSCIENTE
```

Depois da alteração:

```text
GIT DIFF
↓
VALIDAÇÃO DE ESCOPO
↓
TESTE / EVIDÊNCIA
↓
DECISÃO HUMANA
```

------------------------------------------------------------------------

# 13. Comandos Git reutilizados na MISSÃO 004

## Verificar alterações de forma compacta

```powershell
git status --short
```

Uso nesta missão:

```text
validar tarefa somente leitura
validar escopo depois da escrita
```

## Revisar alteração de um arquivo específico

```powershell
git diff -- README.md
```

Template:

```powershell
git diff -- <ARQUIVO>
```

Uso:

```text
revisar exatamente o que o coding agent alterou
```

------------------------------------------------------------------------

# 14. Ações deliberadamente NÃO executadas pelo Codex

No laboratório inicial, não foi autorizado ao Codex:

```text
git add
git commit
git push
git pull
git merge
remoção de arquivos
criação de arquivos adicionais
ações destrutivas
permissão administrativa
```

Regra:

```text
coding agent produz trabalho
↓
humano + Git revisam
↓
humano decide próxima ação
```

------------------------------------------------------------------------

# 15. Estado da alteração atual

O `README.md` contém localmente a seção:

```markdown
## Laboratório Codex

Foi realizada uma primeira análise somente leitura do repositório com Codex.
```

Esta alteração foi deliberadamente mantida sem staging/commit durante o laboratório.

Não assumir que o estado permanece igual em outra sessão sem nova evidência.

------------------------------------------------------------------------

# 16. Conceitos consolidados até o ponto atual

```text
Codex CLI
coding agent
autenticação
diretório de trabalho do agente
sandbox
sandbox ≠ somente leitura
tarefa somente leitura
evidência
fato vs inferência
autonomia com escopo
review humano
Git como guardrail
git status --short para validação
git diff de arquivo específico
decisão humana após alteração de IA
```

------------------------------------------------------------------------

# 17. Próximo bloco — ainda não praticado

Não tratar como concluído ainda:

```text
sessão do Codex
contexto
permissões em maior profundidade
comandos essenciais do Codex
fechamento do laboratório Codex
Claude Code
comparação Codex × Claude Code
```

A cartilha deve ser expandida somente quando esses itens forem efetivamente ensinados e praticados.

------------------------------------------------------------------------

# 18. Regra de ouro da MISSÃO 004

```text
NÃO PERGUNTE APENAS:
"O agente conseguiu?"

PERGUNTE:
"O que ele fez?"
↓
"Qual era o escopo autorizado?"
↓
"Qual evidência independente temos?"
↓
"O diff corresponde à intenção?"
↓
"Como validamos?"
↓
"Quem decide aceitar?"
```

Resposta final:

```text
O HUMANO CONTINUA RESPONSÁVEL PELA DECISÃO.
```

------------------------------------------------------------------------

# 19. Estado parcial da MISSÃO 004

```text
MISSÃO 001 — Terminal e PowerShell          ✅
MISSÃO 002 — Git Foundations                ✅
MISSÃO 003 — GitHub                         ✅
MISSÃO 004 — AI Coding Tools Foundations    ← EM ANDAMENTO
             ├── Codex
             │   ├── instalação             ✅
             │   ├── autenticação           ✅
             │   ├── sandbox inicial        ✅
             │   ├── tarefa leitura         ✅
             │   ├── revisão                ✅
             │   ├── alteração controlada   ✅
             │   └── operação aprofundada   ← PRÓXIMA
             └── Claude Code                ← DEPOIS
```
