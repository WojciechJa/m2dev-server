# AGENTS.md — m2dev server runtime

Read `H:\m2dev-client\AGENTS.md` and
`H:\m2dev-client\m2dev-docs\docs\specifications\development-workflow.md` first.

## Scope and authority

- This repository owns process configuration, server runtime layout, Lua/quest,
  SQL/bootstrap data, locale, proto inputs and map runtime data.
- Server C++ behavior and binary contracts belong to `m2dev-server-src`.
- Treat active CONFIG/SQL/quest/runtime logs as evidence; copied or archived
  runtime trees are not sources of truth.

## Working rules

- Record dirty state before work. This tree contains user/runtime data: never
  bulk-normalize, clean, reset or stage it.
- Quest changes require checking trigger/state, registered C++ API, persistence,
  emitted packets and reload/recompile behavior.
- SQL/proto changes require defaults, keys/indexes, migration, rollback and all
  cache/client consumers. Never edit production data as a substitute for a migration.
- CONFIG/locale/map changes require identifying every channel/process or client
  pack that consumes the file.
- Do not start/stop or mutate a live server unless the task explicitly
  authorizes it.

## Validation

- Quests: run `python make.py` from the active locale quest directory with the
  correct `qc`, then inspect compiler output and `questlua`/`syserr`.
- Configuration/data: validate syntax and paths, then perform a scoped process
  smoke test and inspect `syslog`/`syserr`.
- SQL/proto: test on a disposable database/data copy and verify server-cache and
  both client representations.

Use an atomic repository-local commit linked to the shared WORKLOG ID.
