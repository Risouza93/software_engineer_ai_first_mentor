# CONTEXTO DE SESSÃO — M004 — CLAUDE CODE, MIGRAÇÃO PARA PROJETO NO CLAUDE E GOVERNANÇA OPERACIONAL

**Data:** 27/08/2026  
**Missão:** M004 — AI Coding Tools Foundations  
**Status da missão:** PARCIAL  
**Sessão:** concluída com sucesso  
**Objetivo deste arquivo:** preservar evidências e decisões detalhadas da sessão para `context/chat_history/`, sem substituir `memory/CURRENT_CONTEXT.md` nem o `10_PROGRESS_LEDGER.md`.

---

## 1. Estado de entrada

A sessão foi retomada a partir do contexto de 25/08/2026.

Estado previamente comprovado:

- Codex Foundations concluído;
- Claude Code instalado e autenticado;
- Claude Code v2.1.245 funcional;
- LAB 1 — leitura controlada — concluído;
- LAB 2 — alteração mínima + rollback — concluído;
- Claude Code classificado em N2 por execução guiada;
- comparação controlada Codex × Claude Code ainda pendente.

Nesta sessão, o usuário decidiu pular uma nova verificação do Codex e prosseguir diretamente com Claude Code.

---

## 2. Baseline Git observado

Repositório utilizado:

```text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

Estado inicial observado:

```text
branch inicial: main
main sincronizada com origin/main
```

Foi criada a branch:

```text
lab/codex-claude-comparison
```

Comando executado:

```powershell
git switch -c lab/codex-claude-comparison
```

Validação:

```powershell
git status --short
```

Resultado observado: saída vazia, indicando Working Tree limpa no início do laboratório.

---

## 3. Claude Code nesta sessão

Claude Code iniciou corretamente no repositório:

```text
Claude Code v2.1.245
modelo exibido: Sonnet 5
plano exibido: Claude Pro
diretório: software_engineer_ai_first_mentor
manual mode: ativo
```

Não foi executado `/init`, evitando criação incidental de `CLAUDE.md`.

Foi solicitado ao Claude Code um diagnóstico arquitetural em modo somente leitura.

Restrições aplicadas:

- não modificar arquivos;
- não criar `CLAUDE.md`;
- não instalar dependências;
- não executar commit/push/merge;
- identificar fatos e inferências separadamente;
- apontar arquivos que sustentassem as conclusões.

Claude informou que nenhum arquivo foi alterado durante essa análise.

---

## 4. Resultado da análise arquitetural do Claude Code

O Claude caracterizou o repositório como uma base de conhecimento Markdown para formação contínua em Engenharia de Software AI First.

Principais achados reportados:

### 4.1 Progress Ledger defasado

`10_PROGRESS_LEDGER.md` não refletia integralmente contextos posteriores.

Foram identificadas divergências como:

- Claude Code ainda representado como bloqueado/adiado;
- M008 ainda representada como próxima missão;
- contextos posteriores já comprovando Claude Code em N2;
- contexto posterior já registrando M008 em andamento.

Conclusão: o Ledger precisa ser reconciliado com evidências mais recentes seguindo `11_PROGRESS_LEDGER_RULES.md`.

### 4.2 Currículo replicado

O currículo/roadmap aparece em mais de uma fonte, incluindo:

```text
03_CURRICULUM.md
prompts/PROMPT_MESTRE_CONTINUIDADE.md
README.md
```

Risco identificado: deriva documental.

Não foi autorizada reestruturação ampla nesta sessão.

### 4.3 Bootstrap obsoleto

`prompts/PROMPT_MESTRE_CONTINUIDADE.md` ainda possui referências operacionais de retomada associadas a estados antigos, incluindo M001.

Decisão: futuras correções devem remover dependência de missão fixa e descobrir o estado pelas fontes canônicas atuais.

### 4.4 Arquitetura de memória antiga

Foram encontradas referências a:

```text
SOFTWARE_ENGINEERING_LEARNING_CONTEXT_V0X.md
```

enquanto a arquitetura efetivamente utilizada evoluiu para:

```text
10_PROGRESS_LEDGER.md
context/chat_history/
context/codes/
context/commands/
```

Essa divergência foi considerada uma defasagem documental a ser corrigida cirurgicamente.

### 4.5 Skills

Foi identificada divergência entre:

```text
06_SKILLS_CATALOG.md
```

e os arquivos reais em:

```text
skills/
```

Em particular, a análise apontou `qa-engineering-bridge-skill.md` como existente no filesystem sem representação equivalente no catálogo.

### 4.6 Agents

Foi identificada divergência entre:

```text
07_AGENTS_CATALOG.md
```

e:

```text
agents/
```

O catálogo descreve conceitos/agentes sem implementação correspondente.

Decisão importante: não criar novos agents automaticamente apenas para reconciliar contagem. Casos ambíguos exigem decisão arquitetural.

### 4.7 Skill × Agent × Prompt

Foi observada sobreposição entre:

```text
skills
agents
prompts
capítulos das instruções
```

Decisão: não redesenhar toda a arquitetura automaticamente. Uma definição mínima de responsabilidades poderá ser adicionada futuramente quando sustentada pelas fontes.

### 4.8 Método pedagógico repetido

O método de ensino aparece em múltiplos arquivos com sequências semelhantes, porém não idênticas.

Decisão: tratar como dívida arquitetural; não fazer consolidação ampla sem análise específica.

### 4.9 Ambiguidade de plataforma

O repositório ainda apresentava referências ao modelo original de Custom GPT/GPT personalizado, enquanto outras partes já refletiam uso de Claude Code.

Esse achado levou à principal decisão arquitetural desta sessão.

### 4.10 Artefatos de laboratório na raiz

Foram identificados arquivos de laboratório misturados aos documentos arquiteturais.

Decisão: somente registrar/analisar. Não mover, renomear ou apagar automaticamente.

---

## 5. DECISÃO ARQUITETURAL — MIGRAÇÃO

A partir de 27/08/2026, a plataforma principal de mentoria deixa de ser um **GPT Personalizado / Custom GPT**.

A arquitetura alvo passa a ser:

```text
PROJETO NO CLAUDE
Mentoria + contexto + regras + orquestração
        ↓
CLAUDE CODE
Execução local no repositório
        ↓
GIT
Rastreabilidade + evidência
        ↓
HUMANO
Revisão + autorização de publicação
```

Consequências:

- referências operacionais atuais a GPT Personalizado devem migrar para Projeto no Claude;
- referências históricas podem permanecer quando claramente históricas;
- Claude Code passa a ser o executor local preferencial para alterações autorizadas;
- Git permanece fonte independente de evidência;
- commit, push e outras ações de publicação permanecem sob aprovação humana;
- documentação e prompts de bootstrap devem refletir a arquitetura vigente.

---

## 6. Regra 12 — automação de artefatos

Foi definida a política:

```text
12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md
```

Responsabilidade:

```text
PROJETO NO CLAUDE
→ define objetivo, contexto, evidências, escopo e critérios

CLAUDE CODE
→ inspeciona fontes
→ executa alterações locais autorizadas
→ valida por Git
→ relata mudanças

HUMANO
→ revisa
→ autoriza publicação
```

Pedidos futuros como:

```text
atualizar contexto
registrar comandos
registrar códigos
atualizar Progress Ledger
atualizar README
encerrar missão
```

devem preferencialmente resultar em prompt executável para Claude Code realizar a manutenção local.

Exceção desta sessão: por solicitação explícita do usuário, este contexto final foi gerado manualmente fora do Claude Code.

---

## 7. Edição cirúrgica e comentários explícitos

Foi adicionada à política de automação a regra:

```text
ALTERAR SOMENTE O NECESSÁRIO
+
COMENTAR EXPLICITAMENTE O PONTO ALTERADO
+
PRESERVAR TODO O RESTANTE
```

Para documentos Markdown, foi definida a convenção:

```html
<!-- ALTERADO YYYY-MM-DD: descrição objetiva do que mudou e por quê. -->
```

Princípios:

- não reescrever arquivos inteiros quando a melhoria é localizada;
- não reformar conteúdo não relacionado;
- comentários somente junto a pontos efetivamente alterados;
- Git diff continua sendo a evidência técnica principal.

---

## 8. Regra 13 — memória universal e compactação

Foi criada a política:

```text
13_UNIVERSAL_MEMORY_CONTEXT_COMPACTION_RULES.md
```

Objetivo principal: reduzir ao máximo o consumo de tokens de retomada.

Arquitetura:

```text
memory/
→ HOT CONTEXT

backup_context/
→ COLD CONTEXT

fontes canônicas
→ detalhes sob demanda

Git
→ evidência técnica
```

Arquivo operacional recomendado:

```text
memory/CURRENT_CONTEXT.md
```

### Princípio fundamental

Uma nova sessão NÃO deve reler todo o repositório para reconstruir entendimento já consolidado.

Fluxo:

```text
NOVA SESSÃO
→ memory/CURRENT_CONTEXT.md
→ entender NOW + NEXT + PROJECT MAP
→ ler somente fontes necessárias à tarefa
→ trabalhar
```

Regra:

```text
NÃO REDESCOBRIR O QUE JÁ FOI CONSOLIDADO.
NÃO CARREGAR O QUE NÃO É NECESSÁRIO PARA A TAREFA.
```

### Budget

Meta recomendada para a memória ativa:

```text
aproximadamente 500–1.500 palavras
```

Preferencialmente menos quando possível.

O limite é heurístico; continuidade segura tem prioridade.

### Progressive disclosure

```text
Nível 0 → CURRENT_CONTEXT.md
Nível 1 → arquivo diretamente envolvido
Nível 2 → regra/dependência necessária
Nível 3 → evidência histórica se houver dúvida
Nível 4 → auditoria ampla somente quando indispensável
```

### Compactação

Quando a memória ficar inchada:

```text
CURRENT_CONTEXT.md
        ↓
backup_context/MEMORY_BACKUP_<timestamp>.md
        ↓
compactação
        ↓
novo memory/CURRENT_CONTEXT.md
```

Backup é contexto frio e não deve ser carregado normalmente.

A compactação deve preservar:

- NOW;
- NEXT;
- decisões vigentes;
- bloqueios/pendências;
- mapa mínimo de fontes;
- mudanças recentes indispensáveis.

Detalhes históricos permanecem recuperáveis em `backup_context/`, fontes canônicas ou Git.

A política foi escrita para ser reutilizável em qualquer projeto, não somente neste repositório.

---

## 9. Regra 14 — Git Safe Publishing

Foi criada a política:

```text
14_GIT_SAFE_PUBLISHING_RULES.md
```

Objetivo: separar edição local de publicação Git.

Modelo:

```text
INSPEÇÃO
→ automática

DIFF / VALIDAÇÃO
→ automática

PROPOSTA
→ automática

STAGING + COMMIT
→ GATE 1 humano

PUSH
→ GATE 2 humano

PULL REQUEST
→ autorização separada
```

### Evidências Git

Modelo mental:

```text
git status
→ quais arquivos mudaram?

git diff
→ o que mudou?

git diff --staged
→ o que está prestes a entrar no commit?

git show HEAD
→ o que realmente entrou no commit?

git push
→ o que será publicado no remoto?
```

### Gate 1

Antes de staging/commit:

```text
status
branch
log
diff
diff --check
revisão
proposta de arquivos
proposta de mensagem
comandos planejados
→ PARAR
→ aguardar autorização humana
```

Após autorização:

```text
git add <arquivos aprovados>
git diff --staged
git diff --staged --check
```

Commit somente se o staged diff corresponder ao aprovado.

### Gate 2

Depois do commit:

```text
git show HEAD
git log
git status
branch/upstream
comando de push proposto
→ PARAR
→ aguardar nova autorização
```

Autorização para commit não implica autorização para push.

### Operações protegidas

Não executar automaticamente:

```text
git merge
git rebase
git reset --hard
git clean
git commit --amend
git push --force
git push --force-with-lease
git restore .
```

---

## 10. Arquitetura consolidada das novas regras

A separação de responsabilidades definida nesta sessão é:

```text
12 — ARTIFACT AUTOMATION
→ como Claude Code altera artefatos locais

13 — UNIVERSAL MEMORY
→ como manter contexto mínimo e evitar releitura global

14 — GIT SAFE PUBLISHING
→ como revisar, commitar e publicar com gates humanos
```

Fluxo integrado:

```text
Projeto no Claude define objetivo
        ↓
Claude Code altera artefatos conforme regra 12
        ↓
memory é reconciliada conforme regra 13, quando necessário
        ↓
Git diff fornece evidência
        ↓
regra 14 governa staging/commit/push
        ↓
humano mantém controle dos gates
```

---

## 11. Prompts produzidos nesta sessão

Foram preparados prompts para:

1. diagnóstico arquitetural somente leitura;
2. reconciliação arquitetural das defasagens identificadas;
3. migração GPT Personalizado → Projeto no Claude;
4. edição cirúrgica com comentários explícitos;
5. manutenção automática de artefatos;
6. criação/manutenção de `memory/` e `backup_context/`;
7. compactação automática de contexto;
8. retomada token-efficient usando `CURRENT_CONTEXT.md`;
9. encerramento Git seguro;
10. análise de `git diff`;
11. staged diff antes do commit;
12. Gate 1 para commit;
13. Gate 2 para push;
14. integração da regra 14 com a regra 12.

---

## 12. Artefatos gerados manualmente nesta sessão

Foram geradas versões para inserção manual no repositório:

```text
12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md
13_UNIVERSAL_MEMORY_CONTEXT_COMPACTION_RULES.md
14_GIT_SAFE_PUBLISHING_RULES.md
```

Também foi gerado anteriormente um contexto intermediário da migração.

Este arquivo é o contexto final consolidado e deve substituir a necessidade de usar o contexto intermediário como ponto principal de retomada desta sessão.

Não apagar contextos históricos já existentes.

---

## 13. Estado pedagógico

M004 permanece:

```text
PARCIAL
```

Claude Code continua em:

```text
N2 — execução guiada
```

Evidências:

- instalação;
- autenticação;
- leitura controlada;
- alteração mínima anterior;
- rollback anterior;
- análise arquitetural somente leitura nesta sessão.

Não houve evidência suficiente nesta sessão para promoção autônoma adicional.

A comparação controlada Codex × Claude Code permanece pendente porque o usuário decidiu não executá-la agora.

---

## 14. Pendências

Pendências principais:

1. inserir/validar as regras 12, 13 e 14 no repositório;
2. aplicar via Claude Code as correções arquiteturais autorizadas;
3. reconciliar `10_PROGRESS_LEDGER.md`;
4. consolidar referências operacionais para Projeto no Claude;
5. corrigir bootstrap/memória antiga onde comprovadamente obsoletos;
6. reconciliar catálogos onde houver divergência factual;
7. criar/inicializar `memory/CURRENT_CONTEXT.md`;
8. criar `backup_context/` quando a política de memory for aplicada;
9. não mover artefatos de laboratório sem decisão específica;
10. executar posteriormente o fluxo Git seguro para commit/push;
11. comparação Codex × Claude Code continua pendente na M004.

---

## 15. Próxima retomada recomendada

Na próxima sessão:

```text
1. ler PRIMEIRO memory/CURRENT_CONTEXT.md, se já existir;
2. não fazer nova auditoria global do repositório;
3. validar Git com comandos baratos;
4. identificar qual das pendências acima foi concluída;
5. consultar somente arquivos diretamente necessários;
6. continuar do próximo passo real.
```

Se `memory/CURRENT_CONTEXT.md` ainda não existir, sua criação deve ser priorizada para que futuras sessões deixem de depender de releitura ampla do repositório.

---

## 16. Encerramento

Esta sessão consolidou uma mudança importante de arquitetura operacional:

```text
ANTES
GPT Personalizado
+ contexto distribuído
+ retomadas potencialmente caras
+ Git governado de forma dispersa

DEPOIS
Projeto no Claude
+ Claude Code como executor
+ memory como bootstrap compacto
+ backup_context como histórico frio
+ fontes sob demanda
+ Git Safe Publishing com dois gates humanos
```

Princípio de continuidade estabelecido:

```text
MEMORY
→ lembrar onde estamos

CONTEXT
→ preservar evidência detalhada

BACKUP_CONTEXT
→ preservar memória histórica sem gastar tokens normalmente

REGRAS 12/13/14
→ governar execução, memória e publicação

GIT
→ comprovar tecnicamente

HUMANO
→ manter autoridade sobre commit/push
```

**Ponto final da sessão:** contexto consolidado e pronto para inserção manual em `context/chat_history/`.
