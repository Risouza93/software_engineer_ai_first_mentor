# CONTEXTO DE CONTINUIDADE — MISSÃO 007 — LEITURA DE CÓDIGO

Data: 18/08/2026  
Formação: Software Engineer AI-First Mentor  
MISSÃO 007 — Leitura de código: EM ANDAMENTO

---

## PONTO EXATO DE RETOMADA

A M007 continua em andamento.

Não reiniciar a missão e não reconstruir M001–M006.

O foco atual já avançou de snippets pequenos para arquivos curtos com várias funções, incluindo:

```text
ponto de entrada
↓
call flow
↓
data flow
↓
decisões
↓
dependências externas
↓
retornos usados ou ignorados
↓
saída
```

Retomar a partir do exercício mais recente descrito neste arquivo.

---

## ESTADO PEDAGÓGICO OBSERVADO

O aluno já demonstrou, com dificuldade progressivamente menor, capacidade de:

- encontrar o ponto de entrada em código de nível superior;
- distinguir definição de função de execução real;
- identificar função declarada mas não utilizada;
- seguir chamadas entre múltiplas funções;
- acompanhar retorno de uma função para quem a chamou;
- separar call flow de data flow;
- distinguir argumento recebido de valor retornado;
- acompanhar valores intermediários entre funções;
- seguir decisões com `if`;
- compreender `return` antecipado e interrupção do fluxo daquela função;
- identificar dependências externas;
- distinguir valor usado em uma consulta do valor retornado por ela;
- distinguir retorno `null` de erro lançado;
- reconhecer que erro lançado sem tratamento interrompe o fluxo normal;
- reconhecer que uma função pode retornar um valor que o chamador ignora;
- evitar inferir comportamento de dependência sem premissa/evidência suficiente.

A M007 ainda não deve ser marcada como concluída. Buscar mais evidência de autonomia em arquivos um pouco maiores e derivação de riscos/testes.

---

## CONCEITOS CONSOLIDADOS NESTA CONTINUAÇÃO

### 1. Ponto de entrada em arquivo com várias funções

Foi reforçado que:

```text
função importante
≠
ponto de entrada
```

Em exemplos com funções declaradas e código de nível superior, a execução efetiva começa nas instruções executáveis de nível superior.

Exemplo conceitual:

```javascript
const resultado = processarPedido(60, 2);
console.log(resultado);
```

O ponto de entrada é a instrução que chama `processarPedido`, não a declaração da função.

---

### 2. Call flow versus data flow

Modelo reforçado:

```text
CALL FLOW
→ quem chama quem?

DATA FLOW
→ quais valores entram?
→ como são transformados?
→ quais valores retornam?
→ quem recebe esses retornos?
```

Erro corrigido durante a prática:

```text
calcularTotal(120) ❌
```

quando a chamada real era:

```text
calcularTotal(60, 2)
↓
return 120
```

Regra:

```text
entrada da função
≠
saída da função
```

---

### 3. Retorno para o chamador

Foi reforçado que, após uma função terminar:

```text
função chamada
↓
return
↓
controle volta para quem chamou
↓
execução continua a partir dali
```

Isso evitou a leitura incorreta de funções apenas pela ordem em que aparecem no arquivo.

---

### 4. Função declarada não significa função executada

Em arquivos com várias funções, foi identificado corretamente que uma função pode existir no arquivo sem participar da execução.

Modelo:

```text
estar declarado
≠
ser chamado
≠
ser executado
```

---

### 5. Dependência externa: entrada da consulta versus dado retornado

Exemplo trabalhado:

```javascript
const cupom = banco.buscarCupom("CLIENTE10");
```

Premissa:

```text
banco.buscarCupom("CLIENTE10")
→ retorna "DESC10"
```

Modelo consolidado:

```text
"CLIENTE10"
→ valor usado para procurar

"DESC10"
→ valor encontrado/retornado
```

ELI5 usado:

```text
CLIENTE10 = quem/qual registro procurar
DESC10    = informação encontrada
```

Foi esclarecido que isso não prova uma modelagem específica de banco de dados; apenas representa um possível contrato da dependência.

Regra reforçada:

```text
valor usado para consultar
≠
valor retornado pela consulta
```

---

### 6. `null` versus erro lançado

Cenário A:

```text
dependência retorna null
↓
atribuição é concluída
↓
variável recebe null
↓
fluxo normal continua
↓
if pode tratar ausência
```

Cenário B:

```text
dependência lança erro
↓
não existe retorno normal
↓
atribuição não é concluída
↓
fluxo normal é interrompido
↓
funções seguintes não são chamadas
```

Analogia consolidada:

```text
"não encontrei"
≠
"não consegui consultar"
```

`try/catch` ainda NÃO foi ensinado formalmente.

---

### 7. `return` antecipado

Exemplo trabalhado:

```javascript
if (!cupom) {
    return "cupom não encontrado";
}
```

Com `cupom = null`:

```text
!cupom → true
↓
return "cupom não encontrado"
↓
função termina
```

Consequência:

```text
calcularTotal    → não chamada
aplicarCupom     → não chamada
formatarMensagem → não chamada
```

Regra:

```text
encontrei um return executado
↓
essa função terminou naquele caminho
```

---

### 8. Retorno produzido mas ignorado

Último conceito introduzido:

```javascript
function enviarEmail(resumo) {
    return email.enviar(resumo);
}
```

Premissa:

```text
email.enviar(...)
→ retorna true
```

Dentro de:

```javascript
enviarEmail(resumo);
return resumo;
```

o `true` retornado por `enviarEmail` não é armazenado nem propagado por `processarCompra`.

Modelo:

```text
uma função retorna um valor
≠
o chamador necessariamente usa esse valor
```

---

## ERROS PEDAGÓGICOS ÚTEIS OBSERVADOS NESTA CONTINUAÇÃO

1. Identificou inicialmente a função principal como ponto de entrada, em vez da instrução executável de nível superior.
2. Em traces, confundiu argumento de entrada com valor retornado.
3. Confundiu `"CLIENTE10"` — chave usada na consulta — com `"DESC10"` — valor retornado.
4. Após um `return` antecipado, continuou inicialmente executando linhas que já não seriam alcançadas.
5. Em cenário de erro lançado, inventou uma mensagem de erro no `console.log` que não existia no código.
6. No último exercício, associou ao `enviarEmail` o retorno do resumo, embora a dependência `email.enviar` retornasse `true`.

Todos os pontos foram corrigidos durante a prática. Continuar testando em cenários maiores para verificar autonomia.

---

## ÚLTIMO EXERCÍCIO CONCLUÍDO

Código:

```javascript
function calcularFrete(valor) {
    if (valor >= 200) {
        return 0;
    }

    return 25;
}

function gerarResumo(valor, frete) {
    return `Compra: ${valor} | Frete: ${frete}`;
}

function enviarEmail(resumo) {
    return email.enviar(resumo);
}

function funcaoAuxiliar() {
    return "não usada";
}

function processarCompra(clienteId, valor) {
    const cliente = banco.buscarCliente(clienteId);

    if (!cliente) {
        return "cliente não encontrado";
    }

    const frete = calcularFrete(valor);
    const resumo = gerarResumo(valor, frete);

    enviarEmail(resumo);

    return resumo;
}

const resultado = processarCompra("CLI-10", 250);
console.log(resultado);
```

Premissas:

```text
banco.buscarCliente("CLI-10")
→ retorna { nome: "Ana" }

email.enviar(...)
→ retorna true
```

Trace correto:

```text
const resultado = processarCompra("CLI-10", 250)
↓
processarCompra("CLI-10", 250)
↓
banco.buscarCliente("CLI-10")
↓
return { nome: "Ana" }
↓
cliente = { nome: "Ana" }
↓
!cliente → false
↓
calcularFrete(250)
↓
250 >= 200 → true
↓
return 0
↓
frete = 0
↓
gerarResumo(250, 0)
↓
return "Compra: 250 | Frete: 0"
↓
resumo = "Compra: 250 | Frete: 0"
↓
enviarEmail("Compra: 250 | Frete: 0")
↓
email.enviar("Compra: 250 | Frete: 0")
↓
return true
↓
enviarEmail retorna true
↓
esse retorno é ignorado por processarCompra
↓
return resumo
↓
processarCompra retorna "Compra: 250 | Frete: 0"
↓
resultado = "Compra: 250 | Frete: 0"
↓
console.log(resultado)
↓
Compra: 250 | Frete: 0
```

Função presente mas não executada:

```javascript
function funcaoAuxiliar() {
    return "não usada";
}
```

---

## PONTO EXATO PARA O PRÓXIMO CHAT

Prosseguir a M007 a partir do conceito:

```text
retorno produzido
≠
retorno necessariamente usado
```

Próximo degrau recomendado:

```text
arquivo um pouco maior
↓
menos orientação do mentor
↓
identificar ponto de entrada
↓
mapear call flow
↓
mapear data flow
↓
identificar funções não executadas
↓
identificar dependências externas
↓
identificar decisões e returns antecipados
↓
identificar retornos usados/ignorados
↓
determinar saída
↓
derivar riscos e testes básicos
```

Evitar introduzir novos fundamentos de programação antes de concluir a etapa de leitura/autonomia da M007.

Não iniciar M008 — Programação ainda.

Não ensinar `try/catch` formalmente ainda, salvo se necessário para fechar a progressão pedagógica da M007.

---

## CRITÉRIO PARA CONTINUAR / CONCLUIR A M007

Buscar evidência de que o aluno consegue, com pouca ou nenhuma decomposição prévia:

- localizar o ponto de entrada;
- distinguir definição de execução;
- seguir múltiplas funções;
- acompanhar ida e volta de valores;
- separar argumentos e retornos;
- respeitar decisões e `return`;
- identificar código não executado;
- identificar dependências externas;
- não inventar retorno de dependência;
- separar `null` de erro;
- perceber retorno ignorado;
- determinar saída final;
- derivar riscos/testes básicos do comportamento observado.

Somente promover nível após evidência suficiente de autonomia, conforme o Learning Protocol.

---

## REGRAS DE CONTINUIDADE

- `10_PROGRESS_LEDGER.md` continua sendo o índice operacional de progresso.
- `11_PROGRESS_LEDGER_RULES.md` continua sendo o contrato obrigatório para manutenção do Ledger.
- Este arquivo é o snapshot detalhado mais recente da M007.
- O contexto de 17/08/2026 permanece como histórico anterior da mesma missão.
- Não reconstruir M001–M006 no novo chat.
- M006 permanece concluída.
- M004 permanece parcial: Codex concluído; Claude Code bloqueado/adiado por dependência corporativa.
- Não promover a M007 automaticamente apenas porque os exercícios guiados foram concluídos.
- Conceitos já consolidados recebem apenas microexplicações quando necessários.
- Manter fato/evidência separados de hipótese.
- Não inventar comportamento de dependências externas.
- No novo chat, iniciar diretamente no próximo desafio de leitura de código da M007.
