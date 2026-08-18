# CÓDIGOS ESCRITOS --- M008 --- PROGRAMAÇÃO

Status: PARCIAL\
Data: 18/08/2026\
Linguagem atual: JavaScript

> Este arquivo registra os códigos efetivamente escritos pelo aluno na
> M008 até o checkpoint atual. O arquivo `codigos_lidos` citado como
> referência de organização não estava disponível entre os arquivos
> recuperados nesta sessão; por isso, este parcial preserva o mesmo
> princípio pedagógico de evidência, sem inventar conteúdo ausente.

------------------------------------------------------------------------

## 1. Primeira tentativa --- cálculo com funções

Código escrito:

``` javascript
const preco = 80
const quantidade = 3
const frete = 20

function subtotal(preco, quantidade){
    return preco * quantidade;
}

function total(subtotal, frete) {
    return subtotal + frete;
}

console.log(total)
```

Aprendizado associado:

-   declaração de função não significa execução;
-   `console.log(total)` referencia a função, não calcula o total;
-   a tarefa inicial podia ser resolvida sem funções.

Também houve uma segunda tentativa com valores fixos dentro das funções
e erro aritmético (`80 * 3` foi tratado como `180`).

------------------------------------------------------------------------

## 2. Variáveis + operações --- concluído

Código escrito autonomamente:

``` javascript
const preco = 125
const quantidade = 4
const desconto = 50

const subtotal = preco * quantidade;
const total = subtotal - desconto;

console.log(total);
```

Valores identificados corretamente:

``` text
subtotal = 500
total = 450
console.log(total) → exibe 450
```

------------------------------------------------------------------------

## 3. Primeiro `if/else` --- tentativa com erros de sintaxe

Tentativa:

``` javascript
const idade = 20
const idadeMinina = 18

if (idade >= idadeMinina {
console.log("Acesso permitido")
}
else (idade < idadeMinima {
console.log("Acesso negado")
}

console.log("Verificação concluída";
```

Erros trabalhados:

-   inconsistência `idadeMinina` / `idadeMinima`;
-   `)` ausente no `if`;
-   `else` usado como se recebesse condição;
-   `)` ausente no último `console.log`.

------------------------------------------------------------------------

## 4. `if/else` --- versão corrigida pelo aluno

``` javascript
const idade = 20
const idadeMinima = 18

if (idade >= idadeMinima) { console.log("Acesso permitido") }
else { console.log("Acesso negado") }

console.log("Verificação concluída");
```

Comportamento validado:

``` text
idade = 20 → Acesso permitido → Verificação concluída
idade = 16 → Acesso negado → Verificação concluída
```

------------------------------------------------------------------------

## 5. Primeiro `if/else if/else` --- tentativa com erros de sintaxe

``` javascript
const nota = 7

if (nota < 5) {
console.log("Reprovado)
} else if (nota < 7) {
console.log("Recuperação")
} else {
console.log("Aprovado"
}

console.log("Resultado processado");
```

Erros trabalhados:

-   aspas não fechadas em `"Reprovado"`;
-   `)` não fechado em `console.log("Aprovado")`.

A estrutura lógica `if → else if → else` estava correta.

------------------------------------------------------------------------

## 6. `if/else if/else` --- versão corrigida pelo aluno

``` javascript
const nota = 7

if (nota < 5) {
 console.log("Reprovado") 
} else if (nota < 7) {
 console.log("Recuperação") 
} else {
 console.log("Aprovado")
}

console.log("Resultado processado");
```

Fronteiras analisadas corretamente:

``` text
nota = 4.9 → Reprovado
nota = 5   → Recuperação
nota = 6.9 → Recuperação
nota = 7   → Aprovado
nota = 10  → Aprovado
```

Fluxo explicado pelo aluno para `nota = 10`:

``` text
10 < 5 ? false
↓
10 < 7 ? false
↓
else
↓
"Aprovado"
↓
"Resultado processado"
```

------------------------------------------------------------------------

## 7. Próximo código a escrever

Loops foram apenas introduzidos. O aluno ainda não escreveu
autonomamente seu primeiro `for`.

Checkpoint pendente:

``` javascript
for (let numero = 2; numero <= 8; numero = numero + 2) {
    console.log(numero);
}

console.log("Fim");
```

Depois da leitura mental desse código, o próximo passo é construir um
`for` sem esqueleto pronto.

------------------------------------------------------------------------

## STATUS PARCIAL

Já praticado por escrita:

``` text
variáveis
→ operações
→ saída
→ if
→ else
→ else if
→ fronteiras
→ debugging simples de sintaxe
```

Em início:

``` text
loops
→ let
→ repetição
```

Ainda pendente na M008:

``` text
funções (como fundamento formal)
→ módulos
→ exceções
→ estruturas de dados
→ TypeScript
→ Python
```
