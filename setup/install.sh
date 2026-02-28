#!/bin/bash
set -e

echo "Installing Nix..."
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)

echo ""
echo "Nix installed. Please restart your shell, then run:"
echo "  ./setup/bootstrap.sh"
