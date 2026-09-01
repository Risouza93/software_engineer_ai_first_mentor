# REGRA CANÔNICA — UNIVERSAL MEMORY & CONTEXT COMPACTION

**Versão:** 1.0  
**Data:** 27/08/2026  
**Escopo:** universal — aplicável a qualquer repositório/projeto assistido por Claude/Claude Code  
**Objetivo prioritário:** minimizar ao máximo o consumo de tokens de retomada sem sacrificar estado, decisões, segurança ou rastreabilidade.

<!-- ALTERADO 2026-09-01: §1 compactada (3 blocos redundantes → 1); regra e objetivo em uma linha. -->
## 1. Princípio máximo

O agente NÃO deve reconstruir o entendimento do projeto relendo todo o repositório a cada nova sessão. A memória persistente funciona como **bootstrap operacional compacto**:

```text
NOVA SESSÃO
→ ler memory/CURRENT_CONTEXT.md
→ entender estado + arquitetura + regras + próximo passo
→ ler SOMENTE arquivos exigidos pela tarefa
→ executar
→ atualizar memory só se o estado relevante mudou
```

Regra: **não redescobrir o que já foi consolidado; não carregar o que a tarefa não exige.** Objetivo: reduzir tokens de contexto ao mínimo necessário.

---

## 2. Estrutura universal

Em qualquer projeto, preferir:

```text
memory/
└── CURRENT_CONTEXT.md

backup_context/
└── MEMORY_BACKUP_<timestamp>.md
```

Usar também as fontes nativas do projeto quando existirem, por exemplo:

```text
docs/
context/
README.md
ADR/
CHANGELOG
progress ledger
Git
```

Não criar cópias dessas fontes dentro da memory.

### Responsabilidades

```text
memory/CURRENT_CONTEXT.md
→ estado operacional mínimo para retomada

backup_context/
→ versões anteriores da memory; histórico frio

fontes canônicas do projeto
→ detalhes, regras e evidências

Git
→ estado técnico e diff
```

`backup_context/` NÃO substitui histórico de sessão, documentação, ADRs ou Git.

---

## 3. Inicialização

No início de uma sessão significativa:

1. procurar `memory/CURRENT_CONTEXT.md`;
2. se existir e estiver utilizável, lê-lo PRIMEIRO;
3. NÃO fazer inventário/scan global do repositório por padrão;
4. identificar a tarefa;
5. abrir somente arquivos explicitamente necessários à tarefa.

Se `memory/` ou `backup_context/` não existirem, criá-los somente quando houver autorização para alterar o repositório.

Se `CURRENT_CONTEXT.md` não existir:
- fazer uma inicialização única;
- descobrir somente a arquitetura necessária para produzir uma memória confiável;
- evitar leitura indiscriminada de arquivos irrelevantes;
- criar `CURRENT_CONTEXT.md`;
- nas sessões seguintes, usar a memória como bootstrap.

---

## 4. Memory não é documentação duplicada

`CURRENT_CONTEXT.md` deve ser um ÍNDICE OPERACIONAL, não uma cópia do repositório.

Nunca copiar integralmente:
- README;
- regras;
- documentação;
- código;
- logs;
- outputs de terminal;
- histórico Git;
- prompts;
- ADRs;
- planos;
- catálogos.

Preferir ponteiros:

```text
Regra de deploy → docs/deploy.md
Arquitetura → docs/architecture.md
Contrato API → openapi.yaml
Decisão X → docs/adr/ADR-012.md
```

Princípio:

```text
MEMORY GUARDA "O QUE PRECISO SABER AGORA"
FONTE CANÔNICA GUARDA "OS DETALHES"
```

---

## 5. Conteúdo mínimo

A memory deve conter apenas informação necessária para retomar trabalho sem redescoberta global.

Estrutura padrão (universal — um projeto pode renomear/estender as seções por
regra local, §17, desde que preserve estado, próximo passo, decisões, pendências
e mapa de fontes):

```markdown
# CURRENT CONTEXT

## NOW
<estado atual em poucas linhas>

## NEXT
<próxima ação concreta>

## ACTIVE DECISIONS
<somente decisões ainda relevantes>

## OPEN ITEMS
<pendências/bloqueios ativos>

## PROJECT MAP
<ponteiros mínimos para fontes canônicas>

## RECENT CHANGES
<somente mudanças recentes que afetam a retomada>

## LAST RECONCILIATION
<data/estado de referência>
```

Se uma seção não tiver informação útil, omiti-la.

---

## 6. Budget de tokens

A memory deve ser deliberadamente pequena.

### Meta padrão

Preferir `CURRENT_CONTEXT.md` com aproximadamente:

```text
500–1.500 palavras
```

e idealmente menos quando o projeto permitir.

O limite NÃO é absoluto. A prioridade é manter informação necessária para retomada segura.

### Regra de crescimento

Uma nova informação só entra na memory se responder "sim" a pelo menos uma pergunta:

```text
Preciso disso para retomar?
Isso muda uma decisão vigente?
Isso muda o próximo passo?
Isso representa bloqueio/risco ativo?
Isso aponta para uma fonte que precisarei localizar?
Perder isso obrigaria nova investigação relevante?
```

Se todas forem "não", NÃO adicionar.

---

## 7. Leitura sob demanda

Após ler a memory, aplicar **progressive disclosure**:

```text
Nível 0 → CURRENT_CONTEXT.md
Nível 1 → arquivo diretamente envolvido
Nível 2 → regra/dependência citada por esse arquivo
Nível 3 → evidência histórica somente se houver dúvida
Nível 4 → auditoria ampla somente quando indispensável
```

Nunca começar no Nível 4 por conveniência.

Exemplos:

```text
corrigir função
→ memory
→ arquivo da função
→ teste relacionado

atualizar documentação
→ memory
→ documento alvo
→ fonte canônica relacionada

investigar bug
→ memory
→ erro/log relevante
→ código relacionado
→ ampliar busca somente conforme hipóteses

alterar regra
→ memory
→ regra canônica específica
→ consumidores diretamente afetados
```

---

## 8. Proibição de scan global desnecessário

Se a memory estiver saudável, NÃO executar por padrão ações equivalentes a:

```text
ler todos os Markdown
ler todos os arquivos
mapear novamente todas as pastas
reler todos os prompts
reler todos os agents/skills
reconstruir toda a arquitetura
reler todo o histórico
```

Busca global pode ser usada de forma barata para LOCALIZAR ocorrências, sem carregar integralmente todos os resultados.

Exemplo:

```text
buscar referência "OldName"
→ identificar arquivos candidatos
→ abrir somente trechos/arquivos necessários
```

---

## 9. Quando ampliar a leitura

Ampliar contexto somente se houver um gatilho objetivo:

- memory ausente;
- memory corrompida/incompleta;
- mudança estrutural relevante;
- fonte canônica adicionada/removida;
- conflito entre memory e realidade;
- Git indica mudança que invalida o contexto;
- tarefa atravessa múltiplos subsistemas desconhecidos;
- usuário solicita auditoria completa;
- evidência atual é insuficiente para decidir com segurança.

Mesmo nesses casos:

```text
memory
→ identificar lacuna
→ buscar evidência específica
→ ampliar progressivamente
→ reconciliar memory
```

Não transformar automaticamente a exceção em leitura total.

---

## 10. Reconciliação barata

Não reler todas as fontes em toda sessão.

Validar primeiro sinais baratos:

```text
memory/CURRENT_CONTEXT.md
git status --short
git branch --show-current
```

Quando disponível e útil, comparar também identificadores baratos, como:
- commit/HEAD registrado na última reconciliação;
- arquivos alterados desde o último estado;
- timestamps somente como pista, nunca como verdade absoluta.

Se nada relevante mudou, confiar na memory para contexto global.

Se algo relevante mudou, consultar somente a área afetada.

---

## 11. Atualização da memory

Atualizar `CURRENT_CONTEXT.md` somente quando houver mudança operacional relevante:

- objetivo/etapa atual mudou;
- próxima ação mudou;
- decisão importante foi tomada/substituída;
- bloqueio surgiu ou foi resolvido;
- arquitetura/caminho canônico mudou;
- nova regra afeta retomadas futuras;
- investigação produziu conhecimento cuja perda exigiria redescoberta relevante.

Não atualizar por eventos triviais.

Não registrar cada comando, mensagem ou microdecisão.

---

## 12. Detecção de contexto inchado

Compactar quando houver um ou mais sinais:

- repetição;
- narrativa histórica acumulada;
- decisões substituídas misturadas às vigentes;
- pendências resolvidas ainda ocupando espaço;
- detalhes disponíveis em fonte canônica;
- múltiplas descrições da mesma arquitetura;
- crescimento sem ganho proporcional para retomada;
- dificuldade de localizar NOW/NEXT rapidamente.

Critério principal:

```text
VALOR PARA RETOMADA / CUSTO DE LEITURA
```

Se o custo cresce e o valor não, compactar.

---

<!-- ALTERADO 2026-09-01: §13 condensada — passos 13.1/13.2/13.3 em prosa contínua, sem perder nenhum item normativo. -->
## 13. Compactação obrigatória

Quando a memory estiver inchada:

1. **Backup primeiro** — preservar a versão atual em
   `backup_context/MEMORY_BACKUP_YYYY-MM-DD_HHMM.md`. Nunca sobrescrever backup existente.
2. **Compactar** — manter na memory ativa só: estado atual, próximo passo, decisões
   vigentes, pendências/bloqueios ativos, mapa mínimo de fontes, mudanças recentes
   indispensáveis, última reconciliação. Remover: narrativa histórica, decisões
   substituídas, pendências encerradas, explicações longas, outputs, conteúdo
   duplicado, detalhes recuperáveis por ponteiro.
3. **Preservação** — nenhuma informação importante desaparece irreversivelmente;
   deve continuar recuperável em pelo menos uma fonte (`backup_context/`,
   documentação/contexto canônico, ou Git).

---

## 14. Backup é contexto frio

`backup_context/` NÃO deve ser carregado em retomadas normais.

Consultar backup somente quando:
- investigação histórica exigir;
- informação foi compactada e precisa ser recuperada;
- houver suspeita de regressão/perda de contexto;
- usuário solicitar.

Regra:

```text
memory/ = HOT CONTEXT
backup_context/ = COLD CONTEXT
```

Isso existe explicitamente para economizar tokens.

---

## 15. Comentários e rastreabilidade

Ao compactar `CURRENT_CONTEXT.md`, registrar no topo:

```html
<!-- COMPACTADO YYYY-MM-DD: versão anterior preservada em backup_context/<arquivo>. -->
```

Para pequenas alterações, seguir a política de edição cirúrgica do projeto quando existir.

Não encher a memory com comentários de manutenção. Um comentário de compactação é suficiente.

Git diff continua sendo a evidência técnica.

---

## 16. Regra de edição mínima

Nunca reescrever documentos externos à memory somente para "sincronizar contexto".

Se a tarefa exigir alteração de outro arquivo:
- abrir o arquivo específico;
- alterar somente o trecho necessário;
- preservar o restante;
- seguir as regras locais do projeto.

A memory deve apontar para fontes canônicas, não forçá-las a duplicar a memory.

---

## 17. Independência de projeto

Esta política é universal.

Não assumir:
- linguagem;
- framework;
- sistema operacional;
- estrutura de pastas além de `memory/` e `backup_context/`;
- existência de Progress Ledger;
- existência de `context/`;
- GitHub;
- OpenAI;
- Anthropic como única plataforma;
- processo pedagógico específico.

Quando o projeto possuir regras próprias, integrá-las por ponteiros no `PROJECT MAP`.

Regras locais mais específicas podem complementar esta política, desde que não destruam o objetivo de contexto mínimo.

---

## 18. Hierarquia de confiança

Usar:

```text
PARA ENTENDER ONDE ESTAMOS
→ memory/CURRENT_CONTEXT.md

PARA SABER A REGRA EXATA
→ fonte canônica específica

PARA ALTERAR IMPLEMENTAÇÃO
→ arquivos diretamente envolvidos

PARA COMPROVAR ESTADO TÉCNICO
→ Git/testes/ferramentas apropriadas

PARA HISTÓRICO COMPACTADO
→ backup_context/
```

Memory é bootstrap, não substituta universal das fontes.

---

## 19. Critério de saúde

A memory está saudável quando, após lê-la, um novo agente consegue:

1. explicar o projeto em poucas frases;
2. saber o estado atual;
3. identificar o próximo passo;
4. conhecer decisões e bloqueios ativos;
5. localizar as fontes canônicas necessárias;
6. continuar o trabalho sem mapear novamente todo o repositório.

Se isso exigir dezenas de milhares de tokens de releitura, a política falhou.

---

<!-- ALTERADO 2026-09-01: §20 "Critério de sucesso de eficiência" removida (restatement de §1 e §19); §§21–23 renumeradas para 20–22. -->
## 20. Algoritmo universal de retomada

```text
1. Existe memory/CURRENT_CONTEXT.md?
   SIM → ler.
   NÃO → inicialização mínima.

2. Entendi NOW + NEXT + PROJECT MAP?
   SIM → continuar.
   NÃO → investigar somente a lacuna.

3. Tarefa exige fonte específica?
   SIM → abrir somente essa fonte/dependências necessárias.

4. Estado mudou materialmente?
   SIM → atualizar memory.
   NÃO → não adicionar ruído.

5. Memory ficou inchada?
   SIM → backup → compactação.
   NÃO → preservar.

6. Validar somente o necessário.
7. Encerrar.
```

---

## 21. Anti-padrões proibidos

```text
"Vou ler todo o repo para me familiarizar"
→ proibido por padrão quando memory saudável existe.

"Vou colocar toda documentação na memory"
→ proibido.

"Vou carregar backup por segurança"
→ proibido em fluxo normal.

"Vou registrar tudo que aconteceu"
→ proibido.

"Vou duplicar README/ADR/ledger na memory"
→ proibido.

"Vou compactar apagando histórico"
→ proibido.

"Vou confiar na memory para editar uma regra sem ler a regra"
→ proibido.
```

---

## 22. Princípio final

Memory = mapa atual mínimo · fontes canônicas = detalhes sob demanda ·
`backup_context/` = histórico frio · Git/testes = evidência. Objetivo: mínimo de
tokens sem perder continuidade nem confiabilidade.

A memory existe para que o agente CONTINUE o trabalho, não para que precise REAPRENDER o projeto.
