---
name: release-readiness
description: Use esta skill para checar prontidao de release com foco em risco operacional, rollback, observabilidade e pendencias criticas.
---

# Release Readiness

## Quando Usar

- antes de merge para branch principal
- antes de deploy de producao
- em hotfix com impacto alto

## Entradas Minimas

- changelog da entrega
- status de testes
- estrategia de deploy/rollback

## Procedimento

1. verificar bloqueadores conhecidos
2. validar plano de rollout e rollback
3. confirmar sinais minimos de observabilidade
4. revisar impacto em usuarios e dependencia externa
5. emitir decisao: READY ou NOT_READY

## Checklist

- [ ] sem bloqueador aberto
- [ ] rollback validado
- [ ] monitoramento minimo definido
- [ ] ownership de incidente claro

## Regras

- se rollback nao estiver claro, classificar como NOT_READY
- documentar pendencias com acao e dono
