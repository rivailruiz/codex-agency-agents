# Fluxo de Revisao Final com Reviewer

## Objetivo

Definir o gate final para aprovar ou rejeitar uma entrega antes de merge/release.

## Etapas

1. `orchestrator` consolida pacote final de handoff.
2. `test-engineer` anexa evidencias e resultado PASS/FAIL.
3. `reviewer` revisa criterios de aceite, riscos e impacto operacional.
4. `reviewer` emite uma decisao:
   - `APPROVED`: pode seguir para merge/release.
   - `CHANGES_REQUESTED`: retornar ao agente responsavel com escopo de correcao.
   - `BLOCKED`: existe risco impeditivo; exige decisao tecnica/gerencial.
5. `orchestrator` atualiza status e decide proximo ciclo.

## Checklist do Reviewer

- [ ] criterios de aceite atendidos
- [ ] testes relevantes executados
- [ ] regressao critica nao identificada
- [ ] riscos residuais documentados
- [ ] estrategia de rollback conhecida (quando aplicavel)

## Politica de Reprovacao

Reprovar automaticamente quando houver:

- falha em criterio de aceite critico
- ausencia de evidencias de teste
- risco de seguranca sem mitigacao
- impacto operacional sem plano de rollback

## Formato de Decisao

```markdown
# Reviewer Decision

- Status: APPROVED | CHANGES_REQUESTED | BLOCKED
- Resumo: <1 paragrafo objetivo>
- Bloqueadores:
  - ...
- Ajustes requeridos:
  - ...
- Proximo dono:
- Prazo sugerido:
```
