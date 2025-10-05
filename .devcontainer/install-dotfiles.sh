#!/bin/bash
# Install dotfiles in codespace
# This script is automatically run when the codespace is created

set -e

echo "🚀 Installing dotfiles..."

DOTFILES_DIR="$HOME/.dotfiles"

# Check if dotfiles are already installed
if [ -d "$DOTFILES_DIR" ]; then
    echo "✓ Dotfiles already exist, updating..."
    cd "$DOTFILES_DIR"
    git pull origin main 2>/dev/null || echo "→ Could not update, using existing dotfiles"
else
    echo "→ Cloning dotfiles repository using gh CLI..."
    # Use gh CLI which has automatic authentication in Codespaces
    if command -v gh &> /dev/null; then
        if gh repo clone srini-achanta0519/dotfiles "$DOTFILES_DIR" 2>/dev/null; then
            echo "✓ Dotfiles cloned successfully"
        else
            echo "⚠️  Could not clone dotfiles repository"
            echo "   This is normal if running outside of Codespaces or if not authenticated"
            echo "   You can manually install dotfiles later with:"
            echo "   gh repo clone srini-achanta0519/dotfiles ~/.dotfiles && ~/.dotfiles/install.sh"
            exit 0
        fi
    else
        echo "⚠️  GitHub CLI not found"
        echo "   Install it and run: gh repo clone srini-achanta0519/dotfiles ~/.dotfiles"
        exit 0
    fi
fi

cd "$DOTFILES_DIR"

# Backup existing files
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
echo "→ Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

files=(".zshrc" ".gitconfig" ".gitignore_global")

for file in "${files[@]}"; do
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo "→ Backing up existing $file"
        cp "$HOME/$file" "$BACKUP_DIR/"
    fi
done

# Create symlinks
echo "→ Creating symlinks..."
for file in "${files[@]}"; do
    if [ -f "$DOTFILES_DIR/$file" ]; then
        echo "  ✓ Linking $file"
        ln -sf "$DOTFILES_DIR/$file" "$HOME/$file"
    fi
done

# Configure git to use global gitignore
if [ -f "$HOME/.gitignore_global" ]; then
    git config --global core.excludesfile ~/.gitignore_global
    echo "✓ Global gitignore configured"
fi

# Source zshrc if running in zsh
if [ -n "$ZSH_VERSION" ]; then
    source "$HOME/.zshrc" 2>/dev/null || true
fi

echo ""
echo "✨ Dotfiles installed successfully!"
echo ""
echo "📝 Don't forget to set your Git user info:"
echo "   git config --global user.name \"Your Name\""
echo "   git config --global user.email \"your.email@example.com\""
echo ""
