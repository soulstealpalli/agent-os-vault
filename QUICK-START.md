# Quick Start: Memory-Optimized Vault

## 🎯 The Goal

**Give agents persistent memory across sessions** so they:
- Don't repeat research
- Build on past work
- Learn from experience
- Share context seamlessly

---

## 📚 How It Works

### Traditional Agent (No Memory):
```
User: "Research AI trends"
Agent: *researches* → responds → *forgets everything*

User: "Research AI trends" (next day)
Agent: *researches same thing again* 😫
```

### Memory-Optimized Agent (With Vault):
```
User: "Research AI trends"
Alex: *researches* → saves to vault → responds

User: "Research AI trends" (next day)
Alex: *reads vault* → "I already researched this on 2026-03-04. 
       Here's the note: [[ai-trends]]. Want me to update it?"
```

---

## 🔄 The Workflow

### 1. Alex Researches
```
User → Alex: "Research blockchain trends"
Alex:
  1. Checks agents/alex-research/index.md
  2. Searches for existing "blockchain" notes
  3. Finds nothing → researches fresh
  4. Creates agents/alex-research/topics/blockchain-2026.md
  5. Updates index.md
  6. Runs sync.sh → pushes to GitHub
```

### 2. Maya Writes
```
User → Maya: "Write blog about blockchain"
Maya:
  1. Reads agents/alex-research/index.md
  2. Finds [[blockchain-2026]] link
  3. Reads Alex's research note
  4. Writes blog referencing [[blockchain-2026]]
  5. Saves to agents/maya-content/published/blockchain-blog.md
  6. Updates index.md
  7. Runs sync.sh
```

### 3. Sam Promotes
```
User → Sam: "Create social posts for blockchain blog"
Sam:
  1. Reads agents/maya-content/index.md
  2. Finds [[blockchain-blog]] link
  3. Reads Maya's blog
  4. Checks agents/sam-social/winners.md for patterns
  5. Creates platform-specific posts
  6. Saves with performance tracking
  7. Runs sync.sh
```

---

## 📖 Key Documents

| File | Purpose |
|------|---------|
| **MEMORY-STRATEGY.md** | Full memory optimization guide |
| **agents/{name}/index.md** | Each agent's work index |
| **shared/context-index.md** | Quick system reference |
| **memory/context.md** | Current system state |
| **SYNC-GUIDE.md** | Git sync instructions |

---

## 🧠 Memory Rules

### ✅ Always Write to Vault:
- Research findings (Alex)
- Content drafts (Maya)
- Strategy plans (Jordan)
- Code solutions (Dev)
- Social performance (Sam)
- Important decisions
- Learnings from mistakes

### ❌ Never Write:
- Casual chat
- Temporary scratch work
- Redundant information

### 🔗 Always Link:
- `[[related-notes]]` via wikilinks
- Previous work from same agent
- Work from other agents used as source

---

## 🚀 Getting Started

### For You (Desktop):
1. Clone: `git clone https://github.com/soulstealpalli/agent-os-vault.git`
2. Open in Obsidian
3. Install "Obsidian Git" plugin (auto-sync)
4. Done! Changes from agents appear automatically

### For Agents (VPS):
Already configured! Agents:
1. Read their index.md at session start
2. Check for existing work before duplicating
3. Save new work with proper metadata
4. Run `/data/obsidian-vault/sync.sh` after writing

---

## 💡 Example: Full Memory Cycle

**Day 1 - Research:**
```
You: "Alex, research top 5 AI coding tools"
Alex: Creates agents/alex-research/topics/ai-coding-tools.md
      Includes 5+ sources, key findings, links
      Updates index.md
Result: Knowledge captured ✅
```

**Day 2 - Content:**
```
You: "Maya, write blog about AI coding tools"
Maya: Reads [[ai-coding-tools]] from Alex
      Writes blog using that research
      Saves to agents/maya-content/published/
Result: No repeated research ✅
```

**Day 3 - Distribution:**
```
You: "Sam, promote the AI tools blog"
Sam: Reads [[ai-tools-blog]] from Maya
     Creates platform-specific posts
     Saves with tracking data
Result: Consistent messaging ✅
```

**Day 30 - Learning:**
```
You: "Sam, what types of posts perform best?"
Sam: Reads agents/sam-social/winners.md
     "Posts with code examples get 3x engagement"
     "Best time: Weekdays 9-11 AM"
Result: Pattern recognition ✅
```

---

## 📊 Success Metrics

After 1 week, you should see:

✅ Agents citing old work instead of repeating  
✅ Faster task completion (reading > researching)  
✅ Knowledge graph forming (linked notes)  
✅ Learning accumulation (patterns documented)  
✅ Cross-agent workflows (Alex → Maya → Sam)  

---

## 🔧 Troubleshooting

**Agent not reading vault?**
- Check they have MEMORY-INSTRUCTIONS.md in workspace
- Verify vault path: `/data/obsidian-vault`

**Notes not syncing?**
- Agent should run `/data/obsidian-vault/sync.sh` after writing
- Check git status: `cd /data/obsidian-vault && git status`

**Can't find old notes?**
- Search: `grep -ri "keyword" /data/obsidian-vault/`
- Check index: `cat /data/obsidian-vault/agents/{name}/index.md`

---

## 🎯 Next Steps

1. **Test it**: Ask Alex to research something, then ask Maya to use it
2. **Build habits**: Agents check vault before starting fresh work
3. **Review weekly**: Read memory/learnings.md to see patterns
4. **Iterate**: Update MEMORY-STRATEGY.md as you discover what works

---

**The vault is now your agents' long-term memory. Use it well! 🧠**
