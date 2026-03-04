#!/bin/bash
# Auto-commit and push vault changes

cd /data/obsidian-vault

# Check if there are changes
if [[ -n $(git status -s) ]]; then
    git add .
    git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "✅ Vault synced to GitHub"
else
    echo "ℹ️ No changes to sync"
fi
