#!/bin/bash
set -e

# 1. SSH key setup
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f "$HOME/.ssh/id_ed25519"
fi

echo ""
echo "=== SSH public key ==="
cat "$HOME/.ssh/id_ed25519.pub"
echo "======================"
echo ""

# Copy to clipboard (macOS)
if command -v pbcopy &> /dev/null; then
    cat "$HOME/.ssh/id_ed25519.pub" | pbcopy
    echo "Public key copied to clipboard."
fi

echo "Add this key to GitHub: https://github.com/settings/ssh/new"
echo ""
read -p "Press Enter after adding the key to GitHub..."

# 2. Clone private repo
echo ""
read -p "Private repo URL (e.g. git@github.com:user/dotfiles-host.git): " REPO_URL
git clone "$REPO_URL"

REPO_DIR=$(basename "$REPO_URL" .git)
echo ""
echo "Done! Next steps:"
echo "  cd ~/$REPO_DIR"
echo "  make upgrade-darwin   # for macOS"
echo "  make upgrade-nixos    # for NixOS"
