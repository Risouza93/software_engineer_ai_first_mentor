# CLAUDE CODE — REGRA DE MANUTENÇÃO AUTOMÁTICA DE ARTEFATOS

## 1. Finalidade

Esta política assume que a formação passa a ser conduzida dentro de um **Projeto no Claude**, e não por um GPT personalizado.

Arquitetura operacional:

```text
PROJETO NO CLAUDE
Mentoria, contexto, regras e orquestração
        ↓
CLAUDE CODE
Execução local no repositório
        ↓
GIT
Rastreabilidade e evidência
        ↓
HUMANO
Revisão e aprovação de publicação
```

Esta regra define como o **Software Engineering AI-First Project no Claude** deve delegar ao **Claude Code** a manutenção dos artefatos locais de formação.

A partir de 27/08/2026, quando o usuário solicitar algo equivalente a:

> "vamos criar/atualizar o contexto, comandos, códigos, Progress Ledger, README etc."

o Projeto no Claude deve, por padrão, **gerar um prompt executável para o Claude Code realizar as alterações diretamente no repositório local**, em vez de apenas entregar manualmente o conteúdo final dos arquivos.

O Projeto no Claude continua responsável por:
- decidir pedagogicamente o que deve ser registrado;
- definir escopo e critérios;
- fornecer fatos/evidências observados;
- impor regras de segurança e consistência;
- revisar as evidências retornadas pelo Claude Code.

O Claude Code atua como executor local:
- inspeciona os arquivos canônicos;
- propõe/realiza as alterações autorizadas;
- preserva estrutura e convenções;
- valida o diff;
- reporta exatamente o que mudou.

---

## 2. Gatilhos

Aplicar esta regra quando o usuário pedir criação, atualização, encerramento ou manutenção de artefatos do repositório, incluindo:

- `instructions/10-progress-ledger.md`;
- contexto de sessão em `context/chat_history/`;
- códigos praticados em `context/codes/`;
- comandos executados em `context/commands/` ou no caminho canônico vigente;
- `README.md`;
- skills;
- agents;
- prompts;
- regras;
- catálogos;
- demais documentos operacionais do projeto.

Expressões como estas devem ser interpretadas como gatilho:

```text
vamos criar os arquivos da missão
vamos atualizar o contexto
vamos registrar os comandos
vamos atualizar o Progress Ledger
vamos atualizar README e Ledger
vamos encerrar a missão e gerar os artefatos
vamos salvar o que fizemos no repositório
```

---

## 3. Responsabilidade do Projeto no Claude

Ao detectar o gatilho, o Projeto no Claude deve gerar um **prompt completo para execução no Claude Code**.

O prompt deve informar, conforme aplicável:

1. objetivo da atualização;
2. estado observado da missão/sessão;
3. arquivos que podem ser criados ou alterados;
4. arquivos que não podem ser alterados;
5. conteúdo/fatos que precisam ser preservados;
6. regras canônicas que precisam ser consultadas;
7. convenções de nomes e caminhos;
8. critérios de validação;
9. comandos Git permitidos;
10. ações proibidas;
11. formato esperado do relatório final.

Quando útil, o Projeto no Claude também deve fornecer um **script/comandos PowerShell de validação** para o usuário executar antes/depois da operação.

O Projeto no Claude não deve inventar fatos para preencher artefatos. O conteúdo delegado deve ser baseado nas evidências observadas na sessão e nos arquivos canônicos do repositório.

---

## 4. Inspeção antes da edição

O prompt para Claude Code deve exigir que ele primeiro:

```text
1. leia as regras relevantes;
2. descubra os caminhos canônicos existentes;
3. verifique o estado Git;
4. inspecione os arquivos que serão afetados;
5. determine a alteração mínima necessária;
6. somente então edite.
```

Arquivos de regras devem ter precedência sobre suposições do agente.

Para Progress Ledger, consultar obrigatoriamente a regra canônica vigente, atualmente:

<!-- ALTERADO 2026-09-01: nomes do Progress Ledger e da sua regra atualizados para os caminhos reais em instructions/. -->
```text
instructions/11-progress-ledger-rules.md
```

e localizar o `instructions/10-progress-ledger.md` real antes de alterá-lo.

Para organização de contexto, respeitar a estrutura canônica vigente no repositório e não criar uma estrutura paralela apenas porque ela foi mencionada no prompt.

---

## 5. Progress Ledger

Toda atualização do `instructions/10-progress-ledger.md` deve respeitar a regra canônica do Progress Ledger.

Princípios obrigatórios:

```text
Ledger = índice operacional
Contexto = narrativa/evidências detalhadas
Codes = códigos praticados
Commands = comandos executados
Git = evidência técnica persistente
```

O Claude Code não deve:

- transformar o Ledger em histórico detalhado;
- copiar outputs extensos;
- duplicar conteúdo dos contextos;
- promover nível sem evidência;
- reescrever missões antigas sem mudança real;
- manter bloqueios já resolvidos.

Antes de finalizar, deve validar o budget e checklist definidos pela regra canônica.

---

## 6. Contexto, códigos e comandos

### `context/chat_history/`

Registrar:
- continuidade;
- decisões pedagógicas;
- estado da missão;
- debugging relevante;
- evidências necessárias para retomada;
- próximo ponto de retomada.

### `context/codes/`

Registrar somente quando houver código efetivamente:
- lido;
- analisado;
- criado;
- modificado;
- praticado durante a missão.

Não criar arquivo de código vazio apenas para completar estrutura.

### Comandos

Registrar comandos efetivamente executados e relevantes, incluindo quando aplicável:

```text
comando
→ objetivo
→ resultado observado/esperado
→ validação
→ risco
→ rollback/recuperação
```

Antes de criar o arquivo, Claude Code deve identificar o caminho canônico vigente para comandos.

---

## 7. README e documentação estrutural

`README.md`, catálogos, skills, agents e outros documentos estruturais só devem ser alterados quando a mudança da sessão realmente modificar o que esses arquivos precisam comunicar.

Não atualizar README apenas porque outros artefatos foram atualizados.

Quando houver alteração estrutural, o Claude Code deve verificar se existem referências cruzadas que ficaram desatualizadas.

---

<!-- ALTERADO 2026-09-01: lista de operações Git/destrutivas proibidas removida daqui; a lista canônica vive em rules/14 §13. Mantidos só os pontos específicos desta regra. -->
<!-- ALTERADO 2026-09-03: referência §12 → §13 (rules/14 ganhou a §12 "Gate 4" e renumerou as seções seguintes). -->
## 8. Segurança operacional

Por padrão, o prompt gerado pelo Projeto no Claude deve permitir apenas alterações locais explicitamente relacionadas ao objetivo.

Publicação (commit, push, PR) e operações destrutivas: seguir `rules/14-git-safe-publishing.md` — nada automático sem gate humano; a lista de operações proibidas por padrão está na §13 daquela regra. Instalação de dependências e alteração de configuração/credenciais também exigem autorização explícita.

Nunca incluir segredos, tokens ou credenciais nos prompts/artefatos.

Se encontrar alteração pré-existente não relacionada ao objetivo, Claude Code deve preservá-la e reportá-la, não sobrescrevê-la.

---


## 8.1. Edição cirúrgica e comentários explícitos

Ao atualizar um arquivo existente, o Claude Code deve aplicar **edição cirúrgica**:

- não reescrever o arquivo inteiro quando a melhoria estiver localizada;
- alterar somente os trechos necessários;
- preservar conteúdo válido, estrutura, histórico e convenções fora do escopo;
- evitar reformatação global, renomeações cosméticas e reorganizações não solicitadas;
- identificar exatamente o trecho-alvo antes da edição.

### Comentário explícito obrigatório

Para alterações em documentos Markdown, adicionar junto ao ponto alterado um comentário HTML curto e rastreável:

```html
<!-- ALTERADO 2026-08-27: <o que mudou e por quê> -->
```

Regras:
- comentar somente pontos efetivamente alterados;
- não espalhar comentários em conteúdo não modificado;
- manter o comentário curto e factual;
- não registrar segredo, dado sensível ou narrativa extensa;
- não usar comentário quando ele quebrar parsing, execução ou formato;
- em código/configuração, usar comentário nativo apenas se for seguro; caso contrário, registrar a alteração somente no relatório e no Git diff.

Além dos comentários locais, o relatório final deve informar para cada mudança:

```text
ARQUIVO
→ caminho

LOCAL
→ seção/bloco

ANTES
→ estado anterior resumido

DEPOIS
→ alteração aplicada

MOTIVO
→ evidência que justificou a mudança
```

Regra principal:

```text
ALTERAR SOMENTE O NECESSÁRIO
+
COMENTAR EXPLICITAMENTE O PONTO ALTERADO
+
PRESERVAR TODO O RESTANTE
```

<!-- ALTERADO 2026-08-27: publicação Git delegada à regra 14 e relatórios de execução delegados à regra 15. -->
<!-- ALTERADO 2026-09-01: nomes de arquivo das regras 14 e 15 atualizados para os caminhos reais em rules/ (pós-reorganização da raiz). -->
## 8.2. Publicação Git

Para inspeção Git, `git diff`, validação de diff, staging, commit, `git show`, push e Pull Request, seguir obrigatoriamente:

`rules/14-git-safe-publishing.md`

A autorização para editar artefatos NÃO implica autorização para staging, commit ou push. Esses passos dependem dos gates humanos da regra 14 (Gate 1 = staging + commit; Gate 2 = push; Pull Request = autorização separada).

## 9. Validação obrigatória

Depois das edições, Claude Code deve executar, quando seguro:

```powershell
git status --short
git diff --check
git diff
```

Quando o diff for grande, pode usar comandos adicionais de leitura para resumir/inspecionar arquivos específicos.

O agente deve conferir:

- somente arquivos autorizados foram alterados/criados;
- caminhos e nomes seguem a estrutura existente;
- Markdown está coerente;
- não há duplicação desnecessária;
- fatos registrados correspondem às evidências fornecidas;
- referências entre artefatos estão corretas;
- nenhuma ação proibida foi executada.

---

## 10. Relatório final obrigatório do Claude Code

O prompt deve solicitar resposta final neste formato:

```text
ARQUIVOS CRIADOS
- ...

ARQUIVOS ALTERADOS
- ...

RESUMO DAS ALTERAÇÕES
- ...

VALIDAÇÕES EXECUTADAS
- ...

GIT STATUS
- ...

PENDÊNCIAS / DECISÕES
- ...

NÃO EXECUTADO
- commit
- push
- merge
```

Se uma categoria não se aplicar, informar `nenhum`.

O relatório do Claude Code não substitui a evidência Git.

## 10.1. Relatório de execução

Além do resumo no terminal (seção 10), ao final de cada execução significativa gerar o relatório persistente conforme:

`rules/15-universal-execution-reports.md`

O relatório é salvo em `reports/` (nome `report_task_DD-MM-YY_HH-mm.md`), permanece compacto, factual e orientado a auditoria, e nunca sobrescreve um relatório anterior. Criá-lo não autoriza staging/commit/push: ele só entra no staging após o Gate 1 da regra 14.

---

## 11. Fluxo padrão

```text
USUÁRIO SOLICITA REGISTRO/ATUALIZAÇÃO
              ↓
PROJETO CLAUDE DEFINE CONTEÚDO + ESCOPO
              ↓
PROJETO CLAUDE GERA PROMPT PARA CLAUDE CODE
              ↓
CLAUDE INSPECIONA REGRAS + REPOSITÓRIO
              ↓
CLAUDE ALTERA SOMENTE O AUTORIZADO
              ↓
CLAUDE VALIDA COM GIT
              ↓
USUÁRIO/GPT REVISA DIFF E RELATÓRIO
              ↓
APROVAÇÃO HUMANA PARA COMMIT/PUSH
```

---

## 12. Modelo obrigatório do prompt gerado pelo Projeto no Claude

O Projeto no Claude deve adaptar este esqueleto à missão real:

```text
Você está no repositório <repo>.

OBJETIVO
<objetivo específico>

CONTEXTO OBSERVADO
<fatos e evidências da sessão>

ANTES DE EDITAR
- execute git status;
- leia as regras canônicas relevantes;
- localize os arquivos/caminhos reais;
- inspecione o conteúdo atual;
- preserve alterações pré-existentes não relacionadas.

ESCOPO AUTORIZADO
- criar: <arquivos/categorias>
- alterar: <arquivos/categorias>

REGRAS DE CONTEÚDO
- <regras específicas>
- não invente fatos;
- não duplique detalhes no Progress Ledger;
- use somente evidências observadas/fornecidas.

PROIBIDO
- commit;
- push;
- merge;
- rebase;
- comandos destrutivos;
- instalar dependências;
- alterar segredos/configuração global;
- modificar arquivos fora do escopo sem parar e reportar.

VALIDAÇÃO
- git status --short
- git diff --check
- git diff
- revisar consistência dos artefatos

ENTREGA
Informe arquivos criados/alterados, resumo, validações, estado Git,
pendências e confirme explicitamente que não realizou commit/push/merge.

Realize as alterações locais autorizadas e pare após a validação.
```

---

## 13. Regra para scripts

Quando o usuário pedir também "script", o Projeto no Claude deve preferir:

1. **Claude Code como executor das edições semânticas** dos documentos;
2. PowerShell para preparação, validação ou tarefas determinísticas;
3. evitar scripts que sobrescrevam documentos inteiros quando uma edição contextual pelo Claude Code for mais segura;
4. tornar scripts idempotentes quando possível;
5. explicar risco e rollback de comandos que alteram arquivos.

O script nunca deve incluir segredo real.

---

<!-- ALTERADO 2026-09-01: fronteira Claude/humano descrita 1× em rules/14 §1; aqui só o ponteiro + a nota de evolução, específica desta regra. -->
## 14. Aprovação e autonomia

Esta regra automatiza a **edição local dos artefatos**, não a publicação. A fronteira Claude Code (edita + valida diff) × humano (decide commit/push/merge) é definida em `rules/14-git-safe-publishing.md` §1.

A autonomia pode evoluir posteriormente conforme o Learning Protocol e evidência formal de competência.

---

## 15. Critério de sucesso

A manutenção de artefatos será considerada correta quando:

```text
pedido do usuário
→ prompt reproduzível
→ Claude Code consulta fontes canônicas
→ alteração local mínima
→ artefatos consistentes
→ Git mostra exatamente o esperado
→ nenhuma publicação sem aprovação
→ retomada futura possível com baixo custo de contexto
```
