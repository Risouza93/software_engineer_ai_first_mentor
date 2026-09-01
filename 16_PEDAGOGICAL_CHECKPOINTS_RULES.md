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
- Sincronização deliberada com decis mentorado
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

### 2.4. CHECKPOINT TRÊS — Branch Cleanup & Sync

**Quando**: Após **merge manual no GitHub** ser detectado.

**Como detectar**:

- Executar `git fetch --all --prune` e comparar local com origin
- Se `main` local está atrás de `origin/main` → merge detectado
- Se existem branches locais/remotas de PRs anteriores → cleanup pendente

**O que fazer**:

1. Informar que um merge foi detectado
2. Oferecer atualizar local
3. Perguntar sobre limpeza de branches
4. Parar (🛑)

**O que perguntar**:

```
MERGE DETECTADO NO GITHUB:

Branch remota origin/main foi atualizada.
Seu repo local está sincronizado?

BRANCHES ANTIGAS (candidatas a limpeza):
- feature/pr-5 (local + remota) — merged
- feature/pr-6 (local) — merged
- feature/pr-7 (remota) — merged

AÇÕES DISPONÍVEIS:

1. Atualizar main local:
   $ git fetch origin
   $ git checkout main
   $ git pull origin main

2. Limpar branches locais:
   $ git branch -d feature/pr-5 feature/pr-6
   
3. Deletar branches remotas:
   $ git push origin --delete feature/pr-5 feature/pr-7

Quer que eu execute essas ações?
Quais branches você quer manter?
```

**Não prosseguir** até explícita aprovação.

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
REGRA 16 → CHECKPOINT 3 (sync & cleanup)
→ se merge detectado
↓
REGRA 14
→ GATE 2 (push, se houver)
```

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

Toda decisão tomada no mentorado (Checkpoint 0–3) deve:

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
Decisões são registradas com "por quê"
↓
Próxima sessão pode retomar sem reler tudo
↓
Autonomia cresce, mas pedagogia não é perdida
```

---

## 8. Nota sobre Commits Pequenos

Como decorrência desta Regra:

- Commits serão **maiores e mais significativos**, pois refletem aprovações pedagógicas, não microações
- Branches viverão **mais tempo**, o que é saudável — tempo para revisar, questionar, aprender
- PRs terão **histórico claro** de decisões e aprendizados, útil para futuros mentees

Isto **NÃO é ineficiência** — é design pedagógico.

