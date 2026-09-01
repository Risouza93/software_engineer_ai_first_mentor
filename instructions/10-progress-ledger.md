# PROGRESS LEDGER

## 1. Estado atual

<!-- ALTERADO 2026-08-27: reconciliado com contextos de 25/08 e 27/08 (Claude Code em N2, M008 em andamento) e data de atualização. -->
**Missão atual/próxima:** M008 --- Programação (em andamento)\
**Última missão concluída:** M007 --- Leitura de código\
**Data da última atualização:** 27/08/2026

M004 permanece PARCIAL: Codex e Claude Code Foundations concluídos de forma
guiada (N2); pendente a comparação controlada Codex × Claude Code.

## 2. Matriz de competências

  --------------------------------------------------------------------------
  Skill               Nível          Evidência atual      Próximo critério
  ------------------- -------------- -------------------- ------------------
  PowerShell          N2 forte → N3  filesystem,          scripts,
                                     objetos/pipelines,   tratamento de
                                     processos/rede,      erros e
                                     debugging por        diagnóstico mais
                                     evidências e         autônomo
                                     PSReadLine           

  Git/GitHub          N2 forte → N3  Git local/remoto,    cenário autônomo,
                                     branching            peer review e
                                     divergente,          fluxos protegidos
                                     conflitos, PR/diff,  
                                     review e merge       

  AI Coding Tools --- N2 forte       foundations,         desafio autônomo e
  Codex                              permissões, review,  recursos avançados
                                     Git como evidência e 
                                     debugging de PATH    

  AI Coding Tools --- N2             instalação,          comparação
  Claude Code                        autenticação,        controlada Codex
                                     leitura + alteração  × Claude Code;
                                     mínima com rollback  desafio autônomo
                                     (guiado)

  Leitura de código   N3             análise autônoma de  consolidar em
                                     fluxo, dados, riscos código real e
                                     e testes             debugging

  JavaScript          N1 → N2        variáveis, tipos,    loops e funções;
                      (guiado,       operadores e         checkpoint
                      M008)          if/else if           autônomo da M008
                                     guiados; debug de
                                     sintaxe assistido

  TypeScript          ---            não iniciado         missão futura

  Python              ---            não iniciado         missão futura

  APIs                ---            não iniciado         missão futura

  SQL/PostgreSQL      ---            não iniciado         missão futura

  Containers/Podman   ---            não iniciado         missão futura

  Playwright          ---            não iniciado         missão futura

  CI/CD               ---            não iniciado         missão futura

  Observabilidade     ---            não iniciado         missão futura

  Arquitetura         ---            não iniciado         missão futura

  AI Engineering      ---            não iniciado         missão futura
  --------------------------------------------------------------------------

## 3. Missões

### M001 --- PowerShell --- CONCLUÍDA

**Data:** 13/08/2026\
**Evolução:** N0/N1 → N2 forte, com sinais de transição para N3.

**Comprovado** - opera filesystem, arquivos, variáveis, objetos e
pipelines PowerShell; - investiga processos, PID, portas, TCP, DNS e
HTTP/HTTPS em nível introdutório; - aplica debugging por sintoma →
evidência → hipótese → teste → conclusão; - adaptou pipelines para
requisitos novos e investigou conectividade sem concluir além das
evidências; - ampliou ergonomia com histórico persistente/PSReadLine sem
alteração formal de nível.

**Debugging-chave** - diferenciou falha de host de ausência de serviço
TCP escutando; - corrigiu escolha incorreta da fonte de objetos durante
investigação de rede.

**Lacunas** - scripts, funções e tratamento de erros; - pipelines mais
complexos e debugging de rede mais autônomo; - fundamentos de rede/HTTP
em maior profundidade.

**Detalhes:** artefatos/contextos da M001 e atualização complementar de
PowerShell no Ledger legado.

### M002 --- Git Foundations --- CONCLUÍDA

**Data:** 13/08/2026\
**Evolução:** fundamentos em construção → N2 forte em Git local.

**Comprovado** - distingue Working Tree, Staging Area, commit,
histórico, branch e HEAD; - executa staging seletivo, commits, diff e
restore de forma consciente; - inspeciona histórico/conteúdo e
interpreta estados tracked/untracked/modified/staged; - criou/trocou
branches, realizou fast-forward e removeu referência integrada com
segurança.

**Debugging-chave** - separou estado Git de problemas de line
endings/encoding e aprendeu a lidar com o pager.

**Lacunas** - operações remotas ainda não faziam parte desta missão; -
divergência/conflitos avançados e recuperação de histórico ainda não
comprovados aqui.

**Detalhes:** registro detalhado da M002 no Ledger legado.

### M003 --- GitHub --- CONCLUÍDA

**Data:** 14/08/2026\
**Evolução:** Git local N2 forte → Git/GitHub N2 forte, entrando em N3.

**Comprovado** - conecta repositório local ao `origin` e distingue
local, remoto e tracking; - pratica `fetch`, `pull`, `push` e `clone`
conscientemente; - executa feature branch → PR → review de diff/risco →
merge → sincronização; - remove branches local/remota sem confundir
referência com histórico integrado.

**Lacunas** - autonomia N3; - branch protection, rebase e diagnóstico
remoto mais complexo; - review real de PR de outro engenheiro.

**Detalhes:** registro detalhado da M003 no Ledger legado.

### M004 --- AI Coding Tools Foundations --- PARCIAL

<!-- ALTERADO 2026-08-27: Claude Code deixou de estar bloqueado e foi concluído em N2 guiado (contextos 25/08 e 27/08). M004 segue PARCIAL pela comparação Codex × Claude Code pendente. -->
**Data:** 14/08/2026 (Codex) / 25/08/2026 (Claude Code)\
**Evolução:** Codex N0/N1 → N2 forte; Claude Code não iniciado → N2 (guiado).

**Comprovado** - opera Codex com sandbox/permissões e progressão leitura
→ alteração controlada; - instala, autentica e opera Claude Code em
leitura controlada, alteração mínima e rollback, com escopo restrito; -
usa Git como evidência independente e trata AI review/finding como
hipótese a validar; - distingue capacidade técnica, autorização
operacional, correção e decisão humana; - mantém autonomia limitada ao
escopo necessário, sem ampliar permissões nem contornar controles.

**Debugging-chave** - confirmou finding real da IA antes de corrigir; -
diagnosticou `CommandNotFoundException` (Codex e Claude Code)
distinguindo instalação funcional de resolução no PATH da sessão.

**Lacunas** - Codex e Claude Code N3 autônomos e recursos avançados; -
comparação controlada Codex × Claude Code permanece pendente e mantém a
M004 PARCIAL.

**Detalhes:**
`context/chat_history/CONTEXTO_SESSAO_MISSAO_004_CLAUDE_CODE_FOUNDATIONS_2026-08-25.md`,
`context/chat_history/CONTEXTO_SESSAO_MISSAO_004_MIGRACAO_PROJETO_CLAUDE_2026-08-27.md`
e registro detalhado no Ledger legado.

### M005 --- Branching --- CONCLUÍDA

**Data:** 17/08/2026\
**Evolução:** Git/GitHub N2 forte → N2 forte em transição para N3 em
branching.

**Comprovado** - explica branch como referência móvel e relaciona
branch, HEAD e commit; - cria e interpreta divergência e diferencia
fast-forward de three-way merge; - comprova que divergência não implica
conflito; - diagnostica conflict markers/`both modified`, resolve
manualmente e conclui merge; - valida histórico e remove branches
integradas com segurança.

**Debugging-chave** - resolveu conflito controlado entendendo que editar
→ `git add` → commit são etapas distintas.

**Lacunas** - branching autônomo e escolha de estratégia em cenários
complexos; - conflitos multi-arquivo/rename-delete, rebase e recuperação
avançada; - Vim apenas em nível operacional introdutório.

**Detalhes:** artefatos/contextos da M005 e registro detalhado no Ledger
legado.

### M006 --- PR / Diff --- CONCLUÍDA

**Data:** 17/08/2026\
**Evolução:** Git/GitHub N2 forte → avanço concreto na transição para
N3.

**Comprovado** - analisa diff local/staged, `..`, `...` e merge-base
para delimitar escopo; - revisa PR por intenção → arquivos → diff →
riscos → validações → decisão; - distingue Comment, Approve, Request
changes, self-review e peer review; - diagnosticou diferença entre
commit local e branch remota e confirmou atualização do PR por push; -
executou merge, validação pós-merge e limpeza de branches local/remota.

**Debugging-chave** - diagnosticou encoding inválido e falsos positivos
de path; integrou `.editorconfig` e validação UTF-8 automatizada; -
decidiu merge somente após evidências positivas e ausência de risco
bloqueante identificado.

**Lacunas** - peer review/aprovação independente e branch
protection/required checks; - rebase e estratégias de merge em maior
profundidade; - Git/GitHub N3 ainda requer cenário autônomo.

**Detalhes:**
`context/chat_history/CONTEXTO_SESSAO_MISSAO_006_PR_DIFF_CONCLUIDA_2026-08-17.md`
e cartilha/comandos da M006.

### M007 --- Leitura de código --- CONCLUÍDA

**Data:** 18/08/2026\
**Evolução:** Leitura de código --- não iniciado → N3.

**Comprovado** - localiza ponto de entrada e distingue definição de
execução; - reconstrói call flow e data flow entre múltiplas funções; -
acompanha decisões, `return`, caminhos não alcançados e dependências
externas; - distingue retornos propagados, armazenados e ignorados sem
inventar comportamento; - deriva riscos e testes, separando fatos do
código de hipóteses de negócio.

**Debugging-chave** - corrigiu ao longo da missão confusões entre
argumentos/retornos e fluxo após `return`, sem reincidência relevante no
checkpoint final.

**Lacunas** - consolidar leitura em código real de maior escala e
integrar a habilidade a debugging/implementação.

**Detalhes:**
`CONTEXTO_SESSAO_MISSAO_007_LEITURA_CODIGO_CONCLUIDA_2026-08-18.md`

<!-- ALTERADO 2026-08-27: bloco criado; a M008 já possuía atividade registrada em contexto e não constava aqui. -->
### M008 --- Programação --- EM ANDAMENTO

**Data:** 18/08/2026\
**Evolução:** JavaScript não iniciado → N1/N2 (guiado); sem promoção a N3.

**Comprovado** - transforma regras aritméticas simples em variáveis e
operações e acompanha valores intermediários; - identifica tipos básicos
(String, Number, Boolean, `null`) em exemplos simples; - constrói e
corrige `if/else` e `if/else if/else`, identificando fronteiras e caminho
alcançado; - corrige erros simples de sintaxe com orientação.

**Debugging-chave** - separa lógica correta de sintaxe correta ao depurar
aspas/parênteses/identificadores; correções ainda guiadas.

**Lacunas** - loops e uso consciente de `let`; - funções, módulos,
exceções e estruturas de dados; - checkpoint autônomo abrangente da
missão (necessário para N3).

**Detalhes:**
`context/chat_history/CONTEXTO_SESSAO_MISSAO_008_PROGRAMACAO_EM_ANDAMENTO_2026-08-18.md`
e `context/codes/codigos_escritos.md`.

## 4. Bloqueios e pendências

<!-- ALTERADO 2026-08-27: bloqueio de Claude Code resolvido (instalado/autenticado, N2 guiado); substituído pela pendência ativa da comparação. -->
-   **M004 --- comparação Codex × Claude Code:** pendente; mantém a M004
    PARCIAL. Claude Code deixou de estar bloqueado.
-   **Git/GitHub N3:** depende de demonstração autônoma em cenário
    posterior, além de experiência com peer review/fluxos protegidos.
-   **Codex N3:** depende de desafio autônomo posterior; foundations
    concluído de forma guiada.

## 5. Próximo passo

<!-- ALTERADO 2026-08-27: M008 já em andamento; objetivo ajustado para o ponto de retomada real + pendência paralela da M004. -->
**M008 --- Programação (em andamento)**

Objetivo imediato: consolidar loops e uso consciente de `let`, retomando no
checkpoint do primeiro `for`; depois funções. Em paralelo, resolver a
comparação Codex × Claude Code (M004).

## 6. Regras de manutenção

-   Ledger = índice de progresso; detalhes ficam nos artefatos da
    missão.
-   Registrar somente fatos/evidências observados; não preencher lacunas
    por inferência.
-   Não promover nível sem a evidência de autonomia exigida pelo
    protocolo.
-   Cada missão deve ter preferencialmente 12--20 linhas úteis e nunca
    ultrapassar 25 sem decisão explícita de arquitetura.
-   Não duplicar listas de comandos, outputs, hashes ou narrativa já
    preservados em contexto/cartilha.
-   Atualizar a matriz somente quando nível, evidência principal ou
    critério de progressão mudar.
-   Manter em "Bloqueios e pendências" somente itens ativos.
-   Ao atualizar: alterar Estado atual → skill afetada → missão afetada
    → bloqueios se necessário → Próximo passo.
-   Não reescrever missões históricas sem mudança real.
-   Antes de retomar uma sessão significativa, reconciliar este Ledger com
    o `context/chat_history/` mais recente e o estado do Git (ver
    `11_PROGRESS_LEDGER_RULES.md`, seção 18).
-   A especificação completa desta estrutura está em
    `11_PROGRESS_LEDGER_RULES.md`.
