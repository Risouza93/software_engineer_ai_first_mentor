# REGRA CANÔNICA — EXECUTION REPORTS

**Versão:** 1.0  
**Data:** 27/08/2026  
**Escopo:** universal — aplicável a qualquer repositório/projeto assistido por Claude Code  
**Objetivo:** garantir rastreabilidade compacta de cada execução sem transformar `memory/` em log e sem exigir releitura do terminal/chat.

## 1. Princípio

Toda execução do Claude Code que produza análise, alteração, validação, diagnóstico, decisão ou relatório relevante deve gerar um relatório persistente no repositório.

Diretório canônico:

```text
reports/
```

Se não existir e houver autorização para alterar o repositório, criá-lo.

Não usar `memory/`, `backup_context/` ou `context/chat_history/` como substituto para esta finalidade.

```text
reports/
→ evidência operacional por execução

memory/
→ estado atual mínimo para retomada

backup_context/
→ histórico frio da memory

context/chat_history/
→ contexto narrativo/detalhado quando aplicável
```

---

## 2. Nomenclatura

O modelo lógico solicitado é:

```text
report_task_dd/mm/aa hh:mm
```

Como `/` e `:` não são portáveis em nomes de arquivo — e são inválidos no Windows — a representação física obrigatória será:

```text
report_task_DD-MM-YY_HH-mm.md
```

Exemplo:

```text
reports/report_task_27-08-26_10-41.md
```

Se já existir um relatório com o mesmo minuto, usar sufixo incremental:

```text
report_task_27-08-26_10-41_02.md
report_task_27-08-26_10-41_03.md
```

Nunca sobrescrever relatório anterior.

Usar a data/hora local do ambiente de execução quando disponível.

---

## 3. Quando gerar

Gerar um relatório ao FINAL de cada execução significativa, inclusive quando a execução resultar apenas em análise.

Exemplos:

- arquivos criados;
- arquivos modificados;
- arquivos removidos/movidos;
- diagnóstico;
- auditoria;
- análise de Git;
- validações;
- testes;
- debugging relevante;
- manutenção de contexto/memory;
- compactação;
- preparação de commit;
- commit autorizado;
- push autorizado;
- falha que altere ou afete o estado do trabalho.

Não gerar um relatório novo para cada comando interno ou microação da mesma tarefa.

Regra:

```text
1 TAREFA / EXECUÇÃO SIGNIFICATIVA
→ 1 RELATÓRIO FINAL
```

---

## 4. Relatório obrigatório mesmo sem alterações

Se a tarefa terminar sem alterar arquivos, mas produzir resultado relevante, criar relatório com:

```text
RESULTADO
→ análise/validação concluída

ALTERAÇÕES
→ nenhuma
```

Isso permite recuperar o resultado sem depender do histórico do terminal/chat.

---

## 5. Conteúdo mínimo e token-efficient

O relatório deve ser factual, compacto e suficiente para auditoria.

Estrutura padrão:

```markdown
# TASK REPORT

## METADATA
- Date:
- Time:
- Branch:
- Task:
- Result:

## SUMMARY
<3–8 bullets curtos>

## FILES
### Created
- ...

### Modified
- ...

### Deleted / Moved
- ...

## VALIDATION
- comando/check → resultado

## GIT
- status:
- diff summary:
- commit: not executed / hash
- push: not executed / result

## WARNINGS / CONCURRENT CHANGES
- ...

## PENDING
- ...

## NEXT
- ...
```

Omitir seções vazias quando isso reduzir ruído.

Não copiar:
- todo o terminal;
- todo o `git diff`;
- arquivos inteiros;
- prompts completos;
- stack traces extensos;
- conversa completa;
- conteúdo já preservado em fonte canônica.

Preferir:

```text
fato
→ evidência curta
→ ponteiro para arquivo/comando
```

---

## 6. Alterações concorrentes

Se o Claude detectar arquivos que mudaram durante a execução e não foram alterados por ele, registrar explicitamente:

```text
CONCURRENT / PRE-EXISTING
→ arquivo
→ estado observado
→ ação tomada: preservado / não tocado
```

Nunca atribuir ao Claude uma alteração cuja autoria não possa ser comprovada.

---

## 7. Git e diff

Quando Git estiver disponível, o relatório deve registrar de forma compacta as evidências relevantes.

Antes/depois, conforme aplicável:

```powershell
git status --short
git diff --stat
git diff --check
```

Para staged/commit/push, seguir a política Git canônica do projeto, quando existir.

Não incorporar o patch completo no relatório.

Registrar somente resumo e resultado.

---

## 8. Relação com Git Safe Publishing

A criação do relatório NÃO concede autorização para:

```text
git add
git commit
git push
```

Se existir `14_GIT_SAFE_PUBLISHING_RULES.md`, ela continua governando staging, commit e push.

O relatório criado deve entrar no conjunto de arquivos candidatos ao commit SOMENTE após ser mostrado no Gate 1 e aprovado pelo humano.

Nunca adicionar automaticamente o relatório ao staging apenas porque ele foi criado.

---

## 9. Relação com Memory

Não carregar todos os arquivos de `reports/` durante retomadas normais.

```text
reports/
→ COLD/AUDIT CONTEXT

memory/CURRENT_CONTEXT.md
→ HOT CONTEXT
```

A memory pode apontar somente para o relatório mais relevante quando isso evitar redescoberta.

Exemplo:

```text
Último relatório relevante
→ reports/report_task_27-08-26_10-41.md
```

Não copiar o relatório inteiro para a memory.

---

## 10. Relação com chat_history

`reports/` e `context/chat_history/` têm responsabilidades diferentes:

```text
reports/
→ resultado técnico compacto de uma execução

context/chat_history/
→ contexto detalhado/narrativo de uma sessão quando necessário
```

Um não deve duplicar integralmente o outro.

---

## 11. Edição cirúrgica

A criação do relatório não autoriza alterações adicionais em outros arquivos.

Se a tarefa era somente leitura:

```text
arquivos do projeto
→ não alterar

reports/<novo-relatório>.md
→ única alteração permitida, se a criação de relatório estiver autorizada
```

Se a tarefa autorizava edições, o relatório deve apenas documentá-las.

---

## 12. Relatório do próprio relatório

Evitar recursão.

A criação de:

```text
reports/report_task_....md
```

como etapa final de uma execução NÃO deve gerar um segundo relatório sobre a criação do primeiro relatório.

Regra:

```text
RELATÓRIO ENCERRA A EXECUÇÃO.
NÃO RELATAR O RELATÓRIO EM OUTRO RELATÓRIO.
```

---

## 13. Falha durante a tarefa

Se ocorrer falha antes do objetivo final, mas o repositório tiver sido alterado ou houver diagnóstico relevante, gerar relatório com:

```text
Result: FAILED / PARTIAL
```

Registrar:
- ponto da falha;
- alterações realizadas antes da falha;
- validações executadas;
- estado Git;
- ação necessária para retomada.

Não mascarar falhas como sucesso.

---

## 14. Segurança

Nunca incluir no relatório:

- senhas;
- tokens;
- chaves privadas;
- credenciais;
- conteúdo de `.env` sensível;
- dados pessoais desnecessários;
- segredos encontrados durante análise.

Registrar apenas:

```text
possível segredo detectado
→ caminho/local
→ conteúdo omitido
```

---

## 15. Regra universal de encerramento

Toda execução significativa deve terminar com:

```text
EXECUTAR TAREFA
↓
VALIDAR
↓
CRIAR reports/ SE NECESSÁRIO
↓
CRIAR report_task_DD-MM-YY_HH-mm.md
↓
INFORMAR CAMINHO DO RELATÓRIO
↓
PARAR OU SEGUIR PARA O GATE HUMANO APLICÁVEL
```

Quando houver fluxo de commit:

```text
alterações
↓
relatório final da tarefa
↓
Git inspection/diff
↓
GATE 1
↓
commit autorizado
↓
relatório pode ser atualizado somente se a própria tarefa incluir o encerramento Git
↓
GATE 2
↓
push autorizado
```

Evitar múltiplos relatórios desnecessários da mesma tarefa. Se o fluxo Git fizer parte da mesma execução, atualizar o relatório existente antes de seu encerramento final, desde que ainda não tenha sido commitado.

---

## 16. Critério de sucesso

A regra está funcionando quando, sem reler o chat ou terminal, for possível abrir o relatório de uma execução e responder rapidamente:

```text
O que foi pedido?
O que foi feito?
Quais arquivos mudaram?
O que foi validado?
Houve mudanças concorrentes?
Qual era o estado Git?
Commit foi executado?
Push foi executado?
O que ficou pendente?
Qual é o próximo passo?
```

---

## 17. Princípio final

```text
MEMORY
→ ONDE ESTAMOS

REPORTS
→ O QUE CADA EXECUÇÃO FEZ

CHAT_HISTORY
→ COMO A SESSÃO EVOLUIU

BACKUP_CONTEXT
→ O QUE A MEMORY SABIA ANTES

GIT
→ O QUE TECNICAMENTE MUDOU
```

Relatórios devem aumentar rastreabilidade sem aumentar desnecessariamente o contexto carregado nas próximas sessões.
