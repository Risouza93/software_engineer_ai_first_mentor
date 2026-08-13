# Guia de Processos de Quality Assurance (QA) e Engenharia de Qualidade (QE) (v4)

Este guia consolida de forma clara, prática e padronizada os fluxos de trabalho e as diretrizes operacionais executadas pela equipe de QA no Azure DevOps, Test Plans, Grafana, GitHub, e Microsoft Teams, incorporando a transição estratégica para a Engenharia de Qualidade (Quality Engineering) [7, 8, 34].

---

## 1. Fluxo de Trabalho no Azure Boards (Gestão de PBIs)
O acompanhamento diário das demandas, critérios de aceitação e preparação para validação ocorre diretamente no **Azure Boards** [18, 41, 62].

### Passo a Passo:
1. **Navegação:** No painel lateral esquerdo do Azure DevOps, acesse **Boards -> Boards** [41, 62].
2. **Seleção da Squad:** Escolha a squad em que você está alocado na barra superior para carregar o respectivo quadro de tarefas [62].
3. **Movimentação do Card:**
   - Quando um desenvolvedor conclui a execução de uma tarefa, ele arrasta o card para a coluna **Pronto para Validação** [63, 65].
   - Para iniciar seus testes, arraste o card de "Pronto para Validação" para a coluna **Invalidação** (ou "Em Validação") [65].
4. **Atribuição do QA:** Abra a PBI (Product Backlog Item) [65] e associe o seu nome ao campo **QA** [66].
5. **Verificação Inicial (Análise de Requisitos):** Na PBI, valide as seguintes informações obrigatórias [66]:
   - **PO (Product Owner):** Identifique o PO responsável [66].
   - **Cliente:** Identifique o cliente associado (ex: Frat Transplog) [66].
   - **Escopo:** Analise atentamente o escopo técnico e os critérios de aceitação descritos [67].
6. **Log de Horas (Time Tracking):**
   - Acesse a aba de lançamentos de horas integrada à tarefa [67].
   - Registre as horas dedicadas à tarefa (ex: "estudo de caso", "execução de testes") especificando a duração real (ex: "2.35 horas" para estudo ou testes) [67, 68].
7. **Verificação de Anexos e Links:**
   - Na aba **Links**, mapeie as tarefas filhas, dependências e links de testes vinculados [70].
   - Acesse os **Anexos** para consultar especificações em PDF, arquivos JSON, HTML ou screenshots anexados pelo desenvolvimento [70].
8. **Código da PBI:** Copie o ID numérico exclusivo da PBI (ex: `32358`) [71]. Ele será a chave de vinculação para os Test Plans [71].

---

## 2. Fluxo no Azure Test Plans (Requirement-Based Suite)
A rastreabilidade ponta a ponta exige que todas as suítes de testes de validação sejam criadas a partir dos requisitos das PBIs [11, 38].

### Passo a Passo:
1. **Acessar o Test Plans:** No painel lateral esquerdo do Azure DevOps, acesse a área **Test Plans** [72].
2. **Localização da Squad:** Selecione a squad correspondente à sua atuação (recomenda-se salvar como favorita) [72].
3. **Pasta Mensal:** Localize a pasta do mês vigente previamente estruturada pela liderança [72].
4. **Criação da Suite:**
   - Clique nos três pontos ao lado da pasta do mês (**More options**) [72].
   - Selecione **New suite** -> **Requirement-based suite** [72, 73].
5. **Vincular PBI:**
   - Na janela de query pré-definida que se abrir, insira o **número de identificação da PBI** (copiado na etapa anterior) no campo de valor correspondente [73].
   - Clique em **Run query** para buscar a tarefa no backlog [74]. Selecione a PBI localizada.
6. **Finalização:** Clique em **Create Suite** [74]. A suíte de testes vinculada à PBI será gerada automaticamente na pasta do mês [74].
7. **Abas Operacionais:** No Test Plans, utilize a aba **Define** para planejar e documentar os cenários de teste, e a aba **Execute** para rodar os testes e registrar as evidências de sucesso ou falha [79, 154].

---

## 3. Padronização de Casos de Teste (Test Cases) e Princípios de Engenharia de Qualidade (QE)

### Padronização de Escrita (NSTECH Standards):
* **Nomenclatura Sequencial:** Todo caso de teste deve iniciar sequencialmente com **CT 01, CT 02, CT 03, ...** [85, 129].
* **Título Focado na Ação:** O título do cenário de teste deve iniciar obrigatoriamente com um **verbo de ação no infinitivo** que dita o comportamento esperado da funcionalidade [85, 129].
  * *Estrutura afirmativa:* **"deve [verbo] [ação]"** (ex: *deve validar*, *deve exibir*, *deve salvar*, *deve bloquear*, *deve registrar*, *deve autenticar*) [85, 88, 89, 129].
  * *Estrutura negativa:* **"não deve [verbo] [ação]"** (ex: *não deve exibir*, *não deve permitir*) [88, 129].
* **Mudar de Estado (State):** Assim que a escrita e a revisão do caso de teste forem concluídas, o status (*State*) do Work Item deve ser alterado para **Ready** [85].

### Os 8 Princípios de Engenharia de Qualidade (QE Principles):
Para evoluir de um modelo operacional de testes simples para Engenharia de Qualidade ativa na esteira de software, todo analista deve guiar-se por estes princípios [7, 8]:
1. **Skill First (Habilidade em Primeiro Lugar):** Se uma ferramenta automatizada ou skill especializada para DevOps já resolve a demanda de análise ou execução, use-a para evitar a duplicação manual de esforços [21, 38].
2. **Tool First, Question Second (Ferramenta Primeiro, Pergunta Depois):** Nunca solicite dados ao time de desenvolvimento ou ao usuário que possam ser extraídos diretamente de logs, bancos de dados, PRs ou Azure DevOps [21, 39, 40].
3. **Não Automatizar Processos Quebrados:** Antes de automatizar qualquer fluxo de teste, o processo deve ser rigorosamente padronizado, testado e medido manualmente [22, 59, 60].
4. **Lowest Reliable Layer (Menor Camada Confiável):** Escolha sempre validar o risco na menor camada técnica possível. Priorize testes na ordem: *Unitários -> API -> Integração -> Interface Gráfica (UI)* [22, 54].
5. **Risk-Based Testing (Testes Baseados em Risco):** Não teste apenas os critérios de aceitação felizes. Analise o que pode quebrar (comportamentos indiretos, concorrência, quebra de contratos de API e conciliação de dados no banco) [22, 45, 46].
6. **Shift Left (Qualidade Antecipada):** O QA participa desde o refinamento de requisitos antes do desenvolvimento ser finalizado para prevenir bugs ao invés de apenas detectá-los [22, 54, 55].
7. **Evidência > Opinião:** O sucesso de uma validação deve ser comprovado por evidências técnicas estruturadas (prints de tela, payloads de requisições, logs de execução) e não por suposições [22, 51].
8. **Nunca Inventar Informações (No Hallucination):** Em relatórios, documentações de erros ou planos de testes, se uma informação técnica sobre o comportamento de negócio não puder ser confirmada em sistemas integrados, classifique-a explicitamente como "Ausente" (Missing) [23, 56].

---

## 4. Fluxo de Abertura, Ciclo de Vida e Classificação de Bugs (com base no BUG.png)
Caso um teste falhe ou apresente comportamento divergente da especificação, deve-se abrir um **Bug** altamente estruturado no Azure Boards [14, 50, 135].

### Estruturação de Bug de Acordo com Padrões KMM (BUG.png):
Com base no mapeamento visual das boas práticas, um Bug aceitável pela engenharia de desenvolvimento deve obrigatoriamente possuir os seguintes campos preenchidos [2, 14, 50, 135]:

1. **Título Padronizado:** Deve conter a ID (se houver) e um resumo objetivo do comportamento falho (ex: *BUG 31093 Falha ao enviar [Valores.Quantidade] com a quantidade física da carga*) [2, 50].
2. **Atribuição (Assigned To):** Identifique o desenvolvedor que executou a PBI para associar o bug diretamente a ele [2, 50].
3. **Squad (Area) e Sprint (Iteration) - Atenção Crítica:**
   - **Area:** Mapeie para a squad técnica correta (ex: `KMM5\TMS - Obrigacoes Legais e Financeiras`) [2, 50].
   - **Iteration:** Defina o ciclo de sprint vigente exato (ex: `KMM5\2026\Sprint 8.14`) [2]. 
   - *Aviso Crítico:* Se o campo **Iteration** estiver configurado incorretamente, desatualizado ou em branco, o Bug não será listado no backlog ativo da squad do desenvolvedor, gerando atrasos graves e falta de visibilidade [135].
4. **Descrição Detalhada:** Detalhe os passos exatos de reprodução (repro steps), o comportamento esperado versus o comportamento obtido na prática [14, 50].
5. **Link do Ambiente:** Link de homologação onde o erro foi identificado (ex: `https://mz.hml.multitms.com.br`) [2, 50].
6. **Branch e Versão:** Nome da branch associada e versão do sistema (ex: `master` ou branch específica do PR) [2, 50].
7. **Evidências Técnicas (Anexos Visuais):** Anexe prints contendo destaques (ex: caixa ou seta vermelha) focando no erro exato, como uma imagem demonstrando o JSON de resposta ou payload com dados inconsistentes (ex: `"Quantidade": 0.0` destacado) [2, 51].
8. **Classificação do Erro:** Classifique a categoria técnica do erro na tela de detalhes [2].
9. **Severidade e Prioridade:** Classifique de acordo com o impacto de negócio (ex: Severidade: *5 - Baixa*, Prioridade: *2*) [2, 14, 50].

### Reteste e Modelo Padronizado de Fechamento de BUG:
Após o desenvolvedor aplicar o ajuste e retornar o bug, o QA deve realizar o reteste completo [50]. Com a correção validada, preencha o comentário final de fechamento no Bug usando a colinha padrão [3, 131]:

```text
Teste realizado com sucesso
Atividade validada no cliente: [XXXXXXX], ambiente homologação
https://[xxxxx].hml.multitms.com.br/
Branch: [XXXXXXXXXXX]
O teste foi executado conforme critérios definidos e não foram identificados impedimentos ou incidentes.
Status: OK
```

---

## 5. Finalização de Testes, Homologação e Deploy (GitHub & Boards Integration)
Quando todos os testes de aceitação passarem e todos os bugs relacionados forem resolvidos e fechados, o QA conduz as etapas finais de homologação [90, 101, 147].

### Fluxo de Hand-off e Encerramento:
1. **Apresentação de Testes (Hand-off à Liderança):**
   - Acesse a aba **Execute** no **Test Plans** para guiar a validação [154].
   - Apresente os resultados dos testes e demonstre a execução diretamente no ambiente de homologação [154, 155]. Geralmente, esse alinhamento é feito com a liderança de QA (Gabi) [147].
   - Exiba as evidências geradas (prints de tela, payloads ou logs) [155].
2. **Homologação no GitHub (Pull Request):**
   - Acesse o repositório no **GitHub** e localize o Pull Request (PR) correspondente [155, 156].
   - Altere as tags do PR: remova a tag de **pending** (pendente) e adicione a tag **QA Aproved** [3, 156].
   - Selecione a opção **Create your approvement** para registrar seu voto de aprovação técnica [156].
3. **Coleta de Hash do Commit:**
   - Acesse a aba **[Commit]** do respectivo PR no GitHub [3, 157].
   - No lado direito da página, identifique e copie o código hash de revisão do último commit (ex: `edaaac104e0e62757da7c307613ce37d636a6072`) [3, 157].
4. **Comentário de Homologação na PBI (Azure Boards):**
   - Acesse a PBI original e deixe um comentário na aba de discussões utilizando o modelo padrão obrigatório abaixo, substituindo os placeholders pelos dados reais [4, 157, 158]:

   ```text
   Teste realizado com sucesso Atividade validada no cliente: [XXXXXXX], ambiente homologação
   https://martinelli.hml.multitms.com.br/
   Branch: newkmm-ftl/feature/14864-ajuste-regra-planejamento-new
   Revisão aprovada: edaaac104e0e62757da7c307613ce37d636a6072 O teste foi executado conforme critérios definidos e não foram identificados impedimentos ou incidentes. Status: OK
   Versão Testada: 8.11
   ```
   *Nota: Garanta a substituição do campo final "Versão" pelo termo "Versão Testada: [X.XX]" indicando a versão exata que foi submetida aos testes [4, 158].*

5. **Movimentação do Card:** Arraste o card da PBI no Azure DevOps Boards para a coluna **Pronto para Deploy** [149, 158].
6. **Aviso no Microsoft Teams:** Envie uma mensagem direta no Teams ao desenvolvedor da tarefa informando a conclusão da validação [151, 153]. Esse aviso direto é crucial para alertar o desenvolvedor para comitar a release e dar sequência ao deploy, visto que o deploy não ocorre de forma 100% isolada pelas ferramentas automáticas [153].

---

## 6. Monitoramento e Validação no Grafana
O **Grafana** é a plataforma de observabilidade utilizada para analisar logs do sistema em tempo real e rastreabilidade nos clientes [115].

* **Navegação de dashboards:** Mapeie o comportamento do sistema separando as visualizações nos dashboards de **Produção** e **Homologação** [115].
* **Mapeamento:** Localize o cliente específico que se quer investigar [115].
* **Convenção de Nomenclatura de Versões:**
   - A maioria dos ambientes de homologação está padronizada utilizando o ponto (`.`) [116].
   - Ambientes herdados ou mais antigos podem ainda conter o caractere hífen (`-`) para separação das releases, que está em processo de unificação pelo time de infraestrutura de TI [116].

---

## 7. Treinamentos e Cursos Mandatórios de Onboarding
O onboarding dos novos profissionais de QA engloba uma trilha de cursos obrigatórios de segurança e domínio das regras de negócio KMM [102, 107]:

1. **Segurança da Informação:** Trilha de capacitação obrigatória composta por **4 cursos rápidos** sobre proteção de ativos de dados e segurança digital [104].
2. **Código de Conduta e Ética:** Governança institucional [109].
3. **LGPD (Lei Geral de Proteção de Dados):** Boas práticas no tratamento e anonimização de informações de clientes [109].
4. **Cursos Operacionais (Wiki / KMM University):** Essenciais para entender os fluxos de produtos e simular regras operacionais com segurança. Os cursos prioritários são [108]:
   - **Cadastro de Carga** [108]
   - **Cadastro de Frete** [108]
   - **Tabelas** [108]

---

## 8. Estrutura Avançada de Engenharia de Qualidade (QE Transitions & Automation)

Para alinhar a atuação operacional com o projeto de evolução de Quality Engineering, o QA deve conhecer as matrizes de estados, as ferramentas de automação com Playwright e as práticas integradas [7, 8, 10]:

### QA State Machine (Máquina de Estados de Validação):
O modelo conceitual do fluxo de qualidade de uma demanda percorre os seguintes estados técnicos [23, 51]:
`ANALYSIS` -> `READY_FOR_TEST_DESIGN` -> `TEST_DESIGN` -> `READY_FOR_EXECUTION` -> `EXECUTION` -> `FAILED` -> `BUG_OPENED` -> `WAITING_FIX` -> `RETEST` -> `PASSED` -> `BLOCKED` -> `READY_FOR_HOMOLOGATION` -> `HOMOLOGATED` -> `READY_FOR_DEPLOY`

### Os 8 Quality Gates do Processo de QA:
Nenhuma release de software deve ser homologada se falhar em qualquer um dos seguintes gates de integridade [52]:
* **GATE 1 — Requirement understood:** Entendimento completo e inequívoco do requisito [52].
* **GATE 2 — Test coverage reviewed:** Cobertura de cenários de teste revisada [52].
* **GATE 3 — Critical scenarios executed:** Cenários de teste críticos rodados [52].
* **GATE 4 — Bugs resolved or formally accepted:** Bugs resolvidos ou aceitos formalmente pelo PO [52].
* **GATE 5 — Required regression completed:** Testes regressivos necessários executados com sucesso [52].
* **GATE 6 — Evidence available:** Evidências de validação salvas e rastreáveis [52].
* **GATE 7 — Correct version/branch/commit identified:** Coleta exata da versão, branch e hash de commit [52].
* **GATE 8 — Release blockers absent:** Ausência total de impedimentos de release [52].

### Camadas do Playwright Automation Strategy:
O Playwright é utilizado como plataforma integrada para agilizar as validações repetitivas da esteira de CI/CD [15, 16]:
* **UI Testing:** Validações de navegação, locators, Assertions, formulários e fluxos funcionais críticos [15, 16].
* **API Testing:** Validação de métodos (GET, POST, PUT, DELETE), esquemas de dados, tratamento de payloads e testes de idempotência [16].
* **Testes Híbridos & Automação de Regressão:** Integrações diretas para testes de fumaça (smoke tests) e geração automática de evidências técnicas (traces, vídeos e logs) [16].

### Dicas Técnicas de Automação e Operações com Agentes:
Para otimizar o uso de prompts inteligentes ou skills de agentes especializados, siga os truques operacionais abaixo [1, 6]:
* **Como Extrair Pull Request Diff no GitHub:**
  1. Acesse o link do PR no GitHub [1, 6].
  2. Insira o sufixo `.diff` diretamente no final da URL do PR [1, 6].
  3. Salve a página exibida no formato de arquivo com o nome `[Número_PR].diff` (ou `diff[Número_PR].txt`) [1, 6].
  4. Anexe o arquivo diff diretamente ao prompt do agente técnico especializado para mapeamento automático de regressões e análise de riscos [1, 6].
* **Consulta de Integrações Ativas:** Sempre use a tag `#integracoes/IntegracaoLiberada` para consultar se as integrações necessárias estão prontas para testes [1, 6].
* **Caminho Local Padrão de Armazenamento de Prompts:** `C:\Users\richard.feitosa\AppData\Roaming\Code\User\prompts` [1].
