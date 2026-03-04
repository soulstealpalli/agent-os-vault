# Memory Optimization Strategy

## Core Principle
**Write to remember. Read to recall. Link to connect.**

---

## 1. What Gets Written to Vault

### ✅ Always Write:
- **Research findings** (Alex) - sources, summaries, key data
- **Content drafts** (Maya) - blogs, outlines, published pieces
- **Strategy plans** (Jordan) - campaigns, timelines, decisions
- **Code notes** (Dev) - architecture decisions, solutions to problems
- **Performance data** (Sam) - what posts worked, engagement patterns
- **Decisions** - any choice that affects future work
- **Learnings** - mistakes, successes, patterns discovered

### ❌ Don't Write:
- Small talk / casual chat
- Temporary scratch work
- Redundant information already captured
- System logs (unless debugging)

---

## 2. Folder Structure (Optimized)

```
vault/
├── agents/
│   ├── alex-research/
│   │   ├── index.md              # Alex's TOC
│   │   ├── sources.md            # Master source list
│   │   └── topics/
│   │       ├── ai-trends.md
│   │       └── productivity-tools.md
│   ├── maya-content/
│   │   ├── index.md
│   │   ├── published/            # Final versions
│   │   ├── drafts/               # WIP
│   │   └── templates/            # Reusable structures
│   ├── jordan-strategy/
│   │   ├── index.md
│   │   ├── campaigns/
│   │   └── post-mortems/         # What worked/failed
│   ├── dev-projects/
│   │   ├── index.md
│   │   ├── architecture/
│   │   └── solutions/            # Solved problems
│   └── sam-social/
│       ├── index.md
│       ├── winners.md            # Top performing posts
│       ├── calendar.md           # Posting schedule
│       └── templates/
├── shared/
│   ├── brand-voice.md
│   ├── target-audience.md
│   ├── product-info.md
│   ├── glossary.md               # Terms we use
│   └── context-index.md          # Quick reference
├── memory/
│   ├── context.md                # Current system state
│   ├── decisions.md              # Why we chose X
│   ├── learnings.md              # What we discovered
│   └── weekly-reviews.md         # Periodic summaries
└── workflows/
    ├── research-to-blog.md       # Alex → Maya
    ├── blog-to-social.md         # Maya → Sam
    └── content-pipeline.md       # Full workflow
```

---

## 3. Mandatory Metadata (Front Matter)

Every note MUST have:

```yaml
---
created: 2026-03-04
updated: 2026-03-04
agent: alex
status: active|archived|draft
tags: [research, ai, trends]
related: [[other-note]], [[another-note]]
---
```

This enables:
- Temporal search (find old research)
- Agent accountability (who wrote what)
- Status tracking (what's current vs outdated)
- Graph connections (related concepts)

---

## 4. Linking Strategy

### Use [[Wikilinks]] to Connect Knowledge

**Example: Alex researches AI tools**
```markdown
# AI Coding Tools 2026

Related: [[ai-trends]], [[developer-tools]]

## Tools
1. **Cursor** - see [[cursor-review]]
2. **GitHub Copilot** - connects to [[github-ecosystem]]

This research informs [[maya-blog-ai-tools]] and [[sam-social-ai-posts]].
```

**Result:** Knowledge graph shows connections between research → content → distribution

---

## 5. Index Files (Navigation Hubs)

Each agent maintains an `index.md`:

```markdown
# Alex's Research Index

## Active Topics
- [[ai-trends]] - Updated 2026-03-04
- [[productivity-tools]] - Updated 2026-03-02

## Sources
See [[sources]] for master list

## Recent Work
1. [[blockchain-2026]]
2. [[remote-work-trends]]

## Waiting For
- Maya needs [[ai-trends]] for blog
- Jordan referenced [[competitor-analysis]]
```

**Agents read their index.md at session start** to know what's already done.

---

## 6. Session Workflow

### Start of Session:
1. Read `memory/context.md` (system state)
2. Read `agents/{name}/index.md` (my work)
3. Scan `shared/` for relevant context

### During Work:
1. Create note with proper front matter
2. Link to related notes
3. Update index.md if significant

### End of Session:
1. Commit changes to vault
2. Run `/data/obsidian-vault/sync.sh`
3. Update `memory/context.md` if needed

---

## 7. Search & Retrieval

### When Agent Needs Context:

**Option A: Direct read**
```bash
# Alex needs past research
read /data/obsidian-vault/agents/alex-research/ai-trends.md
```

**Option B: Search by tag**
```bash
# Find all blockchain research
grep -r "tags: \[.*blockchain.*\]" /data/obsidian-vault/agents/alex-research/
```

**Option C: Full-text search**
```bash
# Find all mentions of "cursor"
grep -ri "cursor" /data/obsidian-vault/
```

---

## 8. Memory Consolidation (Weekly)

Every week, one agent reviews and consolidates:

1. Read `memory/weekly-reviews.md`
2. Scan all agent folders for key learnings
3. Update `memory/learnings.md` with distilled insights
4. Archive outdated notes
5. Update `shared/context-index.md` with new patterns

**Trigger:** Heartbeat cron job every Sunday

---

## 9. Cross-Agent Context Sharing

### Pipeline Pattern:

**Research → Content → Social**

1. **Alex** researches AI tools → saves to `agents/alex-research/ai-tools-2026.md`
2. **Maya** checks Alex's index → reads research → writes blog → saves to `agents/maya-content/published/ai-tools-blog.md`
3. **Sam** reads Maya's blog → creates social posts → saves to `agents/sam-social/posts/2026-03-04-ai-tools.md`

Each note links to the previous: `Based on [[alex-ai-tools-2026]]`

---

## 10. Human Feedback Loop

When you edit notes in Obsidian:

1. **Add comments** in `> [!note]` callouts
2. **Tag corrections** with `#feedback`
3. Agents check for `#feedback` tags before writing
4. Incorporate your guidance into future work

**Example:**
```markdown
> [!note] Human Feedback
> Focus more on enterprise tools, less on hobbyist ones.
> Target audience is CTOs, not individual developers.

#feedback
```

---

## 11. Preventing Context Bloat

### Archive Old Content:
```bash
mkdir -p /data/obsidian-vault/archive/2026-Q1/
mv old-note.md /data/obsidian-vault/archive/2026-Q1/
```

### Update Not Duplicate:
- Before creating `ai-trends-2026.md`, check if it exists
- If exists, append or update rather than create new

### Use Templates:
- Store templates in each agent's folder
- Reuse structure, update content

---

## 12. Integration with Agent Instructions

Update each agent's SOUL.md or instructions to:

**At session start:**
```
1. Read memory/context.md
2. Read agents/{my-name}/index.md
3. Check for related notes via tags/links
```

**During work:**
```
If creating lasting value (research/content/strategy):
  - Write to vault with proper metadata
  - Link to related notes
  - Update index.md
  - Run sync.sh
```

**Before responding:**
```
Check if answer is already in vault:
  - Search agents/{my-name}/ first
  - Then shared/ for general context
  - Reference existing notes instead of repeating
```

---

## 13. Metrics & Optimization

Track in `memory/stats.md`:

- Notes created per agent
- Cross-references made
- Reuse frequency (how often old notes referenced)
- Human edits (feedback incorporation)

Review monthly to optimize structure.

---

## Example: Full Memory Cycle

**Monday:**
User: "Research AI coding tools"
Alex: 
  1. Checks `agents/alex-research/index.md` - no existing note
  2. Researches online
  3. Creates `agents/alex-research/topics/ai-coding-tools.md` with metadata
  4. Updates `agents/alex-research/index.md` 
  5. Runs `sync.sh`

**Tuesday:**
User: "Write blog about AI coding tools"
Maya:
  1. Reads `agents/alex-research/index.md`
  2. Finds `[[ai-coding-tools]]` link
  3. Reads Alex's research
  4. Writes blog referencing `[[ai-coding-tools]]`
  5. Saves to `agents/maya-content/published/ai-coding-tools-blog.md`
  6. Runs `sync.sh`

**Wednesday:**
User: "Create social posts"
Sam:
  1. Reads `agents/maya-content/index.md`
  2. Finds `[[ai-coding-tools-blog]]`
  3. Creates posts based on blog
  4. Checks `agents/sam-social/winners.md` for patterns
  5. Saves posts
  6. Runs `sync.sh`

**Result:** Context preserved, no repeated research, knowledge graph built.

---

## Success Metrics

✅ Agents reference old notes instead of repeating research  
✅ Cross-agent workflows cite source material  
✅ You can trace decision history via links  
✅ Knowledge graph shows connected concepts  
✅ Weekly reviews show accumulated learnings  
✅ Human feedback integrated into future work  

---

*This is a living document. Update as patterns emerge.*
