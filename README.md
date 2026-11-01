# Bhishma & Arjuna — Claude Code Skills

<div align="center">

![MIT Licence](https://img.shields.io/badge/licence-MIT-blue)
![Claude Code](https://img.shields.io/badge/Claude_Code-skill-orange)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)

**A two-skill pipeline for structured software development using Claude Code.**<br>
Bhishma researches and plans. Arjuna builds and tests. You approve everything in between.

</div>

---

## The problem

Most AI coding sessions jump straight into writing code. The agent makes assumptions, picks the wrong pattern, ignores a constraint from the architecture guide — and you get working code that breaks something else.

Bhishma & Arjuna separates thinking from building. You see the plan before a single line is written.

---

## How the pipeline works

```mermaid
flowchart LR
    You([👤 You]) -->|"/bhishma 'add feature X'"| B

    subgraph B ["🔍 Bhishma — Research & Planning"]
        direction TB
        b1[Read README & architecture docs]
        b2[Explore relevant layers & components]
        b3[Find existing patterns to reuse]
        b4[Reason about approach & trade-offs]
        b1 --> b2 --> b3 --> b4
    end

    B -->|"📋 Approach plan ready"| Gate

    Gate{{"⏸️ You\nreview & approve"}}

    Gate -->|"✅ Approved"| A
    Gate -->|"✏️ Revise"| B

    subgraph A ["⚔️ Arjuna — Implementation"]
        direction TB
        a1["👨‍💻 Dev-1 · Dev-2 · Dev-3 run in parallel"]
        a2["🧪 QA-1 functional review + fixes"]
        a3["🧪 QA-2 integration review + fixes"]
        a1 --> a2 --> a3
    end

    A -->|"✅ Final report"| You2([👤 You])
```

---

## Inside Arjuna

Once you approve the plan, Arjuna takes over and coordinates five sub-agents.

```mermaid
flowchart TD
    IN([Approved Bhishma plan]) --> SPLIT[Divide into 3 independent tracks]

    SPLIT --> D1 & D2 & D3

    subgraph PARALLEL ["👨‍💻 Developer sub-agents — run in parallel"]
        D1["Dev-1\nCore feature\n& primary component"]
        D2["Dev-2\nUtilities, types\n& API layer"]
        D3["Dev-3\nIntegration\n& wiring"]
    end

    D1 & D2 & D3 --> MERGE[Collect reports · resolve conflicts]

    MERGE --> QA1

    subgraph SEQUENTIAL ["🧪 QA sub-agents — run in sequence"]
        QA1["QA-1 · Functional\nType errors · null checks · logic bugs\nFinds issues and fixes them"]
        QA2["QA-2 · Integration\nData flow · edge cases · accessibility\nFinds issues and fixes them"]
        QA1 --> QA2
    end

    QA2 --> REPORT(["📋 Final Report\nFiles changed · bugs fixed · items for human review"])
```

---

## Bhishma vs Arjuna

| | 🔍 Bhishma | ⚔️ Arjuna |
|---|---|---|
| **Role** | Research & planning | Orchestration & implementation |
| **Input** | Your requirement in plain language | The hand-off note from an approved Bhishma plan |
| **Output** | Structured approach plan | Final report with all changes and QA results |
| **Sub-agents** | None — Bhishma works alone | 3 developer agents + 2 QA agents |
| **Human gate** | ✅ Yes — stops and waits for approval | None — executes the approved plan |
| **Writes code?** | Never | Yes — all five sub-agents write code |

---

## Installation

### Option 1 — Into a specific project

```bash
git clone https://github.com/HarshavardhanIn/bhishma-arjuna.git
cp -r bhishma-arjuna/.claude/skills/bhishma /path/to/your-project/.claude/skills/
cp -r bhishma-arjuna/.claude/skills/arjuna /path/to/your-project/.claude/skills/
```

### Option 2 — Globally for all projects

```bash
git clone https://github.com/HarshavardhanIn/bhishma-arjuna.git
mkdir -p ~/.claude/skills
cp -r bhishma-arjuna/.claude/skills/bhishma ~/.claude/skills/
cp -r bhishma-arjuna/.claude/skills/arjuna ~/.claude/skills/
```

After installing, verify in Claude Code with `/skills` — you should see `bhishma` and `arjuna` listed.

---

## Usage

**Step 1 — Run Bhishma with your requirement**

```
/bhishma Add a sticky navigation bar to the Connect portal that highlights the active route
```

Bhishma explores the codebase and returns a detailed approach plan. Read it carefully.

**Step 2 — Approve or revise**

```
Approved — hand off to Arjuna
```

Or give feedback and Bhishma will revise the plan and wait for approval again.

**Step 3 — Run Arjuna with the hand-off note**

Copy the "Hand-off note for Arjuna" section from the approved plan and pass it to Arjuna:

```
/arjuna [paste hand-off note here]
```

**Step 4 — Review the final report**

Arjuna delivers a report with every file changed, every bug found and fixed, and a list of anything that needs your decision.

---

## Repo structure

```
.claude/
└── skills/
    ├── bhishma/
    │   └── SKILL.md    ← Research and planning skill
    └── arjuna/
        └── SKILL.md    ← Orchestration and implementation skill
```

---

## Contributing

Pull requests welcome. If you improve the skill logic — better QA prompts, smarter dev track splitting, tighter architecture constraint checking — open a PR.

---

## Licence

MIT

<div align="center">Made with Claude Code</div>
