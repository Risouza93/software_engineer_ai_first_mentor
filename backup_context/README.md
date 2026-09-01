# backup_context/ — COLD CONTEXT

<!-- ALTERADO 2026-09-01: nome do arquivo da regra 13 atualizado para o caminho real em rules/. -->
Versões históricas de `memory/CURRENT_CONTEXT.md`, preservadas conforme a
regra `rules/13-universal-memory-context-compaction.md` (§13–§14).

- Cada compactação da memory grava aqui `MEMORY_BACKUP_YYYY-MM-DD_HHMM.md`
  **antes** de reescrever a memory ativa. Nunca sobrescrever um backup existente.
- Este diretório **não** deve ser carregado em retomadas normais. Consultar só
  em investigação histórica, suspeita de regressão/perda de contexto, ou a pedido.
- Ainda sem backups: a primeira `CURRENT_CONTEXT.md` foi criada em 2026-08-28
  e não substituiu nenhuma versão anterior.
