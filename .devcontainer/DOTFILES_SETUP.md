# Dotfiles Setup for Codespaces

There are **two ways** to use your dotfiles in GitHub Codespaces:

## 🌟 Option 1: GitHub Codespaces Dotfiles (Recommended)

GitHub Codespaces has a built-in dotfiles feature that automatically installs your dotfiles in every codespace you create.

### Setup Steps:

1. **Go to GitHub Settings**:
   - Navigate to: https://github.com/settings/codespaces

2. **Enable Dotfiles**:
   - Check "✓ Automatically install dotfiles"
   - Select your repository: `srini-achanta0519/dotfiles`
   - (Optional) Specify install command: `./install.sh`

3. **Done!** 🎉
   - Your dotfiles will automatically be cloned and installed in every new codespace
   - Location: `~/dotfiles` (note: no dot prefix when using GitHub's feature)

### How It Works:
- GitHub automatically clones your dotfiles repo when creating a codespace
- If you have an `install.sh`, `install`, `bootstrap.sh`, or `bootstrap` script, it runs automatically
- Works across all your codespaces, not just this repository

### Benefits:
- ✅ Works automatically for all codespaces
- ✅ No repository-specific configuration needed
- ✅ GitHub handles authentication automatically
- ✅ Updates are easy (rebuild codespace)

---

## 🔧 Option 2: Dev Container Script (Current Setup)

This repository is configured to automatically install dotfiles using the included script.

### How It Works:
- The `.devcontainer/install-dotfiles.sh` script runs when the container is created
- Uses GitHub CLI (`gh`) for authentication
- Clones to `~/.dotfiles`
- Creates symlinks for `.zshrc`, `.gitconfig`, and `.gitignore_global`

### Manual Installation:
If the automatic installation doesn't work, run:
```bash
.devcontainer/install-dotfiles.sh
```

### Benefits:
- ✅ Works in any dev container environment
- ✅ Repository-specific customization
- ✅ Can be tested locally

---

## 🔄 Updating Dotfiles

### If using GitHub Codespaces Dotfiles:
1. Edit your dotfiles repository
2. Commit and push changes
3. Rebuild your codespace: **Command Palette** → **Codespaces: Rebuild Container**

### If using Dev Container Script:
```bash
cd ~/.dotfiles
git pull origin main
source ~/.zshrc
```

Or rebuild the container to run the installation script again.

---

## 🛠️ Troubleshooting

### Dotfiles not showing up in Codespaces

**Check your GitHub settings**:
```bash
# In your codespace, check if dotfiles were cloned
ls -la ~/dotfiles/
ls -la ~/.dotfiles/
```

**Verify GitHub settings**:
- Go to https://github.com/settings/codespaces
- Ensure "Automatically install dotfiles" is checked
- Verify the correct repository is selected

### Permission Issues with Private Repository

The repository is private, so authentication is required:

**Using GitHub Codespaces** (recommended):
- Authentication is automatic in Codespaces
- No additional setup needed

**Outside Codespaces**:
```bash
# Authenticate with GitHub CLI
gh auth login

# Then clone manually
gh repo clone srini-achanta0519/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

### Script Fails to Run

```bash
# Make sure script is executable
chmod +x ~/.dotfiles/install.sh
chmod +x .devcontainer/install-dotfiles.sh

# Run manually
.devcontainer/install-dotfiles.sh
```

### Changes Not Reflecting

```bash
# Reload your shell configuration
source ~/.zshrc

# Or restart your terminal
```

---

## 📚 More Information

- [GitHub Codespaces Dotfiles Documentation](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account#dotfiles)
- [Dev Containers Documentation](https://containers.dev/)
- [Your Dotfiles Repository](https://github.com/srini-achanta0519/dotfiles)

---

## 🎯 Recommendation

For the best experience, **use Option 1 (GitHub Codespaces Dotfiles)**:
1. It works across all your codespaces
2. No per-repository configuration needed
3. Automatic authentication
4. Maintained by GitHub

The dev container script (Option 2) is kept as a backup and works in non-Codespaces environments.
