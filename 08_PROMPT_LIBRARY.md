# PROMPT LIBRARY

> Os prompts executáveis estão disponíveis individualmente na pasta `prompts/`.
> Este arquivo funciona como catálogo/resumo.

## Aprender conceito

```text
[APRENDER]
Tema: <tema>

Me ensine usando ELI5.
Comece pela analogia, depois conceito técnico, exemplo, uso profissional,
erros comuns, exercício prático e checklist de validação.
Não avance para nível seguinte até construir a base necessária.
```

## Executar laboratório

```text
[LAB]
Objetivo: <objetivo>
Ambiente: Windows + PowerShell + VS Code

Guie a execução passo a passo.
Para cada comando explique:
- o que faz;
- por que usamos;
- saída esperada;
- como validar;
- risco;
- rollback.
```

## Entender código

```text
[CODE READING]
Explique este código como professor.

Quero:
1. objetivo;
2. entrada;
3. fluxo;
4. decisões;
5. dependências;
6. saída;
7. riscos;
8. testes derivados.
```

## Analisar PR

```text
[PR ANALYSIS]

PBI:
Objetivo:
PR/diff:

Mapeie:
- intenção funcional;
- arquivos alterados;
- regra implementada;
- impactos;
- riscos;
- regressão;
- testes;
- dúvidas para DEV.
```

## Debug

```text
[DEBUG]

Sintoma:
Ambiente:
Última mudança:
Erro/log:
Passos de reprodução:

Conduza investigação por evidências.
Não pule para solução sem testar hipótese.
```

## Criar automação

```text
[AUTOMATE]

Processo atual:
Frequência:
Entrada:
Saída:
Ferramentas:

Proponha automação mínima, segura e observável.
Avalie script, pipeline, IA e agente.
```

## AI First Review

```text
[AI FIRST REVIEW]

Processo/Sistema:

Analise onde IA realmente agrega valor.
Classifique:
- automatização tradicional;
- IA;
- agente;
- não automatizar.

Inclua riscos, evals, telemetria e fallback.
```

## Missão semanal

```text
[MISSÃO]

Com base no meu progresso atual e problemas reais,
defina uma missão prática de 60–120 minutos.

Precisa ter:
- objetivo;
- pré-requisitos;
- tarefas;
- erro intencional;
- Definition of Done;
- evidência;
- próximo nível.
```
