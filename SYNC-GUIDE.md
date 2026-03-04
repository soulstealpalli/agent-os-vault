# Vault Sync Guide

## GitHub Repository
https://github.com/soulstealpalli/agent-os-vault

## For Agents (VPS Side)

### After Creating/Editing Notes
Run the sync script:
```bash
/data/obsidian-vault/sync.sh
```

This will:
- Commit all changes
- Push to GitHub
- Auto-generate commit message with timestamp

### Manual Git Commands
```bash
cd /data/obsidian-vault

# See what changed
git status

# Commit specific file
git add agents/alex-research/my-note.md
git commit -m "Added research on topic X"
git push

# Pull latest from desktop
git pull
```

## For You (Desktop Side)

### Get Latest Changes
```bash
cd ~/Documents/agent-os-vault  # or wherever you cloned it
git pull
```

Obsidian will auto-reload files!

### Push Your Changes
```bash
cd ~/Documents/agent-os-vault
git add .
git commit -m "Updated notes from desktop"
git push
```

### Use Obsidian Git Plugin (Recommended!)
1. Install "Obsidian Git" community plugin
2. Set auto-commit interval (e.g., every 10 minutes)
3. Never think about git again!

## Workflow Example

**Agent creates note:**
1. Agent writes to `/data/obsidian-vault/agents/alex-research/ai-trends.md`
2. Agent runs `/data/obsidian-vault/sync.sh`
3. Changes pushed to GitHub

**You see it on desktop:**
1. Run `git pull` (or Obsidian Git does it automatically)
2. Note appears in Obsidian
3. Read, edit, or link to it

**You edit locally:**
1. Make changes in Obsidian
2. Commit + push (or Obsidian Git does it)
3. Agents pull before writing (to avoid conflicts)

## Conflict Resolution

If both sides edit the same file:
```bash
git pull  # will show conflict
# Edit file to resolve <<<< ==== >>>> markers
git add .
git commit -m "Resolved conflict"
git push
```

Or just keep edits separate:
- Agents write new notes
- You organize/edit existing ones

---

**Pro Tip:** Keep a terminal window open on desktop with:
```bash
watch -n 30 'cd ~/Documents/agent-os-vault && git pull --quiet'
```
Auto-pulls every 30 seconds!
