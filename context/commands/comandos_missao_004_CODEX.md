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
------------------------------------------------------------------------

# 17. Estado da sessão e `/status`

Comando praticado no Codex:

```text
/status
```

Estado observado:

```text
OpenAI Codex v0.147.0
Model:                gpt-5.6-sol (reasoning low, summaries auto)
Directory:            ~\Documents\ia\software_engineer_ai_first_mentor
Permissions:          Workspace (Ask for approval)
Agents.md:            <none>
Collaboration mode:   Default
Session:              01a00095-7351-7c63-ba1c-45e608fdf0db
```

**Objetivo:** inspecionar a configuração da sessão atual, diretório de trabalho,
permissões, modelo, identidade da sessão e uso de contexto/quota quando exibidos.

Separação importante:

```text
/status
→ estado/configuração da sessão Codex

git status
→ estado do repositório Git
```

Conceito:

```text
sessão Codex
≠
Working Tree
≠
histórico Git
```

------------------------------------------------------------------------

# 18. Permissões do Codex

Comando praticado:

```text
/permissions
```

Opções observadas:

```text
1. Read Only
2. Ask for approval (non-admin sandbox) (current)
3. Approve for me
4. Full Access
```

Configuração utilizada durante o laboratório:

```text
Workspace (Ask for approval)
```

Modelo mental consolidado:

```text
CAPACIDADE
"O agente consegue fazer?"

AUTORIZAÇÃO
"O agente está autorizado a fazer?"

REVISÃO
"Mesmo autorizado, o resultado deve ser aceito?"
```

Separação:

```text
capacidade técnica
≠
autorização operacional
≠
resultado correto
≠
aceitação humana
```

**Decisão do laboratório:** não ampliar para `Full Access`.

Também foi observado que o sandbox atual protege arquivos e restringe rede sob
determinadas condições. O comando `/setup-default-sandbox` foi descoberto, mas
não executado, pois não havia necessidade de alterar a configuração.

------------------------------------------------------------------------

# 19. Slash commands descobertos

A lista real disponível na instalação `v0.147.0` foi inspecionada.

## Comandos efetivamente praticados

```text
/status
/permissions
/diff
/review
/exit
/resume
```

## Comandos estudados conceitualmente, sem necessidade de execução completa

```text
/new
/fork
/archive
/delete
/compact
/mention
/ide
/model
/plan
```

## Recursos apenas descobertos — não tratar como dominados

```text
/fast
/keymap
/vim
/setup-default-sandbox
/sandbox-add-read-dir
/experimental
/approve
/memories
/skills
/import
/hooks
/rename
/app
/init
/goal
/agent
/side
/copy
/raw
/title
/statusline
/theme
/pets
/mcp
/plugins
/logout
/feedback
/ps
/stop
/clear
/personality
/subagents
```

Regra:

```text
descobrir um comando
≠
precisar executá-lo
≠
dominar o recurso
```

------------------------------------------------------------------------

# 20. Sessão, contexto e continuidade

Separação consolidada:

```text
FILESYSTEM
≠
GIT
≠
SESSÃO DO CODEX
≠
CONTEXTO DO MODELO
```

A context window foi observada via `/status`.

Modelo mental:

```text
context window
→ capacidade de contexto disponível ao modelo

arquivos do repositório
→ estado persistente no filesystem

Git
→ rastreabilidade do estado do repositório
```

## `/compact`

Comando estudado:

```text
/compact
```

Finalidade observada:

```text
summarize conversation to prevent hitting the context limit
```

Modelo:

```text
conversa extensa
↓
/compact
↓
resumo do contexto
↓
continuação da sessão
```

Separação:

```text
/compact
≠
git commit
≠
salvar arquivos
≠
limpar Working Tree
≠
encerrar sessão
```

O comando não foi executado artificialmente porque não havia necessidade real.

------------------------------------------------------------------------

# 21. `/diff` — visão integrada do Codex

Comando praticado:

```text
/diff
```

Descrição observada:

```text
show git diff (including untracked files)
```

No laboratório, o resultado relevante coincidiu com o que havia sido observado
diretamente com Git.

Modelo mental:

```text
/diff
→ conveniência integrada ao Codex

git diff
→ consulta direta ao Git
```

Regra:

```text
interface do agente
não substitui
conhecimento operacional de Git
```

------------------------------------------------------------------------

# 22. `/review` — revisão das mudanças atuais

Comando praticado:

```text
/review
```

Descrição observada:

```text
review my current changes and find issues
```

Separação:

```text
/diff
→ mostra mudanças

/review
→ analisa mudanças e procura problemas

humano
→ valida a análise e decide
```

O `/review` encontrou um possível problema de continuidade documental:
referências internas apontavam para nomes antigos de arquivos.

O finding foi tratado como hipótese, não como verdade automática.

------------------------------------------------------------------------

# 23. Validar um finding da IA com evidência independente

Primeiro foram listados os nomes reais dos artefatos:

```powershell
Get-ChildItem .\context\chat_history\*MISSAO_004* | Select-Object Name
```

Resultado observado:

```text
CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
```

Depois foram pesquisadas referências internas no documento:

```powershell
Select-String `
  -Path .\context\chat_history\CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md `
  -Pattern "CONTEXTO.*MISSAO_004"
```

Foram encontradas referências antigas como:

```text
CONTEXTO_INICIO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
CONTEXTO_CONTINUIDADE_MISSAO_004_CODEX_2026-08-14.md
```

Conclusão:

```text
finding da IA
↓
hipótese
↓
filesystem confirma nomes reais
↓
conteúdo confirma referências antigas
↓
VERDADEIRO POSITIVO
```

Regra consolidada:

```text
AI encontrou
≠
AI provou

evidência independente
→ confirma ou refuta
```

------------------------------------------------------------------------

# 24. Correção controlada após AI review

Depois de confirmar o finding, foi autorizada somente a correção das referências
antigas no arquivo:

```text
context/chat_history/CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
```

Substituições autorizadas:

```text
CONTEXTO_INICIO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
→
CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
```

e:

```text
CONTEXTO_CONTINUIDADE_MISSAO_004_CODEX_2026-08-14.md
→
CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
```

A validação foi novamente realizada com `Select-String`.

Fluxo praticado:

```text
IA detecta
↓
humano valida
↓
humano autoriza correção específica
↓
IA corrige
↓
humano valida novamente
```

------------------------------------------------------------------------

# 25. Estado Git encontrado durante a correção

Foi observado:

```text
 M README.md
 D context/chat_history/CONTEXTO_INICIO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
?? context/chat_history/CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md
?? context/chat_history/CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
?? context/commands/comandos_missao_004.md
```

Conceitos revisados:

```text
 M
→ arquivo tracked modificado

 D
→ arquivo tracked ausente/removido no Working Tree

??
→ arquivo untracked
```

Também foi reforçado:

```text
git status
→ mostra estado atual

git status
não prova sozinho
→ quem causou cada mudança
→ quando a mudança ocorreu
```

E:

```text
arquivo existe
≠
arquivo tracked
```

------------------------------------------------------------------------

# 26. Commit e push realizados por decisão humana

Após a correção e revisão, o usuário decidiu executar:

```powershell
git add .
git commit -m "Correções no contexto"
git push
```

Commit observado:

```text
72ab9b3
```

Resumo do commit:

```text
4 files changed, 1143 insertions(+)
rename context/chat_history/{CONTEXTO_INICIO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md => CONTEXTO_SESSAO_MISSAO_004_AI_CODING_TOOLS_2026-08-14.md} (100%)
create mode 100644 context/chat_history/CONTEXTO_SESSAO_MISSAO_004_CODEX_2026-08-14.md
create mode 100644 context/commands/comandos_missao_004.md
```

O Git reconheceu a mudança do primeiro contexto como `rename` de 100%.

Observação importante:

```text
git add .
→ prepara todas as mudanças aplicáveis no diretório atual
```

Portanto, revisar `git status` antes de utilizá-lo continua sendo uma prática
importante.

------------------------------------------------------------------------

# 27. Sair e retomar uma sessão

Comando praticado dentro do Codex:

```text
/exit
```

Depois, no PowerShell:

```powershell
codex resume
```

Objetivo:

```text
/exit
→ sair da execução atual

codex resume
→ localizar e retomar uma sessão salva
```

O primeiro `codex resume` falhou por um problema de resolução do executável no
PowerShell. Esse erro gerou um laboratório real de debugging.

------------------------------------------------------------------------

# 28. Debugging — `codex` não reconhecido

Sintoma:

```powershell
codex resume
```

Erro observado:

```text
CommandNotFoundException
```

Primeiros testes:

```powershell
Get-Command codex -All
where.exe codex
```

Resultados:

```text
Get-Command
→ não reconheceu codex

where.exe
→ não localizou arquivo
```

Conclusão naquele ponto:

```text
resume ainda não havia sido processado
↓
o PowerShell não conseguia resolver "codex"
```

------------------------------------------------------------------------

# 29. Localizar o executável do Codex

Busca praticada:

```powershell
Get-ChildItem `
  "$env:USERPROFILE\.codex", `
  "$env:LOCALAPPDATA", `
  "$env:APPDATA" `
  -Filter "codex*.exe" `
  -Recurse `
  -ErrorAction SilentlyContinue |
  Select-Object FullName
```

Entre os resultados foi encontrado:

```text
C:\Users\richard.feitosa\.codex\packages\standalone\releases\0.147.0-x86_64-pc-windows-msvc\bin\codex.exe
```

O executável foi testado diretamente:

```powershell
& "C:\Users\richard.feitosa\.codex\packages\standalone\releases\0.147.0-x86_64-pc-windows-msvc\bin\codex.exe" resume
```

Resultado:

```text
o Codex abriu corretamente
```

Conclusão:

```text
instalação funcional
+
falha ao executar apenas "codex"
=
problema de resolução/PATH
```

------------------------------------------------------------------------

# 30. Diretório estável do Codex

Foi verificado:

```powershell
Get-ChildItem "$env:LOCALAPPDATA\Programs\OpenAI\Codex\bin"
```

Resultado observado:

```text
codex-code-mode-host.exe
codex.exe
```

Diretório:

```text
C:\Users\richard.feitosa\AppData\Local\Programs\OpenAI\Codex\bin
```

Esse diretório estável foi utilizado para a correção do PATH, evitando apontar
manualmente para a pasta versionada `0.147.0`.

------------------------------------------------------------------------

# 31. Corrigir o PATH do usuário

Código praticado:

```powershell
$codexBin = "$env:LOCALAPPDATA\Programs\OpenAI\Codex\bin"

$userPath = [Environment]::GetEnvironmentVariable("Path", "User")

if (($userPath -split ";") -notcontains $codexBin) {
    [Environment]::SetEnvironmentVariable(
        "Path",
        ($userPath.TrimEnd(";") + ";" + $codexBin),
        "User"
    )
}
```

**O que faz:** adiciona o diretório estável do Codex ao `Path` persistente do
usuário, caso ainda não esteja presente.

**Altera o sistema:** sim, altera uma variável de ambiente do usuário.

Validação do PATH persistente:

```powershell
[Environment]::GetEnvironmentVariable("Path", "User") -split ";" |
Where-Object { $_ -like "*OpenAI*Codex*" }
```

Resultado:

```text
C:\Users\richard.feitosa\AppData\Local\Programs\OpenAI\Codex\bin
```

Comparação com a sessão PowerShell já aberta:

```powershell
$env:PATH -split ";" |
Where-Object { $_ -like "*OpenAI*Codex*" }
```

Inicialmente:

```text
<sem saída>
```

Conceito consolidado:

```text
PATH persistente do usuário
≠
$env:PATH de um processo PowerShell já aberto
```

Foi necessário abrir um novo processo/terminal para herdar o PATH atualizado.

------------------------------------------------------------------------

# 32. Validar a correção do PATH

Em um novo terminal:

```powershell
Get-Command codex
codex --version
codex resume
```

Resultado final:

```text
codex voltou a ser resolvido pelo PowerShell
codex resume abriu a tela de sessões salvas
```

Fluxo de debugging praticado:

```text
SINTOMA
↓
Get-Command / where.exe
↓
EXECUTÁVEL ENCONTRADO
↓
TESTE POR CAMINHO ABSOLUTO
↓
INSTALAÇÃO FUNCIONA
↓
PATH INVESTIGADO
↓
PATH PERSISTENTE CORRIGIDO
↓
NOVO PROCESSO
↓
VALIDAÇÃO
```

------------------------------------------------------------------------

# 33. Continuidade de sessão validada

Na tela de `codex resume`, foi selecionada a sessão anterior.

Depois:

```text
/status
```

A sessão retomada apresentou:

```text
Session: 01a00095-7351-7c63-ba1c-45e608fdf0db
Directory: ~\Documents\ia\software_engineer_ai_first_mentor
Permissions: Workspace (Ask for approval)
Model: gpt-5.6-sol
```

O Session ID era o mesmo observado antes de sair.

Conclusão:

```text
/exit
↓
codex resume
↓
seleção da sessão salva
↓
mesmo Session ID
↓
CONTINUIDADE COMPROVADA
```

------------------------------------------------------------------------

# 34. Fluxo Codex final praticado

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
AUTORIZAR ALTERAÇÃO CONTROLADA
↓
git diff -- README.md
↓
VALIDAR ESCOPO
↓
/status
↓
/permissions
↓
ENTENDER SESSÃO E CONTEXTO
↓
/diff
↓
/review
↓
TRATAR FINDING COMO HIPÓTESE
↓
VALIDAR COM POWERSHELL / GIT
↓
AUTORIZAR CORREÇÃO LIMITADA
↓
VALIDAR NOVAMENTE
↓
DECISÃO HUMANA
↓
/exit
↓
codex resume
↓
DEBUGGING DE PATH
↓
CONTINUIDADE DE SESSÃO CONFIRMADA
```

------------------------------------------------------------------------

# 35. Conceitos consolidados — Codex Foundations

```text
Codex CLI
coding agent
autenticação
diretório de trabalho
workspace
sandbox
permissões
sandbox ≠ somente leitura
capacidade ≠ autorização
autonomia com escopo
sessão
context window
continuidade
resume
compact em nível conceitual
slash commands
/diff
/review
finding de IA como hipótese
Git como guardrail
PowerShell como ferramenta de evidência
debugging de resolução de comando
PATH persistente
PATH de processo
review humano
decisão humana
```

------------------------------------------------------------------------

# 36. Claude Code Foundations — adiado

A Parte B da MISSÃO 004 não foi executada.

Motivo:

```text
a empresa ainda não liberou a licença
+
Claude CLI ainda não foi instalado/configurado pela infraestrutura
```

Status correto:

```text
ADIADO / BLOQUEADO POR DEPENDÊNCIA CORPORATIVA
```

Não tratar Claude Code como concluído.

Não instalar ou contornar controles corporativos por conta própria.

Quando a dependência for resolvida, retomar:

```text
CLAUDE CODE FOUNDATIONS
↓
documentação oficial atual
↓
validar pré-requisitos e configuração corporativa
↓
autenticação
↓
permissões
↓
tarefa somente leitura
↓
alteração controlada
↓
Git diff / status
↓
validação humana
↓
comparação Codex × Claude Code
```

Somente depois atualizar novamente esta cartilha com comandos e evidências
efetivamente praticados.

------------------------------------------------------------------------

# 37. Regra de ouro da MISSÃO 004

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
"O finding da IA foi validado?"
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

# 38. Estado atual da MISSÃO 004

```text
MISSÃO 001 — Terminal e PowerShell          ✅
MISSÃO 002 — Git Foundations                ✅
MISSÃO 003 — GitHub                         ✅
MISSÃO 004 — AI Coding Tools Foundations    ◐ PARCIAL
             ├── Codex Foundations          ✅ CONCLUÍDO
             └── Claude Code Foundations    ⏸ ADIADO / BLOQUEADO
                                                aguardando licença +
                                                CLI/configuração corporativa
```

A Parte Codex está fechada no nível Foundations.

A MISSÃO 004 completa permanece aberta até que Claude Code esteja disponível e
a comparação controlada entre as duas ferramentas seja realizada.

Enquanto a dependência corporativa permanece bloqueada, a formação pode avançar
para a próxima missão disponível do roadmap.

------------------------------------------------------------------------

# 39. Regra de continuidade

Ao retomar Claude Code futuramente:

```text
não reconstruir Codex Foundations do zero
↓
usar esta cartilha como referência
↓
executar somente a Parte B
↓
registrar evidências reais
↓
comparar Codex × Claude Code
↓
atualizar esta cartilha
↓
fechar MISSÃO 004 completa
```

Antes de qualquer nova operação Git:

```powershell
git status --short
```

Não assumir Working Tree clean com base em uma sessão anterior.


------------------------------------------------------------------------

# 40. Histórico persistente do PowerShell com PSReadLine

Foi verificado:

```powershell
Get-Module PSReadLine -ListAvailable |
Select-Object Name, Version, Path
```

Resultado observado:

```text
PSReadLine 2.0.0
```

Também foi inspecionada a configuração do histórico:

```powershell
Get-PSReadLineOption |
Select-Object HistorySavePath, HistorySaveStyle
```

Resultado observado:

```text
HistorySavePath:
C:\Users\richard.feitosa\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt

HistorySaveStyle:
SaveIncrementally
```

Conclusão:

```text
PowerShell já possui histórico persistente
↓
não é necessário criar outro arquivo manualmente
```

------------------------------------------------------------------------

# 41. Inspecionar atalhos de histórico do PSReadLine

Comando praticado:

```powershell
Get-PSReadLineKeyHandler |
Where-Object { $_.Function -match "History" } |
Select-Object Key, Function
```

Key handlers observados:

```text
Alt+F7    ClearHistory
Ctrl+s    ForwardSearchHistory
F8        HistorySearchBackward
Shift+F8  HistorySearchForward
DownArrow NextHistory
UpArrow   PreviousHistory
Ctrl+r    ReverseSearchHistory
```

Separação:

```text
PreviousHistory / NextHistory
→ navegação geral

HistorySearchBackward / HistorySearchForward
→ navegação filtrada pelo prefixo digitado
```

------------------------------------------------------------------------

# 42. Configurar PageUp e PageDown para busca por prefixo

Configuração praticada:

```powershell
Set-PSReadLineKeyHandler -Key PageUp -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key PageDown -Function HistorySearchForward
```

**O que faz:** associa `PageUp` e `PageDown` à busca no histórico usando como
filtro o texto já digitado no prompt.

Exemplo:

```text
digitar:

git s

PageUp
↓
git status --short
```

Outro exemplo:

```text
digitar:

cod

PageUp
↓
codex resume
```

**Altera o sistema:** altera apenas a configuração da sessão PowerShell atual,
a menos que seja colocado no `$PROFILE`.

------------------------------------------------------------------------

# 43. Persistir a configuração no PowerShell Profile

Descobrir o profile:

```powershell
$PROFILE
```

Verificar existência:

```powershell
Test-Path $PROFILE
```

Se necessário, criar:

```powershell
New-Item -ItemType File -Path $PROFILE -Force
```

Abrir para edição:

```powershell
notepad $PROFILE
```

Adicionar:

```powershell
Set-PSReadLineKeyHandler -Key PageUp -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key PageDown -Function HistorySearchForward
```

Modelo:

```text
PowerShell inicia
↓
carrega $PROFILE
↓
configura PSReadLine
↓
PageUp / PageDown usam busca por prefixo
```

------------------------------------------------------------------------

# 44. Validar PageUp e PageDown

Comando:

```powershell
Get-PSReadLineKeyHandler |
Where-Object { $_.Key -in @("PageUp", "PageDown") } |
Select-Object Key, Function
```

Resultado esperado:

```text
PageUp    HistorySearchBackward
PageDown  HistorySearchForward
```

Teste funcional:

```text
digitar prefixo
↓
pressionar PageUp / PageDown
↓
navegar somente por comandos compatíveis
```

------------------------------------------------------------------------

# 45. Inspecionar o arquivo de histórico persistente

Mostrar todo o histórico salvo:

```powershell
Get-Content (Get-PSReadLineOption).HistorySavePath
```

Mostrar somente os últimos comandos:

```powershell
Get-Content (Get-PSReadLineOption).HistorySavePath -Tail 20
```

Modelo mental:

```text
COMANDO EXECUTADO
↓
PSReadLine
↓
ConsoleHost_history.txt
↓
fecha PowerShell
↓
abre nova sessão
↓
digita prefixo
↓
PageUp / PageDown
↓
reencontra comandos anteriores
```

Regra:

```text
arquivo de histórico do PSReadLine
≠
PowerShell Profile

HistorySavePath
→ guarda comandos usados

$PROFILE
→ guarda configuração do PowerShell
```

------------------------------------------------------------------------

# 46. Próximo passo da formação

Depois do fechamento de Codex Foundations e desta melhoria de ergonomia do
PowerShell:

```text
MISSÃO 005 — Branching
```

é a próxima etapa disponível.

Claude Code permanece:

```text
ADIADO / BLOQUEADO POR DEPENDÊNCIA CORPORATIVA
```

até que licença e CLI/configuração sejam liberadas pela empresa.
