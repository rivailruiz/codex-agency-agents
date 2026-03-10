# Codex Agency Agents

Versao redesenhada para Codex da ideia de agencia multiagente orientada a entrega real de software.

## O que este projeto entrega

- arquitetura operacional com `AGENTS.md`
- 8 agentes especializados com responsabilidades claras
- 4 skills reutilizaveis no formato `SKILL.md`
- padrao formal de handoff entre agentes
- fluxo de revisao final com reviewer
- prompts prontos para uso
- instalador para aplicar o kit em outros projetos

## Estrutura

```text
.
├── AGENTS.md
├── README.md
├── agents/
│   ├── orchestrator.md
│   ├── product-planner.md
│   ├── solution-architect.md
│   ├── backend-engineer.md
│   ├── frontend-engineer.md
│   ├── test-engineer.md
│   ├── devops-engineer.md
│   └── reviewer.md
├── skills/
│   ├── spec-to-tasks/SKILL.md
│   ├── code-implementation/SKILL.md
│   ├── quality-gate/SKILL.md
│   └── release-readiness/SKILL.md
├── playbooks/
│   ├── handoff-standard.md
│   └── final-review-flow.md
├── scripts/
│   ├── install.sh
│   └── uninstall.sh
└── examples/
    └── prompts/
        ├── quickstart.md
        └── handoff-and-review.md
```

## Como usar

1. Leia `AGENTS.md` para entender o modelo operacional.
2. Inicie pelo `agents/orchestrator.md` com o contexto do projeto.
3. Acione os demais agentes conforme fase da entrega.
4. Use `playbooks/handoff-standard.md` em todo repasse.
5. Passe obrigatoriamente por `agents/reviewer.md` usando `playbooks/final-review-flow.md`.

## Instalacao em outro projeto

1. Clone este repositorio em qualquer pasta local.
2. Rode o instalador apontando para o projeto de destino.

```bash
./scripts/install.sh --target /caminho/do/projeto
```

Com bootstrap no `AGENTS.md` do projeto destino:

```bash
./scripts/install.sh --target /caminho/do/projeto --bootstrap-agents
```

Modo symlink (facilita atualizar em varios projetos):

```bash
./scripts/install.sh --target /caminho/do/projeto --mode symlink --bootstrap-agents
```

Instalar skills globais no Codex Home (`$CODEX_HOME/skills`):

```bash
./scripts/install.sh --target /caminho/do/projeto --install-global-skills
```

Remocao:

```bash
./scripts/uninstall.sh --target /caminho/do/projeto
```

## Fluxo recomendado

1. `product-planner` define backlog.
2. `solution-architect` define direcao tecnica.
3. `backend-engineer` + `frontend-engineer` + `devops-engineer` implementam.
4. `test-engineer` valida e reporta PASS/FAIL.
5. `reviewer` aprova ou reabre.
6. `orchestrator` fecha ciclo e publica status.

## Skills

- `spec-to-tasks`: transformar especificacao em tarefas testaveis.
- `code-implementation`: implementar com incrementalismo e evidencia.
- `quality-gate`: decidir PASS/FAIL pre-review.
- `release-readiness`: decidir READY/NOT_READY para release.

## Prompts de exemplo

Consulte:

- `examples/prompts/quickstart.md`
- `examples/prompts/handoff-and-review.md`

## Diferencas em relacao ao projeto de origem

- foco em Codex nativo (`AGENTS.md` + `skills/`)
- menos peso de persona, mais protocolo operacional
- fluxo de qualidade mais direto para software delivery
