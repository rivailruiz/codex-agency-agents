# Prompts de Handoff e Review

## 1) Solicitar handoff completo

```text
Prepare um handoff completo no formato playbooks/handoff-standard.md para o próximo agente.
Inclua arquivos alterados, comandos executados, testes e riscos pendentes.
```

## 2) Reabrir tarefa após reprovação

```text
A revisão final retornou CHANGES_REQUESTED.
Reabra somente os itens bloqueadores, sem expandir escopo.
Depois gere novo handoff para test-engineer.
```

## 3) Aplicar quality gate antes de reviewer

```text
Use a skill quality-gate para avaliar esta entrega.
Se houver ausência de evidência, marcar FAIL automaticamente.
```

## 4) Checar prontidão de release

```text
Use a skill release-readiness.
Avalie rollout, rollback, monitoramento e pendências críticas.
Retorne READY ou NOT_READY com justificativa curta.
```

## 5) Encaminhar para reviewer

```text
Orchestrator: consolide pacote final, anexe relatório do test-engineer e envie para reviewer.
O reviewer deve decidir conforme playbooks/final-review-flow.md.
```
