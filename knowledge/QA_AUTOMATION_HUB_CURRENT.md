 # QA Engineering Automation Hub — nstech

> **Documentação central do projeto de evolução, automação e orquestração de Quality Engineering.**
>
> Este README é a porta de entrada do projeto. Seu objetivo é permitir que qualquer pessoa — QA, DEV, PO, liderança ou novo integrante — entenda rapidamente **o que estamos construindo, por que existe, como as peças se conectam, o que já está disponível e o que vem a seguir**.

---

## 📌 Visão Geral

O **QA Engineering Automation Hub** é uma iniciativa para evoluir o processo de QA da nstech de uma atuação predominantemente operacional para um modelo progressivo de **Quality Engineering**, combinando:

- processos padronizados de QA;
- Azure DevOps e Azure Test Plans;
- agentes especializados;
- skills reutilizáveis;
- análise de PBIs;
- geração e revisão de Test Cases;
- Gherkin;
- análise de Pull Requests e código;
- análise de risco e regressão;
- APIs e banco de dados;
- observabilidade;
- Podman e ambientes;
- Playwright;
- CI/CD;
- Quality Gates;
- rastreabilidade ponta a ponta.

A filosofia central é simples:

```text
QUALIDADE NÃO COMEÇA NO TESTE.
QUALIDADE COMEÇA NO ENTENDIMENTO DA MUDANÇA.
```

---

## 🎯 Objetivo

Construir um ecossistema capaz de apoiar o QA durante todo o ciclo de desenvolvimento:

```text
NEGÓCIO
   ↓
REQUISITO
   ↓
PBI
   ↓
ANÁLISE DE RISCO
   ↓
TEST DESIGN
   ↓
DESENVOLVIMENTO
   ↓
BRANCH / PR / DIFF
   ↓
EXECUÇÃO
   ↓
API / UI / BANCO / LOGS
   ↓
AUTOMAÇÃO
   ↓
EVIDÊNCIAS
   ↓
QUALITY GATES
   ↓
HOMOLOGAÇÃO
   ↓
DEPLOY
```

O objetivo não é simplesmente produzir mais casos de teste.

O objetivo é aumentar a **confiança na entrega**, reduzir trabalho repetitivo, antecipar falhas e tornar qualidade parte natural da esteira de desenvolvimento.

---

## 🧭 Para quem é este projeto?

| Perfil | Como utilizar |
|---|---|
| **QA Engineer** | Processo, investigação, Test Design, automação e evidências |
| **DEV** | Entender critérios, riscos, impactos e cobertura esperada |
| **PO / Produto** | Entender como requisitos são transformados em validações |
| **Tech Lead** | Visualizar riscos, regressões e Quality Gates |
| **Liderança QA** | Acompanhar evolução, padrões e automações |
| **Novo integrante** | Entender rapidamente ferramentas, fluxo e responsabilidades |

---

# 🏗️ Arquitetura Conceitual

A arquitetura foi desenhada para evitar uma única "super skill" responsável por tudo.

Cada componente deve possuir uma responsabilidade clara.

```text
                         ┌──────────────────────┐
                         │       USUÁRIO        │
                         └──────────┬───────────┘
                                    │
                                    ▼
                    ┌──────────────────────────────┐
                    │ QA PROCESS SPECIALIST AGENT  │
                    │        ORCHESTRATOR          │
                    └──────────────┬───────────────┘
                                   │
                 ┌─────────────────┼──────────────────┐
                 │                 │                  │
                 ▼                 ▼                  ▼
        ┌────────────────┐ ┌────────────────┐ ┌────────────────┐
        │ SKILL EXISTENTE│ │ QA ANALYSIS    │ │  AUTOMATION    │
        │                │ │ SKILLS         │ │                │
        └───────┬────────┘ └───────┬────────┘ └───────┬────────┘
                │                  │                  │
        PBI Analysis        PR Risk Analysis      Playwright
        Test Cases          Regression Impact     API Tests
        Gherkin             Bug Investigation     UI Tests
        Azure DevOps        Evidence Analysis     E2E
                            Release Readiness      Smoke
                                                   Regression
                                   │
                                   ▼
                         ┌────────────────────┐
                         │   QUALITY GATES    │
                         └─────────┬──────────┘
                                   │
                                   ▼
                         HOMOLOGAÇÃO / DEPLOY
```

---

# 🧠 Componentes

## 1. QA Process Specialist Agent

**Tipo:** Agent / Orchestrator  
**Status:** 🟡 Em evolução

É o cérebro de orquestração.

Responsabilidades esperadas:

- entender a intenção do usuário;
- identificar a etapa atual do ciclo de QA;
- selecionar a skill ou ferramenta adequada;
- evitar duplicação de capacidades;
- validar resultados retornados por skills especializadas;
- identificar riscos, gaps e inconsistências;
- sugerir o próximo passo;
- preservar rastreabilidade.

Arquivo atual:

```text
qa-process-specialist.agent.md
```

### Regra de idioma

O agente deverá compreender comandos em:

```text
Português — Brasil (pt-BR)
English — United States (en-US)
```

Comportamento obrigatório:

```text
Pergunta em Português
→ Resposta em Português

Question in English
→ Answer in English
```

Mensagens misturadas devem ser respondidas utilizando o idioma predominante.

---

## 2. Skill de Azure DevOps existente

**Tipo:** Skill especializada  
**Status:** 🟢 Existente / aguardando mapeamento completo

Já existe uma skill avançada conectada ao Azure DevOps.

Capacidades conhecidas:

- análise prévia da PBI;
- leitura de informações da demanda;
- geração de Test Cases;
- geração de Gherkin;
- automação integrada ao Azure DevOps.

### Regra arquitetural

```text
NÃO DUPLICAR ESSAS RESPONSABILIDADES
ATÉ QUE A SKILL EXISTENTE SEJA TOTALMENTE MAPEADA.
```

Antes de criar funcionalidades relacionadas, devem ser conhecidos:

- comandos disponíveis;
- inputs;
- outputs;
- dependências;
- permissões;
- limitações;
- operações de leitura;
- operações de escrita;
- pontos de extensão.

---

# 🧩 Skills planejadas

## Estratégia

As novas skills devem complementar a existente.

```text
SKILL EXISTENTE
      +
SKILLS ESPECIALIZADAS
      +
QA ORCHESTRATOR
      =
ECOSSISTEMA DE QUALITY ENGINEERING
```

### Roadmap atual

| Ordem | Skill / Capacidade | Objetivo | Status |
|---:|---|---|---|
| 1 | `pr-risk-analysis` | Transformar PR/Diff em riscos de QA | 🔵 Planejada |
| 2 | `regression-impact-analysis` | Identificar superfície de regressão | 🔵 Planejada |
| 3 | `bug-investigation` | Investigar falhas antes do registro | 🔵 Planejada |
| 4 | `qa-evidence-analyzer` | Avaliar qualidade e suficiência das evidências | 🔵 Planejada |
| 5 | `playwright-automation` | Automatizar API, UI, E2E, Smoke e Regression | 🔵 Planejada |
| 6 | `release-readiness` | Avaliar readiness com Quality Gates | 🔵 Planejada |
| 7 | CI/CD Quality Gates | Integrar qualidade diretamente na pipeline | ⚪ Futuro |

Legenda:

```text
🟢 Disponível
🟡 Em evolução
🔵 Planejado
⚪ Futuro
🔴 Bloqueado
```

---

# 🔍 PR Risk Analysis

Objetivo:

Comparar:

```text
O QUE DEVERIA MUDAR
        VS
O QUE REALMENTE MUDOU
```

Fluxo esperado:

```text
PBI
↓
PR
↓
COMMITS
↓
ARQUIVOS ALTERADOS
↓
DIFF
↓
REGRA ALTERADA
↓
IMPACTO
↓
RISCO
↓
CENÁRIO DE TESTE
```

Saídas esperadas:

- alterações relevantes;
- riscos funcionais;
- riscos técnicos;
- comportamentos indiretos;
- cenários não cobertos;
- sugestões de testes;
- regressão recomendada.

---

# 🔄 Regression Impact Analysis

Objetivo:

Identificar o que pode ter sido afetado direta ou indiretamente pela mudança.

Possíveis entradas:

```text
PBI
PR
Diff
Arquivos
Serviços
APIs
Banco
Configurações
Clientes
```

Possíveis saídas:

```text
Área diretamente alterada
Área indiretamente impactada
Integrações afetadas
Clientes potencialmente impactados
Regressão mínima
Regressão recomendada
Nível de risco
```

---

# 🐞 Bug Investigation

A skill não deverá simplesmente "escrever um bug".

Antes deverá ajudar na investigação.

```text
SINTOMA
↓
UI
↓
NETWORK
↓
API
↓
RESPONSE
↓
LOGS
↓
GRAFANA
↓
SERVIÇO
↓
BANCO
↓
HIPÓTESE TÉCNICA
```

Depois:

```text
BUG COM EVIDÊNCIA
```

Um bug deve conter, quando aplicável:

- título;
- ambiente;
- cliente;
- pré-condições;
- passos para reprodução;
- resultado esperado;
- resultado obtido;
- evidências;
- severidade;
- prioridade;
- Iteration;
- PBI relacionada;
- evidências técnicas.

---

# 📸 QA Evidence Analyzer

Objetivo:

Responder uma pergunta fundamental:

> **A evidência realmente prova que o comportamento foi validado?**

Entradas possíveis:

- screenshots;
- vídeo;
- request;
- response;
- SQL;
- logs;
- trace;
- versão;
- branch;
- commit;
- timestamp.

Saídas esperadas:

```text
O que a evidência comprova
O que ela NÃO comprova
Lacunas existentes
Evidências adicionais recomendadas
Suficiente / Insuficiente
```

---

# 🎭 Playwright Automation

**Stack alvo:**

```text
Playwright
TypeScript
VS Code
```

O Playwright será tratado como uma plataforma de automação de QA, não apenas como ferramenta de automação de tela.

## Camadas previstas

### UI Testing

- navegação;
- locators;
- formulários;
- permissões;
- validações;
- fluxos críticos;
- assertions.

### API Testing

- GET;
- POST;
- PUT;
- PATCH;
- DELETE;
- autenticação;
- authorization;
- payload;
- schema;
- HTTP Status;
- negative testing;
- idempotência;
- timeout;
- erros.

### Testes híbridos

Exemplo:

```text
API cria dado
↓
Backend processa
↓
UI apresenta resultado
↓
Playwright valida comportamento
```

### Automação de regressão

```text
Smoke
Critical Path
Regression
API
Integration
E2E
```

### Evidências automáticas

Quando aplicável:

- screenshot;
- trace;
- vídeo;
- relatório;
- logs de execução.

---

# ⚙️ CI/CD e Quality Gates

Objetivo futuro:

```text
DEV
↓
COMMIT
↓
PR
↓
BUILD
↓
UNIT TESTS
↓
API TESTS
↓
INTEGRATION TESTS
↓
PLAYWRIGHT
↓
QUALITY GATE
↓
DEPLOY HML
↓
QA
↓
PROD
```

Possíveis Quality Gates:

```text
✓ Build válido
✓ Testes críticos aprovados
✓ Sem regressões bloqueadoras
✓ Evidências disponíveis
✓ Bugs críticos resolvidos
✓ Versão/commit identificados
✓ Cobertura mínima definida
```

Nenhum agente ou automação deverá ignorar controles de release existentes.

---

# 🔁 Processo QA atual

O processo operacional documentado atualmente segue:

```text
PBI
↓
Pronto para Validação
↓
Atribuição do QA
↓
Leitura do Escopo
↓
Critérios de Aceite
↓
Requirement-Based Suite
↓
Test Cases
↓
Ready
↓
Execute
↓
Evidências
↓
Bug / Reteste
↓
Homologação
↓
PR
↓
Commit aprovado
↓
Comentário na PBI
↓
Pronto para Deploy
```

Ferramentas envolvidas:

- Azure Boards;
- Azure Test Plans;
- GitHub;
- Grafana;
- Microsoft Teams.

---

# 🧪 Padrão de Test Cases

Convenção atual:

```text
CT 01
CT 02
CT 03
...
```

Títulos devem ser orientados a comportamento.

Exemplo:

```text
CT 01 — deve permitir cadastrar...
CT 02 — não deve permitir cadastrar...
```

Os Test Cases finalizados devem seguir os estados definidos pelo processo da equipe.

---

# 🛠️ Ecossistema de Ferramentas

| Área | Ferramenta |
|---|---|
| Gestão | Azure Boards |
| Test Management | Azure Test Plans |
| Código | Git / GitHub |
| IDE | VS Code |
| Observabilidade | Grafana |
| Containers | Podman |
| API | Ferramentas REST / Playwright |
| Banco | SQL / PostgreSQL |
| Automação | Playwright |
| Pipeline | Azure Pipelines / CI/CD |
| Comunicação | Microsoft Teams |
| IA / Orquestração | Agents + Skills |

---

# 📦 Podman e ambientes

Podman faz parte da camada de ambientes e investigação.

Fluxo básico:

```text
Container está rodando?
↓
Serviço iniciou?
↓
Logs estão saudáveis?
↓
Porta está exposta?
↓
Rede está funcionando?
↓
Dependências respondem?
↓
Variáveis estão corretas?
↓
Banco está acessível?
```

Comandos de consulta rápida:

```bash
podman ps
podman ps -a
podman logs --tail 100 <container>
podman inspect <container>
podman port <container>
podman exec -it <container> sh
podman compose up -d
podman compose down
```

> Nunca registrar tokens, senhas ou chaves reais na documentação.

---

# 🔐 Segurança e dados sensíveis

Nenhuma skill, agente, script ou documentação deve expor:

- senhas;
- tokens;
- API keys;
- secrets;
- credenciais de banco;
- dados pessoais desnecessários;
- URLs internas sensíveis quando não forem apropriadas para o repositório.

Utilizar:

```text
<CLIENTE>
<TOKEN>
<BASE_URL>
<HOST>
<PORTA>
<SECRET>
```

quando exemplos forem necessários.

Secrets devem permanecer em mecanismos apropriados de armazenamento seguro.

---

# 🌐 Política de idiomas

Todo componente próprio do projeto deve considerar, quando tecnicamente viável:

```text
pt-BR
en-US
```

Regra de interação dos agentes:

```text
Usuário escreve em Português
→ resposta em Português

User writes in English
→ response in English
```

Os nomes técnicos e termos consolidados podem permanecer em inglês:

```text
Pull Request
Commit
Branch
Diff
Pipeline
Smoke Test
Regression
Quality Gate
Playwright
```

---

# 🧠 Princípios de engenharia

## 1. Skill First

Se uma skill especializada já resolve o problema:

```text
USE
>
DUPLICATE
```

---

## 2. Tool First, Question Second

Antes de perguntar algo que uma ferramenta autorizada consegue consultar:

```text
CONSULTAR FERRAMENTA
↓
VALIDAR RESULTADO
↓
SÓ ENTÃO PERGUNTAR
```

---

## 3. Não automatizar processo quebrado

```text
PADRONIZAR
↓
VALIDAR
↓
AUTOMATIZAR
↓
MEDIR
↓
MELHORAR
```

---

## 4. Lowest Reliable Layer

Sempre que o mesmo risco puder ser validado de forma confiável em uma camada inferior:

```text
Unit
↓
API
↓
Integration
↓
UI
```

Preferir a camada mais simples e estável.

---

## 5. Risk-Based Testing

Não testar apenas porque existe um critério de aceite.

Perguntar:

```text
O que pode quebrar?
Quem pode ser impactado?
Existe dado limite?
Existe comportamento negativo?
Existe integração?
Existe regressão?
Existe concorrência?
Existe persistência parcial?
Existe problema de compatibilidade?
```

---

## 6. Shift Left

QA participa antes do desenvolvimento terminar.

```text
DEMANDA
↓
REFINAMENTO
↓
RISCOS
↓
CRITÉRIOS FORTALECIDOS
↓
DESENVOLVIMENTO
↓
TESTE
```

---

## 7. Evidência > opinião

Nunca considerar:

```text
"parece funcionar"
```

como resultado de teste.

Preferir:

```text
comportamento
+
evidência
+
ambiente
+
versão
+
resultado
```

---

## 8. Nunca inventar informação

Agents e skills não devem inventar:

- requisitos;
- resultados de teste;
- logs;
- bugs;
- clientes;
- ambientes;
- branches;
- commits;
- contratos de API;
- estruturas de banco.

Informação ausente deve ser tratada explicitamente como ausente.

---

# 📊 Estados de uma validação

Modelo conceitual para futuras automações:

```text
ANALYSIS
↓
READY_FOR_TEST_DESIGN
↓
TEST_DESIGN
↓
READY_FOR_EXECUTION
↓
EXECUTION
├── FAILED
│      ↓
│   BUG_OPENED
│      ↓
│   WAITING_FIX
│      ↓
│   RETEST
│
├── BLOCKED
│
└── PASSED
       ↓
READY_FOR_HOMOLOGATION
       ↓
HOMOLOGATED
       ↓
READY_FOR_DEPLOY
```

Este modelo não substitui os estados oficiais do Azure DevOps. Ele funciona como referência conceitual para agentes e automações.

---

# 📁 Estrutura recomendada do repositório

```text
QA-NSTECH/
│
├── README.md
│
├── agents/
│   └── qa-process-specialist.agent.md
│
├── skills/
│   ├── pr-risk-analysis/
│   ├── regression-impact-analysis/
│   ├── bug-investigation/
│   ├── qa-evidence-analyzer/
│   ├── playwright-automation/
│   └── release-readiness/
│
├── docs/
│   ├── architecture/
│   ├── azure-devops/
│   ├── test-plans/
│   ├── git/
│   ├── api/
│   ├── sql/
│   ├── grafana/
│   ├── podman/
│   ├── playwright/
│   ├── pipelines/
│   └── adr/
│
├── automation/
│   └── playwright/
│       ├── tests/
│       ├── fixtures/
│       ├── pages/
│       └── utils/
│
├── examples/
│
└── QA_ENGINEER_FLIGHT_PLAN_NSTECH.md
```

> A estrutura é uma proposta de organização futura e pode ser adaptada ao repositório real.

---

# 📚 Documentação do projeto

## Documentos atuais

| Documento | Objetivo |
|---|---|
| `README.md` | Porta de entrada do projeto |
| `QA_ENGINEER_FLIGHT_PLAN_NSTECH.md` | Roadmap e evolução de Quality Engineering |
| `qa-process-specialist.agent.md` | Definição do agente de QA |
| `guia-processos-qa-v3.md` | Processo operacional da equipe |
| `Guia_Rapido_Podman_QA_Richard.md` | Consulta de containers e ambientes |

## Documentos recomendados futuramente

```text
docs/architecture/ARCHITECTURE.md
docs/CONTRIBUTING.md
docs/SECURITY.md
docs/adr/
docs/playwright/
docs/skills/
CHANGELOG.md
```

---

# 🧾 ADR — Architecture Decision Records

Decisões arquiteturais importantes deverão futuramente ser registradas como ADRs.

Exemplo:

```text
ADR-001 — QA Process Specialist será um Orchestrator
ADR-002 — Não duplicar funcionalidades da Skill Azure existente
ADR-003 — Playwright + TypeScript como stack de automação
ADR-004 — Skills pequenas e especializadas
ADR-005 — Quality Gates antes de Release Readiness
```

Estrutura:

```text
Contexto
↓
Decisão
↓
Alternativas consideradas
↓
Consequências
```

Isso impede que daqui a seis meses alguém pergunte:

> "Por que fizemos desse jeito mesmo?"

...e ninguém saiba responder. 😄

---

# 🗺️ Roadmap

## Fase 1 — Fundação

- [x] Documentar processo QA atual
- [x] Criar Flight Plan
- [x] Identificar agente atual
- [x] Identificar skill avançada existente
- [x] Definir princípio de não duplicação
- [x] Incluir Playwright na estratégia
- [ ] Evoluir `qa-process-specialist.agent.md`
- [ ] Mapear completamente a skill Azure existente

## Fase 2 — Quality Intelligence

- [ ] Criar `pr-risk-analysis`
- [ ] Criar `regression-impact-analysis`
- [ ] Criar `bug-investigation`
- [ ] Criar `qa-evidence-analyzer`

## Fase 3 — Automation

- [ ] Estruturar Playwright + TypeScript
- [ ] Criar Smoke Tests
- [ ] Criar API Tests
- [ ] Criar UI Tests
- [ ] Criar testes híbridos
- [ ] Criar suíte de Regression

## Fase 4 — Delivery Pipeline

- [ ] Integrar automações à pipeline
- [ ] Publicar resultados
- [ ] Integrar evidências
- [ ] Definir Quality Gates
- [ ] Criar `release-readiness`

## Fase 5 — Quality Engineering

```text
PBI
↓
ANÁLISE AUTOMATIZADA
↓
RISCO
↓
TEST DESIGN
↓
PR ANALYSIS
↓
REGRESSION IMPACT
↓
PLAYWRIGHT
↓
EVIDENCE
↓
QUALITY GATE
↓
HOMOLOGAÇÃO
↓
DEPLOY
```

---

# 🚦Status atual

```text
PROCESSO QA              ██████████  DOCUMENTADO
AZURE DEVOPS SKILL       ████████░░  EXISTENTE / MAPEAMENTO PENDENTE
QA ORCHESTRATOR          ████░░░░░░  EM EVOLUÇÃO
PR ANALYSIS              ██░░░░░░░░  PLANEJADO
REGRESSION ANALYSIS      ██░░░░░░░░  PLANEJADO
BUG INVESTIGATION        ██░░░░░░░░  PLANEJADO
EVIDENCE ANALYSIS        ██░░░░░░░░  PLANEJADO
PLAYWRIGHT               ██░░░░░░░░  PLANEJADO
CI/CD QUALITY GATES      ░░░░░░░░░░  FUTURO
```

> Percentuais visuais acima representam maturidade conceitual do projeto, não métricas formais de execução.

---

# 🤝 Governança de mudanças

Antes de adicionar uma nova skill, agente ou automação, responder:

1. Qual problema ela resolve?
2. Esse problema já é resolvido por outra skill?
3. Qual será o input?
4. Qual será o output?
5. Ela apenas lê ou também altera sistemas?
6. Quais ferramentas precisa acessar?
7. Existe risco de segurança?
8. Como será testada?
9. Como será versionada?
10. Quem será responsável pela manutenção?

Uma nova automação só deve existir quando houver uma resposta clara para essas perguntas.

---

# ✅ Definition of Done de uma nova Skill

Uma skill só deve ser considerada pronta quando possuir:

- [ ] responsabilidade única e clara;
- [ ] descrição;
- [ ] gatilhos de uso;
- [ ] inputs documentados;
- [ ] outputs documentados;
- [ ] dependências;
- [ ] permissões necessárias;
- [ ] comportamento de erro;
- [ ] limites conhecidos;
- [ ] exemplos de uso;
- [ ] casos de teste;
- [ ] tratamento de dados sensíveis;
- [ ] comportamento pt-BR / en-US quando aplicável;
- [ ] estratégia de versionamento;
- [ ] documentação atualizada.

---

# 🧪 Definition of Done do projeto

O projeto atingirá seu objetivo principal quando for possível receber uma demanda e executar, de maneira assistida e rastreável:

```text
Entendimento de negócio
+
Análise da PBI
+
Análise da implementação
+
Identificação de riscos
+
Test Design
+
Validação UI/API/Banco
+
Observabilidade
+
Regressão
+
Automação
+
Evidências
+
Quality Gates
+
Release Readiness
```

Em um estágio mais avançado:

> Qualidade estará inserida diretamente na esteira de desenvolvimento, atuando na prevenção, detecção, investigação e bloqueio de riscos antes que eles alcancem produção.

---

# 🆘 Onde procurar informação

```text
QUERO ENTENDER O PROJETO
→ README.md

QUERO ENTENDER O PLANO DE EVOLUÇÃO
→ QA_ENGINEER_FLIGHT_PLAN_NSTECH.md

QUERO ENTENDER O PROCESSO OPERACIONAL
→ guia-processos-qa-v3.md

QUERO ENTENDER O AGENTE
→ qa-process-specialist.agent.md

QUERO COMANDOS DE PODMAN
→ Guia_Rapido_Podman_QA_Richard.md

QUERO ENTENDER UMA SKILL
→ skills/<nome-da-skill>/README.md

QUERO ENTENDER UMA DECISÃO DE ARQUITETURA
→ docs/adr/
```

---

# 📝 Manutenção deste README

Este arquivo deve ser atualizado sempre que ocorrer:

- criação de nova skill;
- alteração significativa do agente;
- inclusão de nova ferramenta;
- alteração da arquitetura;
- criação de automação;
- mudança no processo de QA;
- integração com novo sistema;
- alteração relevante no roadmap.

O README não deve se transformar em documentação detalhada de tudo.

Regra:

```text
README
= MAPA

docs/
= DETALHES
```

---

# 📜 Histórico

## v0.1 — Agosto/2026

- criação do README central;
- consolidação da visão do projeto;
- definição inicial da arquitetura Agent + Skills;
- registro da skill Azure DevOps já existente;
- inclusão de PR Risk Analysis;
- inclusão de Regression Impact Analysis;
- inclusão de Bug Investigation;
- inclusão de Evidence Analyzer;
- inclusão de Playwright;
- inclusão de CI/CD e Quality Gates;
- definição inicial de governança;
- definição de estrutura recomendada de documentação.

---

> **Regra de ouro**
>
> Não queremos automatizar QA por automatizar.
>
> Queremos construir um sistema onde cada automação elimine trabalho repetitivo, aumente a rastreabilidade e ajude pessoas a tomar decisões melhores sobre qualidade.
