#!/bin/bash
set -e

REPO="https://github.com/harshavardhan03/bhishma-arjuna"

echo "Bhishma & Arjuna — Claude Code Skills Installer"
echo "================================================"
echo ""
echo "Install to:"
echo "  1) Current project ($(pwd)/.claude/skills/)"
echo "  2) Global — all projects (~/.claude/skills/)"
read -rp "Choose [1/2]: " choice

if [ "$choice" = "2" ]; then
  TARGET="$HOME/.claude/skills"
else
  TARGET=".claude/skills"
fi

mkdir -p "$TARGET"

TMP=$(mktemp -d)
git clone --depth 1 "$REPO" "$TMP/repo" 2>/dev/null

cp -r "$TMP/repo/.claude/skills/bhishma" "$TARGET/"
cp -r "$TMP/repo/.claude/skills/arjuna" "$TARGET/"

rm -rf "$TMP"

echo ""
echo "✅ Installed to $TARGET"
echo "Restart Claude Code, then run /skills to confirm they appear."
