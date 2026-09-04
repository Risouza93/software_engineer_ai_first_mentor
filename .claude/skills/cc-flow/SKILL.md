---
name: cc-flow
description: >-
  Orquestrar, em ordem, as 3 skills operacionais de uma unidade de trabalho que
  toca Git — pedagogical-checkpoint (regra 16), git-closure (regra 14) e
  execution-report (regra 15) — sem duplicar o procedimento de nenhuma delas.
  Acrescenta 1 passo que nenhuma das 3 cobre sozinha: um pré-voo de branch
  logo após a aprovação do plano e ANTES de qualquer edição, para nunca editar
  em cima de `main`/`master`. Use no início de qualquer tarefa de mentoria que
  vai terminar em commit/push/PR. Autoridade: continua nas regras 14/15/16 —
  esta skill só sequencia, não substitui nenhuma.
---

# cc-flow

Skill fina de orquestração do Claude Code. Não introduz procedimento novo além
do pré-voo de branch — todo o resto é ponteiro para as 3 skills existentes, na
ordem em que uma unidade de trabalho real as usa.
**Autoridade:** `rules/14-git-safe-publishing.md`, `rules/15-universal-execution-reports.md`,
`rules/16-pedagogical-checkpoints.md` — em conflito, a regra específica vence
esta skill.

## Use when

Início de qualquer tarefa de mentoria que vai editar arquivos do repositório e
terminar em commit/push/PR (ou seja, qualquer tarefa que hoje já invocaria
`pedagogical-checkpoint` e, mais adiante, `git-closure` e `execution-report`
separadamente). Nasceu de evidência: 7+ ciclos completos (PRs #13, #15, #19,
#21, #22, #23) seguiram exatamente esta sequência, sempre manualmente.

## Não use para

- Tarefas puramente de leitura/análise que não vão gerar edição nem commit.
- Microações dentro de uma unidade já em andamento (mesmas exceções de
  `pedagogical-checkpoint`).
- Substituir o julgamento de qualquer uma das 3 skills — em dúvida sobre o
  procedimento exato de um Gate ou Checkpoint, ler a skill específica.

## Inputs

- Os mesmos das 3 skills combinadas: tarefa + opções técnicas (checkpoint 0),
  estado Git real (`git status`, `git branch --show-current`), autorizações
  humanas obtidas durante o fluxo.

## Outputs

- Os mesmos das 3 skills combinadas: decisões registradas, arquivos editados,
  relatório em `reports/`, commit(s), push, PR, e o ciclo fechado com Gate 4 +
  Checkpoint 4.

## Procedimento

1. **Checkpoint 0 + Checkpoint 1** (`pedagogical-checkpoint`) — apresentar
   opções e plano técnico; aguardar aprovação. Não editar nada ainda.

2. **🛫 PRÉ-VOO DE BRANCH (novo — o motivo desta skill existir):**
   Imediatamente após a aprovação do Checkpoint 1 e **antes de tocar em
   qualquer arquivo**:

   ```powershell
   git branch --show-current
   ```

   - Se for `main`/`master` → `git checkout -b <prefixo>/<slug-objetivo>`
     **agora**, antes da primeira edição.
   - Se já houver uma branch de trabalho apropriada (não `main`, não uma
     branch de PR já mergeada ou ainda aberta de outro escopo) → seguir nela.
   - Incluir a linha `Branch: <nome>` no próprio texto do Checkpoint 1 (não só
     mentalmente) — é o item concreto que faltou nos 3 ciclos que originaram
     esta skill; um deles chegou a editar em `main` por isso.

3. **Editar** os arquivos aprovados no Checkpoint 1.

4. **`execution-report`** — escrever `reports/report_task_DD-MM-YY_HH-mm.md`
   com o resultado, antes do Checkpoint 2.

5. **Checkpoint 2** (`pedagogical-checkpoint`) — apresentar resultado +
   validações + diff summary; aguardar confirmação.

6. **`git-closure`** — Gate 1 (staging + commit) → Gate 2 (push) → PR
   (autorização separada). Cada gate com autorização explícita própria.

7. Aguardar o merge humano (**Gate 3**, decisão no GitHub).

8. **Checkpoint 3** (`pedagogical-checkpoint`) — ao detectar o merge,
   apresentar a pausa de sync & cleanup; aguardar autorização.

9. **`git-closure` Gate 4** — sync da `main` + remoção da branch local e
   remota, com o precheck `merge-base --is-ancestor`.

10. **Checkpoint 4** (`pedagogical-checkpoint`) — fechar a unidade, resumir o
    que mudou e o que ficou pendente, **parar** e pedir o próximo passo. Não
    encadear para a próxima unidade sem novo pedido.

## Interrupções obrigatórias

As mesmas das 3 skills combinadas — em especial: qualquer edição antes do
Checkpoint 1 aprovado; qualquer commit antes do Checkpoint 2; branch atual
`main`/`master` no pré-voo do passo 2; merge detectado sem Checkpoint 3;
unidade concluída sem Checkpoint 4.

## Validações (Definition of Done)

Ao final, deve ser possível apontar, para a mesma unidade de trabalho: a
branch criada no pré-voo (passo 2) · o relatório (passo 4) · os 4 Gates com
suas autorizações · os checkpoints 0–4 com pergunta/resposta/ação · a parada
no Checkpoint 4.

## Anti-padrões

- Reproduzir aqui o conteúdo de `git-closure` / `execution-report` /
  `pedagogical-checkpoint` — esta skill só aponta e sequencia.
- Pular o pré-voo do passo 2 por já estar "quase certo" de qual branch está
  ativa — o custo do `git branch --show-current` é zero; o custo de editar em
  `main` por engano não é.
- Tratar esta skill como autoridade para decidir o conteúdo de um Gate ou
  Checkpoint — a regra específica (14/15/16) sempre vence.

## Evidência de recorrência

Nasceu diretamente da análise dos PRs #13, #15, #19 (histórico) e #21, #22,
#23 (mesma sessão que criou esta skill, 04/09/2026) — 7 ciclos idênticos na
estrutura, incluindo 1 incidente real (edição em `main` sem branch, corrigido
antes do commit) que motivou o passo 2. Ver
`reports/report_task_04-09-26_14-29.md` (o incidente) e a avaliação registrada
na sessão que introduziu esta skill.
