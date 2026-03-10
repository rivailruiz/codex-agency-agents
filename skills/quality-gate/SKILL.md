---
name: quality-gate
description: Use esta skill para validar uma entrega com criterio objetivo de PASS/FAIL, cobrindo aceite, testes, risco e evidencias antes do reviewer final.
---

# Quality Gate

## Quando Usar

- apos implementacao de uma ou mais tarefas
- antes de enviar para reviewer
- para decidir retorno para correcoes

## Entradas Minimas

- criterios de aceite
- diff/arquivos alterados
- resultados de testes

## Procedimento

1. validar aceite item a item
2. confirmar execucao de testes relevantes
3. avaliar risco de regressao e operacao
4. classificar severidade de problemas
5. emitir resultado: PASS ou FAIL

## Formato de Saida

- `Resultado final: PASS/FAIL`
- `Evidencias verificadas`
- `Problemas encontrados`
- `Severidade e impacto`
- `Acoes necessarias`

## Regras

- sem evidencias, status padrao e FAIL
- problemas bloqueantes impedem avancar para reviewer
