# REGRA CANÔNICA --- PROGRESS LEDGER V2

## 1. Finalidade

O `10_PROGRESS_LEDGER.md` é um **índice operacional de evolução**, não
um histórico detalhado de sessões.

Ele deve permitir responder com baixo custo de leitura:

1.  Onde o aluno está?
2.  Qual nível foi comprovado em cada skill?
3.  Quais missões foram concluídas, estão em andamento ou bloqueadas?
4.  Quais competências foram comprovadas?
5.  Quais lacunas ainda impedem progressão?
6.  Qual é a próxima missão?
7.  Onde estão as evidências detalhadas?

Detalhes operacionais pertencem aos arquivos de contexto,
comandos/cartilhas e demais artefatos da missão.

------------------------------------------------------------------------

## 2. Princípio de fonte única

Cada informação detalhada deve possuir uma fonte canônica.

``` text
PROGRESS LEDGER
→ estado + evolução + evidências resumidas + lacunas + ponteiros

CONTEXTO DA MISSÃO
→ narrativa, estado, decisões, debugging e continuidade detalhada

COMANDOS / CARTILHA
→ comandos praticados, exemplos, riscos e validações

GIT / ARTEFATOS
→ evidência técnica persistente
```

Não duplicar no Ledger conteúdo que já esteja preservado nesses
artefatos.

------------------------------------------------------------------------

## 3. Estrutura obrigatória

Toda versão futura do `10_PROGRESS_LEDGER.md` DEVE usar exatamente estas
seções de primeiro nível, nesta ordem:

``` markdown
# PROGRESS LEDGER

## 1. Estado atual
## 2. Matriz de competências
## 3. Missões
## 4. Bloqueios e pendências
## 5. Próximo passo
## 6. Regras de manutenção
```

Não adicionar novas seções de primeiro nível sem decisão explícita de
arquitetura.

------------------------------------------------------------------------

## 4. Estado atual

Formato obrigatório:

``` markdown
## 1. Estado atual

**Missão atual/próxima:** MXXX — Nome  
**Última missão concluída:** MXXX — Nome  
**Data da última atualização:** DD/MM/AAAA
```

Adicionar no máximo duas observações globais quando forem realmente
necessárias.

Não registrar hashes, branches, outputs ou comandos nesta seção.

------------------------------------------------------------------------

## 5. Matriz de competências

Usar uma única tabela:

``` markdown
## 2. Matriz de competências

| Skill | Nível | Evidência atual | Próximo critério |
|---|---|---|---|
| PowerShell | N2 forte → N3 | diagnóstico guiado por evidências | autonomia em scripts/debugging |
| Git/GitHub | N2 forte → N3 | branching, PR, diff e merge | cenário autônomo / peer review |
| Codex | N2 forte | foundations + debugging | desafio autônomo |
| Claude Code | — | bloqueado | licença/CLI |
```

Regras: - uma linha por skill; - `Evidência atual`: uma frase curta; -
`Próximo critério`: somente a principal lacuna para progressão; - skills
não iniciadas podem usar `— / não iniciado`; - não repetir histórico de
missões na tabela.

------------------------------------------------------------------------

## 6. Registro de missões

Cada missão deve usar EXATAMENTE este template:

``` markdown
### MXXX — Nome — STATUS

**Data:** DD/MM/AAAA  
**Evolução:** <skill/nível antes → nível depois, ou "sem alteração formal">

**Comprovado**
- <evidência/competência 1>
- <evidência/competência 2>
- <evidência/competência 3>
- <evidência/competência 4 opcional>
- <evidência/competência 5 opcional>

**Debugging-chave**
- <somente incidente que gerou aprendizado relevante; omitir bloco se não houver>

**Lacunas**
- <lacuna 1>
- <lacuna 2>
- <lacuna 3 opcional>

**Detalhes:** `<caminho do contexto/cartilha principal>`
```

STATUS permitido:

``` text
CONCLUÍDA
EM ANDAMENTO
PARCIAL
BLOQUEADA
ADIADA
```

### Budget obrigatório por missão

Cada missão deve ter preferencialmente **12--20 linhas úteis** e nunca
ultrapassar **25 linhas**, exceto decisão explícita de arquitetura.

Limites: - `Comprovado`: 3 a 5 bullets; - `Debugging-chave`: 0 a 2
bullets; - `Lacunas`: 1 a 3 bullets; - `Detalhes`: 1 linha; - sem blocos
extensos de código.

------------------------------------------------------------------------

## 7. O que PODE entrar no Ledger

Somente informações que alterem pelo menos uma destas dimensões:

``` text
NÍVEL
STATUS
COMPETÊNCIA COMPROVADA
LACUNA RELEVANTE
BLOQUEIO
PRÓXIMO PASSO
```

Debugging entra apenas quando comprova capacidade ou revela uma lacuna
relevante.

Exemplo válido:

``` text
diagnosticou commit local não publicado comparando HEAD e origin/branch
```

Exemplo inválido:

``` text
listar todo o output de git log usado no diagnóstico
```

------------------------------------------------------------------------

## 8. O que NÃO pode entrar no Ledger

Não registrar: - listas completas de comandos; - outputs completos de
terminal; - hashes intermediários; - Session IDs; - caminhos
temporários; - narrativa passo a passo; - explicações ELI5; - diagramas
conceituais extensos; - todos os erros encontrados; - todos os conceitos
aprendidos; - listas extensas de "o que consigo explicar"; - detalhes já
preservados em contexto/cartilha; - estado transitório de Working
Tree; - próxima missão repetida dentro de cada missão histórica.

Esses dados devem permanecer nos artefatos detalhados.

------------------------------------------------------------------------

## 9. Bloqueios e pendências

Formato obrigatório:

``` markdown
## 4. Bloqueios e pendências

- **Claude Code:** bloqueado/adiado — licença e CLI corporativa indisponíveis.
- **Git/GitHub N3:** depende de demonstração autônoma em cenário posterior.
```

Somente pendências ativas.

Quando resolvida, remover desta seção e registrar o resultado na
missão/skill correspondente.

------------------------------------------------------------------------

## 10. Próximo passo

Formato obrigatório:

``` markdown
## 5. Próximo passo

**M007 — Leitura de código**

Objetivo: identificar entrada → funções → decisões → dependências → saída.
```

Máximo: 3 linhas úteis.

------------------------------------------------------------------------

## 11. Regras de manutenção

Esta seção deve permanecer estável no próprio Ledger:

``` markdown
## 6. Regras de manutenção

- Ledger = índice de progresso; detalhes ficam nos artefatos da missão.
- Registrar apenas fatos/evidências observados.
- Não promover nível sem evidência de autonomia exigida pelo protocolo.
- Máximo de 25 linhas por missão.
- Não duplicar comandos, outputs ou narrativa já registrados em contexto/cartilha.
- Atualizar a matriz somente quando nível, evidência principal ou critério de progressão mudar.
- Manter somente bloqueios ativos.
```

------------------------------------------------------------------------

## 12. Algoritmo obrigatório de atualização

Ao finalizar ou atualizar uma missão:

``` text
1. Atualizar Estado atual.
2. Verificar se alguma skill mudou de nível/evidência/lacuna.
3. Criar ou alterar somente o bloco compacto da missão afetada.
4. Atualizar bloqueios somente se houve mudança.
5. Atualizar Próximo passo.
6. NÃO reescrever missões antigas sem mudança real.
7. Validar budget de até 25 linhas por missão.
8. Validar que detalhes possuem ponteiro para artefato canônico.
```

------------------------------------------------------------------------

## 13. Regra de compactação

Quando uma competência mais avançada subsumir uma evidência antiga,
manter somente a evidência de maior valor.

Exemplo:

``` text
antigo:
- criou branch;
- trocou branch;
- fez fast-forward;
- criou divergência;
- resolveu conflito;
- analisou PR;
- decidiu merge por evidências;

compactado:
- executa branching divergente, conflitos e integração de PR orientada por evidências.
```

Não confundir compactação com perda de evidência: o detalhe permanece no
contexto/cartilha.

------------------------------------------------------------------------

## 14. Regra de promoção de nível

O Ledger registra o nível; não redefine o protocolo pedagógico.

``` text
execução guiada
→ evidência de competência

execução autônoma repetível
→ evidência para promoção de autonomia
```

Se a missão indicar "transição para N3", não converter automaticamente
para N3 apenas por acumular atividades guiadas.

------------------------------------------------------------------------

## 15. Regra de validação antes de salvar

Checklist obrigatório:

``` text
[ ] Estado atual correto?
[ ] Matriz contém somente síntese?
[ ] Apenas missões afetadas foram alteradas?
[ ] Cada missão <= 25 linhas?
[ ] Sem comandos/outputs extensos?
[ ] Sem duplicação com contexto/cartilha?
[ ] Evidências são observadas, não presumidas?
[ ] Lacunas ainda são atuais?
[ ] Bloqueios contém somente itens ativos?
[ ] Próximo passo está correto?
[ ] Artefatos detalhados estão referenciados?
```

Se qualquer resposta for "não", corrigir antes de considerar o Ledger
atualizado.

------------------------------------------------------------------------

## 16. Política de migração do Ledger legado

O Ledger legado não deve ser destruído durante a migração.

Procedimento:

``` text
10_PROGRESS_LEDGER.md atual
→ preservar como archive/progress-ledger-legacy.md
→ gerar novo 10_PROGRESS_LEDGER.md conforme V2
→ conferir missão por missão
→ garantir que nível, competências, lacunas e bloqueios foram preservados
→ detalhes continuam nos contextos/cartilhas
```

Após a migração, somente a V2 deve receber novas atualizações.

------------------------------------------------------------------------

## 17. Critério de sucesso

Uma leitura do Ledger deve ser suficiente para reconstruir o estado
pedagógico atual, mas NÃO para reconstruir toda a sessão.

``` text
Ledger
→ O QUE foi comprovado e O QUE falta

Contexto/cartilha
→ COMO aconteceu e QUAIS evidências detalhadas sustentam
```

Essa separação é obrigatória para controlar crescimento e custo de
tokens.

------------------------------------------------------------------------

<!-- ALTERADO 2026-08-27: nova seção — regra canônica de reconciliação de estado antes de retomada (análise arquitetural de 27/08/2026). -->
## 18. Regra de reconciliação de estado antes de retomada

Antes de retomar uma sessão significativa, validar a consistência entre as
fontes de estado:

``` text
10_PROGRESS_LEDGER.md
        +
context/chat_history/ — arquivo mais recente relevante
        +
git status / git branch --show-current / git log --oneline
        ↓
detectar divergências (missão, nível, bloqueio, branch)
        ↓
reconciliar o Ledger antes de avançar o conteúdo
```

Procedimento:

1. Ler o Estado atual e a Matriz do Ledger.
2. Ler o contexto de sessão mais recente relevante em `context/chat_history/`.
3. Observar o estado real do Git (branch de trabalho e histórico recente).
4. Se houver divergência, atualizar o Ledger de forma incremental conforme as
   seções 3–12 desta regra, registrando apenas evidências observadas.
5. Só então retomar a formação.

Esta etapa é documental. Não há automação executável definida ainda.
