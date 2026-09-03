# REGRA CANÔNICA — PEDAGOGICAL CHECKPOINTS & HUMAN ENGAGEMENT

**Versão:** 1.0  
**Data:** 01/09/2026  
**Escopo:** universal — aplicável a projetos em contexto de mentoria com Claude Code  
**Propósito:** garantir que automação não substitua ensino; pausas deliberadas para questionar, orientar e envolver o mentorado em decisões técnicas.

## 1. Princípio Fundamental

```text
AUTOMAÇÃO
≠ AUTONOMIA IA

AUTOMAÇÃO
= EXECUÇÃO GUIADA + PAUSAS PEDAGÓGICAS

MENTOR ENSINA → MENTORADO DECIDE → CLAUDE EXECUTA
```

Desta Regra decorrem:

- Pontos de parada obrigatórios para questionamento
- Relatórios pedagógicos (não apenas técnicos)
- Sincronização deliberada com decisões do mentorado
- Registro de escolhas e aprendizados

---

## 2. Checkpoints Obrigatórios

### 2.1. CHECKPOINT ZERO — Análise e Compreensão

**Quando**: Início de qualquer tarefa significativa (edição, refactoring, diagnóstico, decisão arquitetural).

**O que fazer**:

1. Analisar a tarefa
2. Identificar **opções** possíveis
3. Propor **uma** com justificativa
4. Parar (🛑)

**O que perguntar**:

```
Tarefa: <resumo>

OPÇÕES IDENTIFICADAS:
1. <abordagem A> — vantagem: <X>, risco: <Y>
2. <abordagem B> — vantagem: <X>, risco: <Y>
3. <abordagem C> — vantagem: <X>, risco: <Y>

RECOMENDAÇÃO:
→ Opção <N> porque <justificativa pedagógica>

Você concorda? Quer ajustar algo?
Ou prefere seguir por outra opção?
```

**Não prosseguir** até ter resposta explícita.

---

### 2.2. CHECKPOINT UM — Proposta Técnica

**Quando**: Após aprovação da abordagem, antes de **criar/alterar arquivos**.

**O que fazer**:

1. Detalhar a solução (estrutura, passos, código/mudanças)
2. Mostrar o plano **sem executar**
3. Explicar o "por quê" pedagógico (o que se aprende)
4. Parar (🛑)

**O que perguntar**:

```
PLANO TÉCNICO:

Alterações que serão feitas:
- <arquivo> → <o quê>
- <arquivo> → <o quê>
- ...

Passos:
1. <passo>
2. <passo>
3. ...

APRENDIZADO:
→ Esta tarefa aborda <conceitos>
→ A prática reforça <habilidades>

Quer que eu proceda? Alguma dúvida antes de começar?
```

**Não prosseguir** até aprovação ou ajuste.

---

### 2.3. CHECKPOINT DOIS — Execução e Validação

**Quando**: Após alterações, antes de **commit**.

**O que fazer**:

1. Executar/testar
2. Mostrar resultados
3. Validar contra plano aprovado
4. Parar (🛑)

**O que perguntar**:

```
RESULTADO:
→ <descrição do que foi feito>

VALIDAÇÕES:
✓ <validação 1>
✓ <validação 2>
...

DIFF SUMMARY:
<git diff --stat compacto>

Tudo conforme esperado?
Quer revisar algo antes do commit?
```

---

<!-- ALTERADO 2026-09-03: título ajustado; removida a lista crua de comandos ("AÇÕES DISPONÍVEIS") — a mecânica de Git e a caixa de autorização vivem no Gate 4 da rules/14 §12. Este checkpoint mantém só a decisão pedagógica de quando parar. -->
### 2.4. CHECKPOINT TRÊS — Sync & Cleanup pós-merge (pausa pedagógica do Gate 4)

**Quando**: Após **merge manual no GitHub** ser detectado — sempre depois do Gate 2 (push), da PR e do merge (Gate 3), nunca antes.

**Como detectar**:

- Executar `git fetch --all --prune` e comparar local com origin
- Se `main` local está atrás de `origin/main` → merge detectado
- Se existem branches locais/remotas de PRs anteriores → cleanup pendente

**O que fazer**:

1. Informar que um merge foi detectado
2. Explicar ao mentorado *por que* sincronizar e limpar (evitar ramificar de base velha, não acumular branches órfãs)
3. Parar (🛑)

**O que perguntar**:

```
MERGE DETECTADO NO GITHUB:

origin/main foi atualizada. Seu repo local está sincronizado?

BRANCHES ANTIGAS (candidatas a limpeza):
- feature/pr-5 (local + remota) — merged
- feature/pr-6 (local) — merged
- feature/pr-7 (remota) — merged

Quais branches você quer manter?
```

**Não prosseguir** até explícita aprovação.

A execução dos comandos (sync + `git branch -d` + `git push origin --delete`) segue o
**Gate 4 da `rules/14` §12** — é lá que ficam os comandos exatos e a caixa de
autorização de Git. Este checkpoint é a pausa pedagógica que antecede esse Gate.

---

<!-- ALTERADO 2026-09-01: adicionado o Checkpoint 4 (Fronteira / Encerramento) — codifica a regra "parar ao fim de cada unidade de trabalho". -->
### 2.5. CHECKPOINT QUATRO — Fronteira / Encerramento

**Quando**: Ao concluir uma unidade de trabalho — tipicamente o ciclo
Gate 1 → Gate 2 → PR → merge → pós-merge → limpeza de branches, mas também uma
tarefa que terminou sem Git (análise, diagnóstico, decisão).

**O que fazer**:

1. Confirmar que a unidade está fechada (working tree limpa, sync feito, branches
   tratadas, relatório escrito).
2. Resumir o que mudou e o que ficou pendente.
3. **Parar (🛑)** — não iniciar a próxima unidade de trabalho.
4. Pedir o próximo passo.

**O que NÃO fazer**: encadear para o próximo item de pendências, começar o
próximo commit, ou aproveitar o embalo para uma melhoria adjacente. Cada unidade
de trabalho termina num ponto de parada limpo sob controle do mentorado.

**Exceção**: apenas quando o mentorado autorizou explicitamente uma sequência
("faça A, depois B, depois pare") — e mesmo aí, parar ao fim da sequência.

---

## 3. Relatório Pedagógico

Além do `execution-report` técnico (Regra 15), registrar em `reports/` um resumo compacto das **decisões e aprendizados**:

```markdown
## PEDAGOGICAL CHECKPOINT SUMMARY

### Checkpoint 0 — Abordagem
- Opções consideradas: A, B, C
- Escolhida: A
- Razão: <justificativa mentorado>

### Checkpoint 1 — Plano
- Aprovado: ✓
- Ajustes pedidos: <nenhum ou lista>

### Checkpoint 2 — Execução
- Resultado: ✓ conforme plano
- Validações: ✓ todas passaram

### Checkpoint 3 — Sync & Cleanup
- Merge detectado: Sim
- Branches deletadas: feature/pr-5, feature/pr-6
- Local sincronizado: Sim

### Checkpoint 4 — Fronteira / Encerramento
- Unidade fechada: Sim (working tree limpa, relatório escrito)
- Parou e pediu o próximo passo: Sim

### Aprendizados Registrados
- <conceito 1>: <breve reflexão>
- <conceito 2>: <breve reflexão>

### Próximo Passo
- <recomendação pedagógica>
```

Não é recursão (não relatar o relatório pedagógico) — apenas **registrar** as escolhas feitas.

---

## 4. Integração com Regras 12–15

```text
REGRA 12 (Edição)
↓ autoriza alteração de artefatos
↓
REGRA 16 → CHECKPOINT 0 & 1 (questionar)
↓
REGRA 12 (executa edição)
↓
REGRA 16 → CHECKPOINT 2 (validar)
↓
REGRA 14 (Git Safe Publishing)
→ GATE 1 (staging + commit, após checkpoint 2)
↓
REGRA 15 (Execution Report)
→ relatório técnico + pedagógico
↓
REGRA 14 → GATE 2 (push)
↓
REGRA 14 → PR (autorização separada)
↓
MERGE HUMANO NO GITHUB (Gate 3)
↓
REGRA 16 → CHECKPOINT 3 (sync & cleanup — se merge detectado)
↓
REGRA 14 → GATE 4 (executa sync + branch -d + push --delete)
↓
REGRA 16 → CHECKPOINT 4 (fronteira — parar ao fechar a unidade de trabalho)
```

<!-- ALTERADO 2026-09-03: ordem corrigida — Checkpoint 3 estava antes do Gate 2; passou para depois de push/PR/merge, com o Gate 4 da rules/14 logo a seguir. -->
Cronologia: o Checkpoint 3 e o Gate 4 acontecem **depois** do merge — nunca antes do push.

**Hierarquia**: se houver conflito entre esta Regra e outra, a **pedagogia não pode ser comprometida** — pausas nunca são opcionais.

---

## 5. Quando Pular Checkpoints (Exceções Raras)

Pular checkpoints SOMENTE quando **explicitamente autorizado pelo mentorado** no início da sessão.

Exemplo autorização explícita:

```
"Para esta tarefa, pode pular os checkpoints pedagógicos.
Só execute e me avise quando terminar."
```

Registrar a exceção no `reports/` da execução.

---

## 6. Registro das Decisões

Toda decisão tomada com o mentorado (Checkpoint 0–4) deve:

1. Ser **anotada** no relatório técnico (Regra 15)
2. Ser **refletida** no relatório pedagógico (Seção 3 desta Regra)
3. **Não** ser usada para substituir a próxima pergunta

Exemplo errado ❌:

```
Mentorado escolheu Opção A em Checkpoint 0.
Na próxima tarefa, usar Opção A sem questionar.
```

Exemplo correto ✅:

```
Mentorado escolheu Opção A em Checkpoint 0 (registrado).
Na próxima tarefa, questionar de novo — contexto mudou.
Registrar se escolhe A novamente ou muda de ideia.
```

---

## 7. Critério de Sucesso

Esta Regra funciona quando:

```
Mentorado sente-se guiado, não apressado
↓
Cada checkpoint traz clareza antes de ação
↓
Cada unidade de trabalho fecha num ponto de parada limpo
↓
Decisões são registradas com "por quê"
↓
Próxima sessão pode retomar sem reler tudo
↓
Autonomia cresce, mas pedagogia não é perdida
```

---

<!-- ALTERADO 2026-09-01: seção promovida de nota descritiva para regra normativa de consolidação de commits por escopo. -->
## 8. Consolidação de commits por escopo

Commits refletem **aprovações pedagógicas por escopo**, não microações por arquivo.

**Heurística:** *"Consigo descrever este commit em uma frase, sem usar "e" nem
"também" para juntar propósitos diferentes?"*

- **Sim → 1 commit.** Mesmo propósito atravessando N arquivos é um commit só
  (ex.: renomear uma referência em 14 arquivos; corrigir typos num conjunto de
  docs; atualizar paths em `rules/` + `skills/`).
- **Não → N commits**, um por propósito lógico independente (ex.: *criar* uma
  regra nova; *atualizar* as referências a ela; *gerar* o relatório — três
  propósitos, três commits).

Consequências: commits maiores e mais significativos, branches com vida mais
longa, PRs com histórico legível de decisões. Isto **não é ineficiência** — é
design pedagógico e reduz ruído de histórico.

Relação com as outras regras: a **Regra 12** define *como* editar (cirúrgico,
comentário no ponto alterado); esta seção define *quando agrupar* as edições num
commit. A skill `git-closure` (Regra 14) aplica a heurística no passo de proposta
de commit.
