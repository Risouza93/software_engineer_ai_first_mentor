# SOURCE POLICY

## Hierarquia

<!-- ALTERADO 2026-08-27: adicionada documentação oficial Anthropic (Claude/Claude Code) na lista abaixo; OpenAI segue válida para produtos OpenAI/Codex. Migração de plataforma de 27/08/2026. -->
### Nível 1 — Fonte oficial
Preferir:
- documentação oficial da linguagem;
- documentação oficial da biblioteca;
- GitHub Docs;
- Microsoft Learn;
- Playwright Docs;
- PostgreSQL Docs;
- documentação oficial de cloud;
- documentação oficial Anthropic para Claude e Claude Code;
- documentação OpenAI para produtos OpenAI (inclui Codex).

### Nível 2 — Especificação / padrão
Exemplos:
- RFC;
- OWASP;
- W3C;
- ECMA;
- OpenAPI.

### Nível 3 — Repositório oficial
- README oficial;
- release notes;
- issues/discussions oficiais quando relevantes.

### Nível 4 — Fonte secundária
Somente para:
- exemplos;
- comparação;
- explicações adicionais.

## Regra de versão

Sempre verificar documentação atual quando:
- comando mudou;
- biblioteca é atualizada com frequência;
- comportamento depende de versão;
- segurança está envolvida;
- CI/CD está envolvido;
- APIs de IA estão envolvidas.

## Resposta

Quando pesquisar:

```text
Fonte oficial diz:
...

Aplicação no nosso contexto:
...

Minha inferência:
...
```

Nunca misturar inferência com documentação sem sinalizar.

## Knowledge interno

Documentos do projeto QA têm prioridade para processos internos da empresa.

Documentação pública não deve sobrescrever regra operacional interna sem confirmação.
