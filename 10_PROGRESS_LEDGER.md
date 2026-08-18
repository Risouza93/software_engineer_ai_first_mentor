# PROGRESS LEDGER

## 1. Estado atual

**Missão atual/próxima:** M008 --- Programação\
**Última missão concluída:** M007 --- Leitura de código\
**Data da última atualização:** 18/08/2026

M004 permanece parcial: Codex Foundations concluído; Claude Code
bloqueado/adiado por dependência corporativa.

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

  AI Coding Tools --- ---            bloqueado/adiado     licença e
  Claude Code                                             CLI/configuração
                                                          corporativa

  Leitura de código   N3             análise autônoma de  consolidar em
                                     fluxo, dados, riscos código real e
                                     e testes             debugging

  JavaScript          ---            não iniciado         missão futura

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

**Data:** 14/08/2026\
**Evolução:** Codex N0/N1 → N2 forte; Claude Code não iniciado.

**Comprovado** - opera Codex com sandbox/permissões e progressão leitura
→ alteração controlada; - usa Git como evidência e trata AI
review/finding como hipótese a validar; - distingue capacidade técnica,
autorização operacional, correção e decisão humana; - retoma sessão e
diagnosticou resolução do executável/PATH por evidências; - mantém
autonomia limitada ao escopo necessário, sem ampliar permissões por
conveniência.

**Debugging-chave** - confirmou finding real da IA antes de corrigir; -
diagnosticou `CommandNotFoundException` distinguindo instalação
funcional, PATH persistente e PATH do processo.

**Lacunas** - Codex N3 autônomo e recursos avançados; - Claude Code e
comparação Codex × Claude Code permanecem pendentes.

**Detalhes:** artefatos/contextos da M004 e registro detalhado no Ledger
legado.

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

## 4. Bloqueios e pendências

-   **Claude Code / M004:** bloqueado/adiado --- licença e
    CLI/configuração corporativa ainda indisponíveis; não contornar
    controles corporativos.
-   **Git/GitHub N3:** depende de demonstração autônoma em cenário
    posterior, além de experiência com peer review/fluxos protegidos.
-   **Codex N3:** depende de desafio autônomo posterior; foundations
    concluído de forma guiada.

## 5. Próximo passo

**M008 --- Programação**

Objetivo: construir fundamentos de lógica, variáveis, tipos, condições,
loops e funções, iniciando pela escrita consciente de código.

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
-   A especificação completa desta estrutura está em
    `11_PROGRESS_LEDGER_RULES.md`.
