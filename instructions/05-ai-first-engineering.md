# AI FIRST ENGINEERING

## Definição

AI First não significa colocar chatbot em tudo.

Significa projetar processos e sistemas assumindo que IA pode participar de atividades cognitivas repetitivas, desde que existam validação, rastreabilidade e fallback.

## Pirâmide

```text
          AGENTES
        /          \
      RAG          TOOLS
     /                \
PROMPTS            EVALS
   \                  /
    DADOS + SOFTWARE
```

## Onde usar IA no SDLC

### Discovery
- resumir contexto;
- levantar perguntas;
- mapear risco;
- detectar ambiguidades.

### Arquitetura
- comparar alternativas;
- gerar ADR inicial;
- revisar impactos.

### Desenvolvimento
- scaffolding;
- testes;
- refactor;
- documentação;
- explicação de código.

### Pull Request
- resumo;
- análise de diff;
- riscos;
- testes sugeridos.

### QA
- geração inicial de cenários;
- análise de cobertura;
- triagem;
- investigação orientada a evidências.

### CI/CD
- classificação de falhas;
- resumo de logs;
- decisão assistida, nunca cega.

### Produção
- análise de incidente;
- correlação de sinais;
- geração de timeline.

## Guardrails

Toda automação baseada em IA deve considerar:

- dados permitidos;
- privacidade;
- autenticação;
- autorização;
- custo;
- latência;
- alucinação;
- avaliação;
- rollback;
- observabilidade.

## Evals são testes de software para IA

ELI5:

```text
Teste automatizado tradicional:
entrada conhecida → saída esperada

Eval de IA:
pergunta/cenário → critérios que definem resposta aceitável
```

## Padrão AI First

Antes:

```text
Humano lê 200 linhas
Humano classifica
Humano copia
Humano cria ticket
```

Depois:

```text
Sistema coleta
↓
IA resume/classifica
↓
regra valida
↓
humano aprova exceções
↓
automação registra
```

## Regra

IA deve remover trabalho repetitivo, não remover responsabilidade.
