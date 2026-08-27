# CONTEXTO DE SESSÃO — M004 — CLAUDE CODE, AUTOMAÇÃO DE ARTEFATOS E MIGRAÇÃO PARA PROJETO NO CLAUDE

**Data:** 27/08/2026  
**Missão:** M004 — AI Coding Tools Foundations  
**Sessão:** continuidade do Claude Code + decisão arquitetural de migração  
**Status da missão:** PARCIAL  
**Próxima retomada:** aplicar, via Claude Code, correções cirúrgicas identificadas na análise arquitetural e consolidar a migração de plataforma.

## 1. Estado de entrada

A sessão foi retomada a partir do contexto de 25/08/2026.

Estado previamente comprovado:
- Codex Foundations concluído;
- Claude Code instalado e autenticado;
- Claude Code v2.1.245 funcional;
- LAB 1 de leitura controlada concluído;
- LAB 2 de alteração mínima e rollback concluído;
- Claude Code classificado em N2 por execução guiada;
- comparação controlada Codex × Claude Code ainda pendente.

Nesta sessão, o usuário decidiu pular uma nova verificação do Codex e prosseguir diretamente com Claude Code.

## 2. Repositório e baseline desta sessão

Repositório utilizado:

```text
C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor
```

Baseline observado:

```text
branch inicial: main
main sincronizada com origin/main
branch de laboratório criada: lab/codex-claude-comparison
git status --short: vazio
```

Conclusão: o laboratório iniciou com Working Tree limpa e branch isolada.

## 3. Claude Code

Claude Code iniciou corretamente:

```text
Claude Code v2.1.245
modelo exibido: Sonnet 5
plano: Claude Pro
diretório: software_engineer_ai_first_mentor
manual mode: ativo
```

Não foi executado `/init`, evitando criação incidental de `CLAUDE.md`.

Foi solicitado ao Claude Code um diagnóstico arquitetural somente leitura do repositório, com exigência de:
- não modificar arquivos;
- identificar arquivos essenciais;
- mapear relações;
- localizar regras, progressão, currículo, skills, agents e progresso;
- identificar duplicações, inconsistências e riscos;
- separar fatos, inferências e proposta.

Claude confirmou que nenhum arquivo foi alterado.

## 4. Principais achados da análise do Claude Code

O Claude caracterizou o repositório como uma base de conhecimento Markdown que implementa mentoria contínua de Engenharia de Software AI First, e não como uma aplicação tradicional.

Achados objetivos relevantes:

1. `10_PROGRESS_LEDGER.md` está defasado em relação aos contextos mais recentes:
   - ainda registra Claude Code como bloqueado/adiado;
   - ainda trata M008 como próxima missão;
   - contextos posteriores comprovam Claude Code em N2 e M008 já iniciada.

2. O currículo aparece em múltiplas representações:
   - `03_CURRICULUM.md`;
   - `prompts/PROMPT_MESTRE_CONTINUIDADE.md`;
   - visões resumidas no `README.md`.
   Isso cria risco de deriva.

3. `prompts/PROMPT_MESTRE_CONTINUIDADE.md` contém bootstrap obsoleto que ainda direciona retomada para M001.

4. A arquitetura antiga de memória baseada em `SOFTWARE_ENGINEERING_LEARNING_CONTEXT_V0X.md` permanece referenciada em prompts, embora a implementação atual utilize:
   - `10_PROGRESS_LEDGER.md`;
   - `context/chat_history/`;
   - `context/codes/`;
   - `context/commands/`.

5. `06_SKILLS_CATALOG.md` não representa integralmente os arquivos reais de `skills/`.

6. `07_AGENTS_CATALOG.md` descreve agentes sem implementação correspondente em `agents/`, gerando divergência entre catálogo e filesystem.

7. Há sobreposição de responsabilidades entre skill, agent, prompt e capítulos das instruções, sem regra arquitetural suficientemente explícita sobre o papel de cada camada.

8. O método pedagógico aparece repetido em vários arquivos com sequências semelhantes, porém não idênticas.

9. A plataforma-alvo está ambígua:
   - parte do repositório ainda assume Custom GPT/GPT personalizado;
   - outra parte já usa estruturas compatíveis com Claude Code.

10. Existem artefatos de laboratórios na raiz do repositório, misturados com documentos canônicos.

A recomendação principal do Claude foi estabelecer reconciliação do estado antes de cada retomada, comparando Ledger, contexto mais recente e Git.

## 5. DECISÃO ARQUITETURAL — MIGRAÇÃO

A partir de 27/08/2026, a arquitetura de mentoria deixa de considerar um **GPT personalizado** como plataforma principal.

A plataforma de orquestração passa a ser um **PROJETO no Claude**.

Arquitetura alvo:

```text
PROJETO NO CLAUDE
Mentoria + contexto + regras + orquestração
        ↓
CLAUDE CODE
Execução assistida no repositório local
        ↓
GIT
Rastreabilidade e evidência
        ↓
HUMANO
Revisão e aprovação de commit/push/merge
```

Consequências da migração:
- referências normativas a “GPT personalizado”, “Custom GPT” e “ordem de upload no GPT” devem ser revisadas;
- instruções de bootstrap devem refletir um Projeto no Claude e a memória canônica atual;
- documentação OpenAI deixa de ser prioridade genérica por plataforma; a política de fontes deve escolher a documentação oficial da tecnologia/produto efetivamente utilizado;
- Claude Code passa a ser o executor local preferencial para manutenção de artefatos autorizados;
- Git permanece a evidência independente das alterações;
- commit, push e merge continuam dependendo de aprovação humana explícita.

A migração deve ser **cirúrgica**: não apagar histórico que explique a evolução do projeto. Referências históricas podem permanecer quando claramente marcadas como legado/histórico.

## 6. Nova política de automação de artefatos

Foi criada a regra:

```text
12_CLAUDE_CODE_ARTIFACT_AUTOMATION_RULES_FINAL.md
```

Ela define que pedidos futuros equivalentes a:

```text
criar/atualizar contexto
registrar comandos
registrar códigos
atualizar Progress Ledger
atualizar README
encerrar missão e salvar artefatos
```

devem gerar um prompt executável para Claude Code realizar as edições locais autorizadas.

Responsabilidades:

```text
PROJETO NO CLAUDE
→ define conteúdo, evidências, escopo e critérios

CLAUDE CODE
→ inspeciona fontes canônicas
→ aplica edição local mínima
→ valida com Git
→ relata alterações

HUMANO
→ revisa
→ aprova publicação
```

## 7. Regra de edição cirúrgica e comentários explícitos

Foi adicionada à política de automação a regra de que arquivos existentes não devem ser reescritos integralmente quando a melhoria for localizada.

Princípio:

```text
ALTERAR SOMENTE O NECESSÁRIO
+
COMENTAR EXPLICITAMENTE O PONTO ALTERADO
+
PRESERVAR TODO O RESTANTE
```

Para Markdown, a convenção definida é:

```html
<!-- ALTERADO 2026-08-27: <o que mudou e por quê> -->
```

Os comentários devem aparecer somente junto aos pontos efetivamente alterados.

Além disso, o relatório final do Claude Code deve indicar arquivo, local, antes, depois e motivo de cada alteração.

Git diff continua sendo a fonte técnica de rastreabilidade.

## 8. Decisão para a próxima execução do Claude Code

O próximo passo não será uma reescrita ampla do repositório.

Claude Code deverá usar sua própria análise arquitetural como evidência e executar uma correção controlada, com estas prioridades:

```text
1. reconciliar o Progress Ledger com o estado comprovado;
2. consolidar a migração GPT personalizado → Projeto no Claude;
3. remover/revisar referências operacionais obsoletas de bootstrap e memória;
4. reconciliar catálogos com os artefatos realmente existentes;
5. reduzir deriva documental somente onde houver correção objetiva;
6. explicitar papéis de skill × agent × prompt quando possível sem redesenho amplo;
7. avaliar artefatos de laboratório na raiz sem movê-los destrutivamente sem decisão explícita.
```

Mudanças que exijam decisão arquitetural não sustentada pelas evidências devem ser reportadas como pendência, e não inventadas.

## 9. Guardrails para a próxima execução

Claude Code poderá editar somente arquivos necessários às correções aprovadas.

Proibido sem nova autorização:
- reescrever arquivos inteiros por conveniência;
- commit;
- push;
- merge;
- rebase;
- reset destrutivo;
- apagar ou mover artefatos históricos;
- instalar dependências;
- alterar credenciais;
- criar agentes/skills apenas para “fechar contagem” sem decisão arquitetural.

Validação mínima:

```powershell
git status --short
git diff --check
git diff
```

## 10. Estado de encerramento deste contexto

Este arquivo de contexto foi gerado fora do Claude Code, por solicitação explícita do usuário.

Nesta etapa:
- Claude Code não realizou alterações no repositório;
- o diagnóstico arquitetural do Claude foi preservado como evidência;
- a migração para Projeto no Claude foi formalizada;
- a política de automação foi consolidada;
- a próxima ação é fornecer ao Claude Code um prompt de manutenção cirúrgica.

A M004 continua PARCIAL até nova decisão pedagógica, pois a comparação Codex × Claude Code originalmente prevista não foi concluída.
