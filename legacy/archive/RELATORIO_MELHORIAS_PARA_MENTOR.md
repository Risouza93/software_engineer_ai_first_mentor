<!-- CRIADO 2026-09-03: relatório de handoff entre projetos — não é um execution-report da Regra 15 (esses ficam em reports/); este documenta 2 melhorias feitas no qa_automation para avaliação/porte no software_engineer_ai_first_mentor, projeto de origem das rules/12-16. Movido para archive/2026-09-handoff-mentor/ (decisão do usuário) — não é artefato de propósito esgotado como o resto de archive/, mas fica fora da raiz até ser copiado/usado no projeto-alvo. -->
# Relatório — melhorias no `qa_automation` candidatas a porte no `software_engineer_ai_first_mentor`

**De:** `qa_automation` (`C:\Users\richard.feitosa\Documents\ia\qa_automation`)
**Para avaliação em:** `software_engineer_ai_first_mentor` (`C:\Users\richard.feitosa\Documents\ia\software_engineer_ai_first_mentor`)
**Data:** 03/09/2026

## Por que este relatório existe

As regras `rules/12-16` do `qa_automation` foram adaptadas do
`software_engineer_ai_first_mentor` (ver cabeçalhos `<!-- CRIADO -->` de cada
arquivo em `rules/`). Nesta sessão, o `qa_automation` corrigiu 2 problemas reais
nessa governança. Antes de propor o porte, **verifiquei diretamente no
`software_engineer_ai_first_mentor`** se os mesmos problemas existem lá — não é
suposição, é evidência lida no próprio repositório (caminhos e trechos citados
abaixo). As duas melhorias são independentes; podem ser portadas separadamente.

---

## Melhoria 1 — Gate 4: sync & cleanup pós-merge formalizado em `rules/14`

### Problema original (existia nos dois projetos)

O fluxo de Git safety (`rules/14-git-safe-publishing.md`) definia Gates
numerados só até o merge (Gate 1 commit, Gate 2 push, PR, merge = Gate 3), e
**parava aí**. O passo seguinte — atualizar a `main` local e remover a branch já
mergeada — só existia como uma pausa pedagógica dentro de `rules/16`
("Checkpoint 3 — Branch Cleanup & Sync"), que também continha **os comandos
Git crus** ("AÇÕES DISPONÍVEIS: 1. Atualizar main local... 2. Limpar branches
locais... 3. Deletar branches remotas..."). Duas consequências:

1. Quem lia só `rules/14` (a autoridade de Git safety) não sabia que esse passo
   existia — a regra de segurança de Git tinha um buraco.
2. Mecânica de Git (comandos) duplicada dentro de uma regra de *pedagogia*
   (quando pausar), que é responsabilidade diferente.

### O que o `qa_automation` fez (PR #13, commit `4119921`)

Refatoração por separação de responsabilidade — **não** um simples "Gate 3b"
colado em algum lugar:

- **`rules/14-git-safe-publishing.md`** ganhou uma nova seção nomeada
  **"GATE 4 — autorização para sync & cleanup pós-merge"** (§12, entre "Pull
  Request" e "Operações proibidas"), com: como detectar, comandos exatos
  (`git fetch --prune`, `git merge --ff-only`, `git branch -d`,
  `git push origin --delete`), e a mesma caixa de autorização explícita usada
  nos Gates 1/2. Seções seguintes renumeradas (§12→13 ... §18→19); fluxo
  canônico e critério de sucesso atualizados para incluir o Gate 4.
- **`rules/16-pedagogical-checkpoints.md`** manteve o Checkpoint 3 (é
  legitimamente pedagógico: decide *quando* parar e perguntar), mas **perdeu a
  lista de comandos crus** — agora aponta para o Gate 4 ("após a aprovação
  aqui, a execução segue o Gate 4 da `rules/14` §12"). O diagrama de integração
  também foi corrigido: Checkpoint 3 estava, incoerentemente, *antes* de
  Gate 2/PR/merge; passou para depois, onde faz sentido cronológico.
- Propagado para coerência (mesma mudança, sem nova decisão): digest
  `rules/00-operating-model.md` (Gate 4 na lista de Gates humanos),
  `rules/README.md`, `AGENTS.md`, e os procedimentos operacionais que
  espelhavam o conteúdo antigo — `skills/operational/git-closure.md` (o §8,
  antes rotulado "Gate 3", virou "🛑 GATE 4"), `skills/operational/
  pedagogical-checkpoint.md` e o adapter `.claude/skills/git-closure/SKILL.md`.

Diff completo: PR #13 em `github.com/Risouza93/qa-engineering-lab` (8 arquivos,
+101/−42). Origem da pergunta: durante o PR #12, o usuário perguntou por um
"Gate 3b" que eu havia usado informalmente — a busca revelou que esse rótulo
não existia em lugar nenhum, e a correção virou esta refatoração.

### Confirmado no `software_engineer_ai_first_mentor`: o mesmo gap existe

- `rules/14-git-safe-publishing.md` termina em `## 17. Relatório da execução`
  (a numeração local do fluxo canônico é `## 16`), sem Gate 4. `## 11. Pull
  Request` nem chega a nomear o merge como "Gate 3" explicitamente — está
  menos desenvolvido que a versão atual do `qa_automation` neste ponto.
- `rules/16-pedagogical-checkpoints.md` §2.4 (linha ~131) tem exatamente a
  mesma estrutura, incluindo a lista crua **"AÇÕES DISPONÍVEIS"** (linha 161)
  com os comandos de sync/cleanup duplicados dentro da regra pedagógica.
- O procedimento executável canônico — que **lá vive em
  `.claude/skills/git-closure/SKILL.md` diretamente** (não em
  `skills/operational/`, que é só um ponteiro; ver nota estrutural abaixo) —
  tem `### 8. Pós-merge (quando o humano mergear)` (linha 147) com os mesmos
  comandos, sem rótulo de Gate.
- `rules/00-operating-model.md` (digest) lista só Gate 1, Gate 2 e "PR —
  autorização separada" — sem numerar merge nem mencionar o pós-merge.

**Recomendação:** portar a mesma refatoração, adaptada aos caminhos reais de
lá (ver diferença estrutural abaixo e o prompt anexo).

---

## Melhoria 2 — README como mapa enxuto (referência, não reprodução)

### Problema original (só confirmado no `qa_automation`)

O `README.md` do `qa_automation` tinha 679 linhas e reproduzia integralmente
conteúdo que já vivia, duplicado, em `instructions/03-11` (catálogo de skills,
gaps, quality gates, roadmap por fase, governança) — dois lugares para manter
sincronizados, um deles claramente a fonte errada.

### O que o `qa_automation` fez (PR #12, commits `8c64a63`/`a8e3206`)

Reescrita completa como mapa de navegação (propósito → arquitetura → fluxo
prático → referências), caindo para 269 linhas. Toda seção que já existia em
`instructions/` virou ponteiro de 1 linha em vez de reprodução. Princípio
central: **README = mapa do projeto, não o projeto** — e nomes de diretório
usados no mapa são sempre os reais do filesystem, nunca aspiracionais.

### Aplicabilidade ao `software_engineer_ai_first_mentor`: avaliar, não copiar

Não verifiquei o tamanho/conteúdo do `README.md` de lá em detalhe — só
confirmei que a estrutura de pastas é **diferente o suficiente** para que o
mapa não possa ser copiado (lá existem `agents/`, `knowledge/`, `prompts/`,
`legacy/`, `skills/`, `instructions/`, `rules/`, `memory/`, `reports/`,
`backup_context/`, `context/`; não existem `contracts/` nem `runtime/`, que são
específicos do `qa_automation` por ser multi-runtime). O princípio (mapa,
referências, nomes reais de diretório) é portável; o conteúdo, não.
**Recomendação:** aplicar como decisão separada, só se o README de lá também
tiver o mesmo problema de reprodução — não incluído no prompt anexo como ação
obrigatória.

---

## Diferença estrutural relevante entre os dois projetos

Antes de portar qualquer coisa, quem for aplicar precisa saber que os dois
projetos **não têm o mesmo layout**, mesmo com regras de origem comum:

| Aspecto | `qa_automation` | `software_engineer_ai_first_mentor` |
|---|---|---|
| Runtime | Multi-runtime (Claude + Codex) | Single-runtime (só Claude) |
| Entrada Codex | `AGENTS.md` na raiz | Não existe |
| Fonte canônica de `git-closure` | `skills/operational/git-closure.md` (lido pelos 2 runtimes; `.claude/skills/` é só adapter) | `.claude/skills/git-closure/SKILL.md` diretamente (`skills/operational/*-skill.md` são só ponteiros) |
| Numeração de `rules/14` | Termina em §19 (após o Gate 4 desta sessão) | Termina em §17, sem Gate 4, sem rotular merge como "Gate 3" |
| Pastas de conteúdo | `contracts/`, `runtime/`, `instructions/` | `knowledge/`, `prompts/`, `legacy/` |

Isso é exatamente por que o arquivo anexo é um **prompt para verificar e
adaptar**, não um diff pronto para colar.

---

## Como usar este par de arquivos

1. Copie (ou apenas leia) este relatório e `PROMPT_PORTAR_MELHORIAS_MENTOR.md`
   para dentro do `software_engineer_ai_first_mentor`.
2. Abra uma sessão Claude Code (ou Codex) **naquele repositório**.
3. Cole o conteúdo de `PROMPT_PORTAR_MELHORIAS_MENTOR.md` como prompt.
4. O agente lá deve seguir os próprios Checkpoints/Gates daquele projeto — este
   relatório é evidência de contexto, não autorização para editar.
