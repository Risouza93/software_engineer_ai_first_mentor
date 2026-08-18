# CONTEXTO DE CONTINUIDADE --- MISSÃO 008 --- PROGRAMAÇÃO --- EM ANDAMENTO

Data: 18/08/2026\
Formação: Software Engineer AI-First Mentor\
Missão atual: M008 --- Programação\
Status: EM ANDAMENTO\
Missão anterior: M007 --- Leitura de código --- CONCLUÍDA (N3)

------------------------------------------------------------------------

## PONTO EXATO DE RETOMADA

A M008 foi iniciada pelos fundamentos de programação em JavaScript.

Não reiniciar M001--M007 e não reiniciar a M008 desde o começo.

Retomar diretamente em:

``` text
M008 — Programação
Fundamento atual: loops
Próximo checkpoint: leitura mental do primeiro `for`
```

Código apresentado pelo mentor imediatamente antes da troca de chat:

``` javascript
for (let numero = 2; numero <= 8; numero = numero + 2) {
    console.log(numero);
}

console.log("Fim");
```

Perguntas pendentes para o aluno responder:

1.  Qual é o primeiro valor de `numero`?
2.  Qual condição controla se o loop continua?
3.  Quanto é acrescentado a `numero` após cada repetição?
4.  Quais números serão impressos, na ordem?
5.  Quando `numero` chegar a `10`, o que acontece?
6.  `"Fim"` será exibido? Por quê?

Depois desse checkpoint, pedir ao aluno para construir o primeiro `for`
sozinho.

------------------------------------------------------------------------

## BASE HERDADA DA M007

A M007 foi concluída com autonomia N3 em leitura de código. O aluno
demonstrou capacidade de reconstruir ponto de entrada, call flow, data
flow, decisões, retornos, dependências, saída, riscos e testes.

Na M008, não assumir que autonomia de leitura equivale automaticamente a
autonomia de escrita.

Objetivo da transição:

``` text
M007
código → reconstruir comportamento

M008
comportamento desejado → construir código conscientemente
```

------------------------------------------------------------------------

## CONTEÚDO JÁ TRABALHADO NA M008

### 1. Lógica, variáveis e fluxo de dados

Foram trabalhados:

-   `const`;
-   atribuição de valores;
-   operações aritméticas;
-   entrada → processamento → saída;
-   `console.log`;
-   diferença entre produzir/armazenar valor e exibi-lo no console.

Exercício concluído autonomamente:

``` javascript
const preco = 125;
const quantidade = 4;
const desconto = 50;

const subtotal = preco * quantidade;
const total = subtotal - desconto;

console.log(total);
```

Resultado identificado corretamente:

``` text
subtotal = 500
total = 450
console → 450
```

### 2. Tipos básicos

Trabalhados inicialmente:

-   `String`;
-   `Number`;
-   `Boolean`;
-   `null` como ausência intencional de valor (apresentação inicial).

O aluno classificou corretamente exemplos de String, Number e Boolean.

Também compreendeu o comportamento inicial do operador `+`:

``` text
10 + 20       → 30 / Number
"10" + "20"   → "1020" / String
"Total: " + 50 → "Total: 50" / String
20 > 10       → true / Boolean
```

### 3. Condições

Foram trabalhados:

-   expressões booleanas;
-   `if`;
-   `else`;
-   `else if`;
-   continuação do fluxo depois da decisão;
-   caminho alcançado × caminho não alcançado;
-   operadores `<`, `>`, `<=`, `>=`, `===`, `!==` em nível introdutório.

O aluno construiu e corrigiu:

``` javascript
const idade = 20;
const idadeMinima = 18;

if (idade >= idadeMinima) {
    console.log("Acesso permitido");
} else {
    console.log("Acesso negado");
}

console.log("Verificação concluída");
```

Depois validou corretamente o caminho contrário com `idade = 16`.

### 4. `else if` e fronteiras

Código construído e corrigido:

``` javascript
const nota = 7;

if (nota < 5) {
    console.log("Reprovado");
} else if (nota < 7) {
    console.log("Recuperação");
} else {
    console.log("Aprovado");
}

console.log("Resultado processado");
```

O aluno classificou corretamente as fronteiras:

``` text
4.9 → Reprovado
5   → Recuperação
6.9 → Recuperação
7   → Aprovado
10  → Aprovado
```

Também reconstruiu corretamente o fluxo completo para `nota = 10`.

### 5. Loops --- introdução iniciada

Foi introduzido o conceito de repetição e o `for`:

``` javascript
for (let numero = 1; numero <= 5; numero++) {
    console.log(numero);
}
```

Modelo apresentado:

``` text
inicialização
↓
condição
↓
corpo
↓
atualização
↓
nova avaliação da condição
```

Também foi introduzida a diferença inicial:

``` text
const → variável não será reatribuída
let   → variável precisará receber outro valor
```

Ainda não há evidência suficiente para considerar loops dominados.

------------------------------------------------------------------------

## DEBUGGING OBSERVADO NA M008

Durante a escrita de condições, apareceram erros de sintaxe úteis:

-   `idadeMinina` × `idadeMinima`;
-   ausência de `)` no `if`;
-   uso incorreto de condição diretamente após `else`;
-   aspas não fechadas em `console.log`;
-   parênteses não fechados em `console.log`.

O aluno corrigiu os erros após orientação e conseguiu produzir versões
sintaticamente corretas.

Separação pedagógica reforçada:

``` text
lógica correta
≠
sintaxe correta
```

Ainda é cedo para promover autonomia de debugging de JavaScript; as
correções foram guiadas.

------------------------------------------------------------------------

## EVIDÊNCIA ATUAL DA M008

Comprovado até aqui:

-   transforma regras aritméticas simples em variáveis e operações;
-   acompanha valores intermediários;
-   identifica tipos básicos em exemplos simples;
-   entende Boolean produzido por comparação;
-   acompanha e constrói `if/else`;
-   acompanha e constrói `if/else if/else`;
-   identifica corretamente fronteiras simples;
-   entende caminho alcançado e continuação do fluxo;
-   corrige erros simples de sintaxe com orientação.

Em progresso:

-   loops;
-   uso consciente de `let`;
-   construção autônoma de repetição.

Ainda não trabalhado/concluído na M008:

-   funções como fundamento formal de escrita;
-   módulos;
-   exceções;
-   estruturas de dados;
-   TypeScript;
-   Python.

Não antecipar Web Foundations, APIs, banco de dados ou módulos
posteriores.

------------------------------------------------------------------------

## NÍVEL / PROGRESSÃO

M008 permanece EM ANDAMENTO.

Não promover JavaScript para N3.

Há evidência de execução guiada nos fundamentos iniciais, mas ainda não
houve checkpoint autônomo abrangente da missão.

O Progress Ledger canônico anterior ainda registra M008 como próxima
missão e JavaScript como não iniciado; ele deverá ser atualizado quando
for feita a próxima manutenção formal do Ledger, seguindo
`11_PROGRESS_LEDGER_RULES.md`.

------------------------------------------------------------------------

## ARTEFATO DE CÓDIGO

Foi criado nesta sessão:

``` text
codigos_escritos.md
```

Status: PARCIAL.

Objetivo: registrar de forma compacta os códigos efetivamente escritos
pelo aluno durante a M008, preservando erros pedagógicos relevantes e
versões corrigidas.

------------------------------------------------------------------------

## REGRAS DE CONTINUIDADE

-   Retomar no checkpoint de `for`, não no início da M008.
-   Manter JavaScript como primeira linguagem.
-   Não confundir leitura autônoma da M007 com escrita autônoma na M008.
-   Continuar ELI5 + prática guiada + validação.
-   Manter o ciclo conceito → demo → lab → erro intencional → debug →
    desafio → automação → retrospectiva.
-   Separar lógica, sintaxe e comportamento observado.
-   Não promover nível sem evidência de autonomia repetível.
-   `10_PROGRESS_LEDGER.md` permanece o índice operacional.
-   `11_PROGRESS_LEDGER_RULES.md` permanece o contrato de manutenção do
    Ledger.
