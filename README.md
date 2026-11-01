<div align="center">

# ⚔️ Bhishma & Arjuna

### A two-agent Claude Code pipeline — plan first, build second, ship clean.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skills-blue)](https://claude.ai/claude-code)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/HarshavardhanIn/bhishma-arjuna/pulls)

</div>

---

## The problem

Most AI coding sessions jump straight into writing code. The agent makes assumptions, picks the wrong pattern, ignores a constraint from the architecture guide — and you get working code that breaks something else.

Bhishma & Arjuna separates thinking from building. You see the plan before a single line is written.

---

## How the pipeline works

```mermaid
sequenceDiagram
    actor You
    participant B as 🔍 Bhishma
    participant A as ⚔️ Arjuna
    participant D as 👨‍💻 Dev-1 · Dev-2 · Dev-3
    participant Q as 🧪 QA-1 · QA-2

    You->>B: /bhishma "add feature X"

    rect rgb(240, 248, 255)
        note over B: Research phase
        B->>B: Read README + architecture docs
        B->>B: Explore relevant layers & components
        B->>B: Find existing patterns to reuse
        B->>B: Reason about approach & trade-offs
    end

    B-->>You: 📋 Approach plan ready — awaiting approval

    alt You approve
        You->>A: /arjuna [hand-off note]
    else You want changes
        You->>B: "Change the approach for X"
        B-->>You: 📋 Revised plan
    end

    rect rgb(240, 255, 240)
        note over A,Q: Implementation phase
        A->>A: Split work into 3 parallel tracks
        A->>D: Assign Track A · B · C
        par Dev-1 builds core feature
        and Dev-2 builds utils / types / API
        and Dev-3 builds integration & wiring
        end
        D-->>A: Dev reports
        A->>A: Resolve conflicts, merge output
        A->>Q: Hand to QA-1 (functional review)
        Q->>Q: Find bugs → fix bugs
        A->>Q: Hand to QA-2 (integration review)
        Q->>Q: Find edge cases → fix them
    end

    A-->>You: ✅ Final report — files changed + bugs fixed + how to verify
```

---

## Inside Arjuna — parallel dev, sequential QA

```mermaid
flowchart TD
    IN([Approved Bhishma plan]) --> SPLIT

    SPLIT[Arjuna splits work into 3 tracks]

    SPLIT --> D1
    SPLIT --> D2
    SPLIT --> D3

    subgraph PARALLEL ["👨‍💻 Developer sub-agents — run in parallel"]
        D1["Dev-1\nCore feature\nPrimary component or route"]
        D2["Dev-2\nUtils · Composables · Types\nAPI layer"]
        D3["Dev-3\nIntegration & wiring\nConfig · Secondary UI"]
    end

    D1 & D2 & D3 --> MERGE

    MERGE[Arjuna collects Dev Reports\nResolves conflicts]

    subgraph SEQUENTIAL ["🧪 QA sub-agents — run in sequence"]
        QA1["QA-1  Functional review\nType errors · Missing null checks\nLayer violations · Auth issues\nLogic bugs"]
        QA2["QA-2  Integration review\nCross-component data flow\nEdge cases · Empty/null states\nAccessibility basics"]
    end

    MERGE --> QA1
    QA1 -->|Fixes applied| QA2

    QA2 --> REPORT

    REPORT(["✅ Final Report\nFiles changed · Bugs fixed · How to verify"])
```

---

## The two skills

| | Bhishma | Arjuna |
|---|---|---|
| **Role** | Research & Planning | Orchestration & Implementation |
| **Input** | Your requirement | Approved Bhishma hand-off note |
| **Output** | Structured approach plan | Final report with all changes |
| **Agents** | 1 (Bhishma) | 5 (Dev-1, Dev-2, Dev-3, QA-1, QA-2) |
| **Human gate** | ✅ Waits for approval | ❌ Runs to completion |
| **Code written** | None | All of it |

---

## Installation

### Into a specific project

```bash
git clone https://github.com/HarshavardhanIn/bhishma-arjuna.git
cp -r bhishma-arjuna/.claude/skills/bhishma your-project/.claude/skills/
cp -r bhishma-arjuna/.claude/skills/arjuna  your-project/.claude/skills/
```

Restart Claude Code, then run `/skills` — you should see both listed.

### Globally (all projects)

```bash
git clone https://github.com/HarshavardhanIn/bhishma-arjuna.git
mkdir -p ~/.claude/skills
cp -r bhishma-arjuna/.claude/skills/bhishma ~/.claude/skills/
cp -r bhishma-arjuna/.claude/skills/arjuna  ~/.claude/skills/
```

### One-liner

```bash
bash <(curl -s https://raw.githubusercontent.com/HarshavardhanIn/bhishma-arjuna/main/install.sh)
```

---

## Usage

**Step 1 — Give Bhishma your requirement**

```
/bhishma Add a data export button to the Connect portal that generates a CSV
```

Bhishma reads your codebase and returns a structured plan: approach, files to change, architecture constraints, risks, and complexity estimate.

**Step 2 — Approve or revise**

```
Approved — hand off to Arjuna
```

Or ask for changes and Bhishma revises the plan and waits again.

**Step 3 — Hand off to Arjuna**

```
/arjuna [paste the Hand-off note from the Bhishma plan]
```

**Step 4 — Review the final report**

Arjuna delivers a report with every file changed, every bug QA found and fixed, and step-by-step verification instructions.

---

## Repo structure

```
.claude/
└── skills/
    ├── bhishma/
    │   └── SKILL.md    ← Research, plan, human approval gate
    └── arjuna/
        └── SKILL.md    ← 3 dev agents (parallel) + 2 QA agents (sequential)
README.md
install.sh
```

---

## Works with any codebase

Built for a Nuxt 4 project with a layered architecture, but not framework-specific. Bhishma reads whatever README, architecture guide, and CLAUDE.md it finds and adapts accordingly. Works with React, Next.js, Laravel, Django — any codebase with readable docs.

---

## Contributing

PRs welcome — better QA prompts, smarter dev track splitting, tighter constraint checking.

---

<div align="center">
Made with Claude Code · MIT Licence
</div>
