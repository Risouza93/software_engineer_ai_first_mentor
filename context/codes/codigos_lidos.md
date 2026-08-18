# CÓDIGOS LIDOS --- M007 --- Leitura de código

Data de consolidação: 18/08/2026\
Formação: Software Engineer AI-First Mentor\
Missão relacionada: M007 --- Leitura de código --- CONCLUÍDA

## Objetivo

Este arquivo é o artefato prático análogo à cartilha de comandos:
preserva os códigos e cenários efetivamente usados na M007 para
consulta, revisão espaçada e retomada futura.

O foco não é recontar toda a sessão, mas registrar os exemplos que
serviram de laboratório para:

``` text
ponto de entrada
→ call flow
→ data flow
→ decisões
→ dependências
→ returns
→ saída
→ riscos
→ testes
```

------------------------------------------------------------------------

## 1. Compra com frete, cliente e envio de e-mail

### Código

``` javascript
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

### Premissas

``` text
banco.buscarCliente("CLI-10")
→ retorna { nome: "Ana" }

email.enviar(...)
→ retorna true
```

### Resultado lido

``` text
processarCompra("CLI-10", 250)
→ cliente encontrado
→ calcularFrete(250)
→ return 0
→ gerarResumo(250, 0)
→ "Compra: 250 | Frete: 0"
→ enviarEmail(...)
→ email.enviar(...) retorna true
→ true é ignorado por processarCompra
→ processarCompra retorna o resumo
→ console.log:
Compra: 250 | Frete: 0
```

### Pontos exercitados

-   função declarada não significa função executada;
-   `funcaoAuxiliar` não participa do fluxo;
-   retorno de uma dependência pode ser propagado por uma função e
    depois ignorado pelo chamador;
-   `return` devolve o controle para quem chamou.

------------------------------------------------------------------------

## 2. Pagamento com desconto, endereço, auditoria e notificação

### Código

``` javascript
function calcularDesconto(valor, categoria) {
    if (categoria === "VIP") {
        return valor * 0.2;
    }

    if (valor >= 500) {
        return valor * 0.1;
    }

    return 0;
}

function buscarEndereco(clienteId) {
    return enderecoApi.buscar(clienteId);
}

function calcularValorFinal(valor, desconto) {
    return valor - desconto;
}

function registrarAuditoria(clienteId, valorFinal) {
    return auditoria.registrar(clienteId, valorFinal);
}

function gerarMensagem(cliente, valorFinal) {
    return `${cliente.nome} pagará ${valorFinal}`;
}

function funcaoInternaNaoUsada() {
    return "não executada";
}

function processarPagamento(clienteId, valor) {
    const cliente = banco.buscarCliente(clienteId);

    if (!cliente) {
        return "cliente não encontrado";
    }

    const endereco = buscarEndereco(clienteId);

    if (!endereco) {
        return "endereço não encontrado";
    }

    const desconto = calcularDesconto(valor, cliente.categoria);
    const valorFinal = calcularValorFinal(valor, desconto);

    const auditoriaOk = registrarAuditoria(clienteId, valorFinal);

    const mensagem = gerarMensagem(cliente, valorFinal);

    notificacao.enviar(mensagem);

    return mensagem;
}

const resultado = processarPagamento("CLI-77", 600);
console.log(resultado);
```

### Premissas

``` text
banco.buscarCliente("CLI-77")
→ { nome: "Bruno", categoria: "VIP" }

enderecoApi.buscar("CLI-77")
→ { cidade: "São Paulo" }

auditoria.registrar("CLI-77", 480)
→ true

notificacao.enviar("Bruno pagará 480")
→ "MSG-900"
```

### Fluxo principal lido

``` text
processarPagamento("CLI-77", 600)
→ banco.buscarCliente("CLI-77")
→ cliente = { nome: "Bruno", categoria: "VIP" }
→ !cliente = false
→ buscarEndereco("CLI-77")
→ enderecoApi.buscar("CLI-77")
→ endereco = { cidade: "São Paulo" }
→ !endereco = false
→ calcularDesconto(600, "VIP")
→ categoria === "VIP" = true
→ desconto = 120
→ segundo if de calcularDesconto não é avaliado
→ calcularValorFinal(600, 120)
→ valorFinal = 480
→ registrarAuditoria("CLI-77", 480)
→ auditoria.registrar(...) = true
→ auditoriaOk = true
→ gerarMensagem(cliente, 480)
→ mensagem = "Bruno pagará 480"
→ notificacao.enviar(mensagem)
→ "MSG-900" é ignorado
→ return mensagem
→ console.log:
Bruno pagará 480
```

### Retornos e valores sem uso posterior

``` text
auditoria.registrar(...)
→ true
→ registrarAuditoria propaga true
→ auditoriaOk = true
→ auditoriaOk não é consultado depois

notificacao.enviar(...)
→ "MSG-900"
→ retorno imediatamente descartado
```

### Riscos/testes derivados

-   prioridade do desconto VIP;
-   auditoria retornando `false`;
-   retorno da notificação descartado;
-   cliente inexistente;
-   endereço inexistente;
-   fronteira de R\$ 500;
-   falha da notificação;
-   endereço obrigatório para continuar, embora seus dados não sejam
    usados posteriormente.

### Regra de review consolidada

``` text
comportamento observado
→ risco possível
→ teste
→ pergunta de negócio quando necessário
```

Não classificar automaticamente uma característica suspeita como bug sem
requisito/evidência.

------------------------------------------------------------------------

## 3. Transferência --- checkpoint autônomo final

### Código

``` javascript
function obterPlano(usuario) {
    return planosApi.buscar(usuario.planoId);
}

function calcularTaxa(valor, plano) {
    if (plano.isento) {
        return 0;
    }

    if (valor > 1000) {
        return 30;
    }

    return 15;
}

function validarSaldo(usuario, total) {
    return usuario.saldo >= total;
}

function salvarOperacao(usuarioId, total) {
    return banco.salvarOperacao(usuarioId, total);
}

function enviarConfirmacao(usuario, total) {
    return notificacoes.enviar(usuario.email, total);
}

function calcularPontos(total) {
    return Math.floor(total / 10);
}

function processarTransferencia(usuarioId, valor) {
    const usuario = banco.buscarUsuario(usuarioId);

    if (!usuario) {
        return "usuário não encontrado";
    }

    const plano = obterPlano(usuario);

    if (!plano) {
        return "plano não encontrado";
    }

    const taxa = calcularTaxa(valor, plano);
    const total = valor + taxa;

    const saldoValido = validarSaldo(usuario, total);

    if (!saldoValido) {
        return "saldo insuficiente";
    }

    const operacaoId = salvarOperacao(usuarioId, total);

    enviarConfirmacao(usuario, total);

    calcularPontos(total);

    return operacaoId;
}

const resposta = processarTransferencia("USR-20", 1200);
console.log(resposta);
```

### Premissas

``` text
banco.buscarUsuario("USR-20")
→ {
    email: "ana@example.com",
    planoId: "PLANO-A",
    saldo: 2000
  }

planosApi.buscar("PLANO-A")
→ { isento: false }

banco.salvarOperacao("USR-20", 1230)
→ "OP-7788"

notificacoes.enviar("ana@example.com", 1230)
→ true
```

### Code review produzido no checkpoint

``` text
processarTransferencia("USR-20", 1200)
→ banco.buscarUsuario("USR-20")
→ usuário encontrado
→ obterPlano(usuario)
→ planosApi.buscar("PLANO-A")
→ plano encontrado
→ calcularTaxa(1200, plano)
→ plano.isento = false
→ 1200 > 1000 = true
→ taxa = 30
→ total = 1230
→ validarSaldo(usuario, 1230)
→ 2000 >= 1230 = true
→ salvarOperacao("USR-20", 1230)
→ banco.salvarOperacao(...) = "OP-7788"
→ enviarConfirmacao(usuario, 1230)
→ notificacoes.enviar(...) = true [IGNORADO]
→ calcularPontos(1230)
→ 123 [IGNORADO]
→ return "OP-7788"
→ console.log("OP-7788")
```

### Decisões

``` text
!usuario        → false
!plano          → false
plano.isento    → false
valor > 1000    → true
!saldoValido    → false
```

### Trechos não executados

``` text
return "usuário não encontrado"
return "plano não encontrado"
return "saldo insuficiente"
return 0  // calcularTaxa
return 15 // calcularTaxa
```

### Dependências externas

``` text
banco.buscarUsuario
planosApi.buscar
banco.salvarOperacao
notificacoes.enviar
```

### Retornos usados

``` text
banco.buscarUsuario(...) → usuario
planosApi.buscar(...)     → plano
calcularTaxa(...)         → 30
validarSaldo(...)         → true
salvarOperacao(...)       → "OP-7788"
```

### Retornos ignorados

``` text
notificacoes.enviar(...) → true
calcularPontos(1230)     → 123
```

### Saída final

``` text
OP-7788
```

### Riscos/testes derivados autonomamente

1.  Valor zero ou negativo --- testar ausência de validação explícita.
2.  Limite da taxa --- testar `999.99`, `1000` e `1000.01`.
3.  Limite de saldo --- testar abaixo, igual e acima do total.
4.  Plano isento --- valor alto deve continuar com taxa `0`.
5.  Falha da notificação --- retorno `false` é ignorado; erro lançado
    ocorreria depois da persistência.
6.  Pontos --- valor `123` é calculado e descartado.

### Refinamento de review

``` text
FATO
A operação é salva antes da tentativa de notificação.

FATO
O retorno da notificação é ignorado.

RISCO
Pode haver operação persistida sem confirmação bem-sucedida.

PERGUNTA
Esse comportamento é aceitável?
Existe retry, compensação ou outra garantia fora deste trecho?
```

------------------------------------------------------------------------

## 4. Conceitos consolidados ao longo dos códigos

### Ponto de entrada

``` text
função importante
≠
ponto de entrada

declaração
≠
execução
```

Em arquivos com código executável no nível superior, a chamada efetiva é
o início do fluxo analisado.

### Call flow

Pergunta principal:

``` text
quem chama quem?
```

### Data flow

Perguntas principais:

``` text
qual valor entra?
como é transformado?
qual valor sai?
quem recebe?
```

### Argumento versus retorno

``` text
calcularTotal(60, 2)
              ↑ entradas

return 120
       ↑ saída
```

### Consulta externa

``` text
valor usado para procurar
≠
valor retornado pela consulta
```

### `null` versus erro lançado

``` text
retorna null
→ existe retorno normal
→ variável pode receber null
→ fluxo pode tratar a ausência

lança erro
→ não existe retorno normal naquele ponto
→ atribuição não é concluída
→ fluxo normal é interrompido
```

### `return` antecipado

``` text
if (condição) {
    return valor;
}
```

Quando esse `return` executa, aquela função termina naquele caminho.

### Retorno produzido não significa retorno utilizado

``` text
função retorna valor
≠
chamador necessariamente usa valor
```

Há diferença entre:

``` text
retorno propagado
retorno armazenado e depois não usado
retorno imediatamente descartado
```

------------------------------------------------------------------------

## 5. Checklist reutilizável para futuras leituras

Ao abrir um arquivo desconhecido:

``` text
1. Onde começa a execução efetiva?
2. Quais funções realmente são chamadas?
3. Quais valores entram em cada chamada?
4. Quais valores retornam?
5. Quem recebe cada retorno?
6. Quais decisões são avaliadas?
7. Algum return encerra um caminho?
8. Que código fica inalcançado nesse cenário?
9. Quais dependências estão fora deste arquivo?
10. O comportamento dessas dependências está comprovado ou estou supondo?
11. Qual é a saída final?
12. Que riscos aparecem desse comportamento?
13. Quais testes comprovariam esses riscos?
14. O código prova um bug ou apenas levanta uma pergunta de negócio?
```

------------------------------------------------------------------------

## 6. Encerramento

A M007 foi concluída após o checkpoint de `processarTransferencia`,
realizado sem roteiro intermediário.

Próxima missão oficial:

``` text
M008 — Programação
```

Este arquivo deve permanecer como referência prática dos códigos
efetivamente lidos na M007, enquanto o contexto da missão preserva a
evolução pedagógica e o Progress Ledger mantém apenas o índice compacto
de progresso.
