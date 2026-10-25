#!/usr/bin/env bash
# Creates github.com/<you>/evidence-chain, pushes the site and turns on GitHub Pages.
set -euo pipefail
REPO="evidence-chain"
OWNER="$(gh api user --jq .login)"
gh repo create "$REPO" --public --description "Evidence Chain Special Edition: Merz, BlackRock and the vaccine money, every claim graded A-E" --source=. --remote=origin --push
gh api -X POST "repos/$OWNER/$REPO/pages" -f "source[branch]=main" -f "source[path]=/" >/dev/null
gh repo edit "$OWNER/$REPO" --homepage "https://$OWNER.github.io/$REPO/"
echo "Building... live in 1-2 minutes at: https://$OWNER.github.io/$REPO/"
