# CONTEXTO DE CONTINUIDADE — MISSÃO 007 — LEITURA DE CÓDIGO

Data: 17/08/2026  
Formação: Software Engineer AI-First Mentor  
MISSÃO 007 — Leitura de código: EM ANDAMENTO

---

## PONTO EXATO DE RETOMADA

A MISSÃO 007 foi iniciada após a conclusão da M006.

Princípio da missão:

```text
ANTES DE ESCREVER MAIS CÓDIGO
↓
APRENDER A LER O QUE JÁ EXISTE
```

Modelo operacional treinado:

```text
ENTRADA
↓
FUNÇÕES
↓
DECISÕES
↓
DEPENDÊNCIAS
↓
SAÍDA
```

No próximo chat, NÃO reiniciar a M007 e NÃO reconstruir M001–M006.
Retomar a partir do avanço registrado abaixo.

---

## ESTADO PEDAGÓGICO OBSERVADO NA M007

A missão ainda está em andamento; não promover formalmente o nível de
Leitura de código sem completar desafios posteriores.

O aluno já demonstrou, de forma guiada, capacidade de:

- identificar entradas/parâmetros em funções simples;
- calcular e acompanhar valores intermediários;
- identificar decisões com `if`;
- seguir caminhos verdadeiros e falsos;
- compreender que `return` encerra a execução da função naquele caminho;
- distinguir `console.log(...)` de `return`;
- identificar código inalcançável após `return`;
- seguir chamadas entre duas ou mais funções;
- acompanhar valores descendo e retornando pela cadeia de chamadas;
- identificar dependências entre funções;
- identificar dependência externa;
- reconhecer quando o código disponível não fornece evidência suficiente
  para determinar um resultado;
- distinguir retorno `null` de erro lançado pela dependência;
- derivar casos de teste a partir de decisões e valores de fronteira.

---

## CONCEITOS CONSOLIDADOS NESTA SESSÃO

### 1. Fluxo de controle

Modelo:

```text
Onde começa?
↓
Qual instrução executa?
↓
Existe decisão?
↓
Qual caminho foi escolhido?
↓
Existe return?
↓
A função termina naquele caminho
```

Foi corrigida a hipótese inicial de que toda instrução dentro das chaves
de uma função necessariamente seria executada.

Conceito introduzido:

```text
unreachable code
→ código que não pode ser alcançado naquele fluxo
```

---

### 2. `console.log` versus `return`

Modelo consolidado:

```text
console.log(...)
→ produz saída/efeito no console

return ...
→ devolve um valor para quem chamou
→ encerra a execução daquela função naquele caminho
```

O aluno inicialmente confundiu valor impresso durante a execução com
valor retornado, mas corrigiu o modelo nos exercícios seguintes.

---

### 3. Call flow versus data flow

Call flow:

```text
quem chama quem?
```

Data flow:

```text
de onde o valor veio?
como foi transformado?
para onde foi passado?
qual valor retornou?
```

Foi praticada a leitura de cadeias como:

```text
finalizarPedido(60, 2)
↓
calcularPagamento(120)
↓
aplicarTaxa(120)
↓
132
↑
retornos pela cadeia
```

Refinamento importante:

```text
function calcularPedido(preco, quantidade)
→ definição / parâmetros abstratos

calcularPedido(60, 2)
→ execução / valores reais
```

---

## DEPENDÊNCIAS

Foi introduzido código que depende de:

```javascript
banco.buscarPorId(id)
```

Modelo construído:

```text
obterNomeUsuario
↓
buscarUsuario
↓
banco.buscarPorId
```

O aluno identificou corretamente `banco.buscarPorId` como dependência
externa e reconheceu que, sem conhecer sua implementação/estado, não é
possível inventar o resultado.

Regra consolidada:

```text
o código prova X
≠
eu suponho Y
```

Quando a implementação da dependência foi fornecida, o aluno conseguiu
seguir o valor até a dependência e de volta até a saída final.

---

## `null` VERSUS ERRO

Distinção introduzida e validada:

```text
dependência retorna null
↓
execução normal continua
↓
variável recebe null
↓
if pode avaliar esse valor
```

versus:

```text
dependência lança erro
↓
não existe retorno normal
↓
atribuição não é concluída
↓
fluxo normal é interrompido
↓
não chega ao if subsequente
```

Analogia conceitual consolidada:

```text
"não encontrei o dado"
≠
"não consegui consultar o dado"
```

Checagem respondida corretamente:

```text
A) retorna usuário → chega ao if: SIM
B) retorna null    → chega ao if: SIM
C) lança erro      → chega ao if: NÃO
```

Ainda NÃO foi ensinado formalmente `try/catch`.
Foi apenas introduzida a existência do caminho de falha.

---

## PONTE COM QA

A partir de:

```javascript
if (total > 100)
```

o aluno propôs testar também um valor abaixo de 100.

Depois foram explorados valores de fronteira:

```text
99  → sem desconto
100 → sem desconto
101 → desconto
```

O aluno calculou corretamente os três resultados.

Foi introduzida a ideia de Boundary Value Analysis sem transformar a
M007 em uma aula completa de técnicas de teste.

Também foi observado comportamento potencialmente suspeito:

```text
100 → 100
101 → 90,9
```

Regra aplicada:

```text
comportamento estranho
≠
bug comprovado

→ validar regra de negócio
```

---

## ERROS PEDAGÓGICOS ÚTEIS OBSERVADOS

Não tratar estes erros como falhas; usá-los como evidência do que ainda
precisa ser consolidado.

1. Inicialmente assumiu que um `console.log` após `return` seria executado
   por estar dentro da função.
2. Inicialmente confundiu texto impresso por `console.log` com valor
   retornado pela função.
3. Em um trace, informou `calcularPedido` retornando 180 embora o resultado
   final corretamente identificado fosse 200.
4. Em alguns traces, carregou para o exemplo atual funções pertencentes ao
   exemplo anterior (`buscarUsuario`) ou duplicou uma chamada.
5. Inicialmente afirmou que o fluxo chegaria ao `if` mesmo quando a
   dependência lançasse erro.

Todos esses pontos foram corrigidos durante a prática, mas devem continuar
sendo testados em exemplos maiores para comprovar autonomia.

---

## ÚLTIMO EXERCÍCIO CONCLUÍDO

Código:

```javascript
function carregarUsuario(id) {
    const usuario = banco.buscarPorId(id);

    if (!usuario) {
        return "não encontrado";
    }

    return usuario.nome;
}

const nome = carregarUsuario(10);
console.log(nome);
```

Premissa:

```text
banco.buscarPorId(10)
→ retorna null
```

Trace correto consolidado:

```text
carregarUsuario(10)
↓
banco.buscarPorId(10)
↓
retorna null
↑
usuario = null
↓
!usuario → true
↓
return "não encontrado"
↑
nome = "não encontrado"
↓
console.log(nome)
↓
não encontrado
```

Refinamento final realizado: não transportar funções inexistentes de
exemplos anteriores para o trace atual.

---

## PONTO EXATO PARA O PRÓXIMO CHAT

O próximo passo já havia sido anunciado:

```text
passar de snippets pequenos
↓
para um arquivo pequeno com várias funções
↓
encontrar o ponto de entrada
↓
sem ler tudo linha por linha
```

Objetivo imediato:

```text
identificar ponto de entrada
↓
mapear call flow
↓
mapear data flow
↓
identificar decisões
↓
identificar dependências
↓
determinar saídas/caminhos possíveis
↓
derivar riscos/testes
```

Aumentar a dificuldade progressivamente.

Não introduzir `try/catch` formalmente antes de ser necessário ao fluxo
pedagógico. Não iniciar M008 — Programação ainda.

---

## CRITÉRIO PARA CONTINUAR A M007

A missão deve continuar seguindo o protocolo:

```text
CONCEITO
↓
DEMO
↓
LAB
↓
ERRO / DEBUG
↓
DESAFIO
↓
AUTONOMIA
```

Para considerar evolução formal em Leitura de código, buscar evidência de
que o aluno consegue, com menos perguntas guiadas:

- encontrar o ponto de entrada;
- seguir múltiplas funções;
- distinguir definição de execução;
- seguir call flow e data flow;
- respeitar `return` e decisões;
- identificar dependências externas;
- separar retorno normal, ausência de dado e falha;
- declarar quando faltam evidências;
- derivar riscos e testes básicos do comportamento observado.

Não promover nível apenas por completar exercícios guiados.

---

## REGRAS DE CONTINUIDADE

- `10_PROGRESS_LEDGER.md` continua sendo o índice operacional de progresso.
- `11_PROGRESS_LEDGER_RULES.md` continua sendo o contrato obrigatório para
  manutenção do Ledger.
- Este arquivo é contexto detalhado da M007 em andamento.
- Não usar este contexto para reconstruir M001–M006.
- Claude Code continua bloqueado/adiado por dependência corporativa.
- Conceitos já consolidados recebem apenas microexplicações quando necessários.
- Manter fato/evidência separados de hipótese.
- Não assumir estado transitório de Git ou ambiente sem nova evidência quando
  isso for relevante.
- Ao atualizar o Ledger, fazer somente alteração incremental da M007 e das
  dimensões realmente modificadas.
