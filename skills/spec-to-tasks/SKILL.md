---
name: spec-to-tasks
description: Use esta skill quando for preciso converter uma especificacao de produto em backlog tecnico priorizado, com criterios de aceite objetivos e dependencias claras.
---

# Spec to Tasks

## Quando Usar

- requisito amplo ou ambiguidade de escopo
- ausencia de backlog tecnico executavel
- necessidade de alinhar produto e engenharia rapidamente

## Entradas Minimas

- objetivo do produto/feature
- restricoes de prazo e escopo
- estado atual do sistema

## Procedimento

1. extrair objetivo principal e nao objetivos
2. quebrar em epicos e tarefas pequenas
3. definir criterio de aceite testavel para cada tarefa
4. mapear dependencias e riscos
5. priorizar por impacto x risco x esforco

## Formato de Saida

- `Objetivo`
- `Backlog priorizado`
- `Criterios de aceite por tarefa`
- `Dependencias`
- `Riscos`
- `Perguntas em aberto`

## Regras

- evitar tarefas vagas como "melhorar" ou "otimizar" sem metrica
- evitar escopo extra sem relacao direta com objetivo
