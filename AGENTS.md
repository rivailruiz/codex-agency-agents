# Codex Delivery Agents

Este repositório define um sistema multiagente focado em entrega real de software no Codex.

## Objetivo

Entregar software pronto para produção com fluxo explícito:

1. entendimento de escopo
2. decomposição em tarefas
3. implementação
4. validação técnica e funcional
5. revisão final independente

## Princípios

- Priorizar execução sobre persona.
- Toda tarefa precisa de critérios de aceite mensuráveis.
- Todo handoff precisa de contexto mínimo obrigatório.
- Nenhuma entrega é concluída sem reviewer final.

## Estrutura

- `agents/`: agentes especializados.
- `skills/`: skills reutilizáveis (com `SKILL.md`).
- `playbooks/`: protocolo de handoff e fluxo de revisão.
- `examples/prompts/`: prompts prontos para ativação.

## Agentes Disponíveis

- `orchestrator`: coordena o fluxo ponta a ponta.
- `product-planner`: converte objetivo de produto em backlog executável.
- `solution-architect`: define arquitetura e decisões técnicas.
- `backend-engineer`: implementa APIs, regras de negocio e persistencia.
- `frontend-engineer`: implementa UI, estados e integracao com API.
- `test-engineer`: valida funcionalidade, regressao e qualidade.
- `devops-engineer`: pipeline, deploy e observabilidade.
- `reviewer`: gate final de qualidade para liberar entrega.

## Modo de Operacao

1. Acione `orchestrator` com contexto inicial do projeto.
2. `orchestrator` distribui para `product-planner` e `solution-architect`.
3. Implementacao paralela por `backend-engineer`, `frontend-engineer` e `devops-engineer` quando fizer sentido.
4. `test-engineer` executa validacao e abre falhas se necessario.
5. `reviewer` executa revisao final com base em evidencias.
6. Se reprovado, retorna para o agente responsavel via handoff padrao.

## Contrato de Handoff

Todo repasse entre agentes deve seguir `playbooks/handoff-standard.md` e incluir:

- contexto e objetivo da tarefa
- arquivos alterados
- criterios de aceite
- evidencias executadas
- riscos e pendencias
- proximo dono da acao

## Gate Final Obrigatorio

Nenhum trabalho e marcado como concluido sem passar pelo fluxo em `playbooks/final-review-flow.md`.
