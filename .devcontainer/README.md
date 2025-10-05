# Dev Container Configuration

This dev container is configured with comprehensive Azure development tools and automatic dotfiles installation.

## 🚀 Features

### Development Tools
- **Azure Tools**: Azure CLI, Azure Developer CLI (azd), Bicep
- **Container Tools**: Docker, Kubernetes (kubectl, Helm, Minikube)
- **Infrastructure as Code**: Terraform with TFLint
- **Programming Languages**: Python, Node.js, .NET
- **Version Control**: Git, GitHub CLI
- **Shell**: Zsh (default)

### VS Code Extensions
- Azure development extensions
- GitHub Copilot & Copilot Chat
- Terraform & Bicep support
- Docker & Kubernetes tools
- Python & Jupyter support
- And many more productivity extensions

## 🎨 Dotfiles Integration

This dev container automatically installs your personal dotfiles from [github.com/srini-achanta0519/dotfiles](https://github.com/srini-achanta0519/dotfiles) when the codespace is created.

### What Gets Installed
- **`.zshrc`**: Custom zsh configuration with 50+ aliases
- **`.gitconfig`**: Git configuration with helpful aliases
- **`.gitignore_global`**: Global gitignore patterns

### Manual Installation
If you need to reinstall or update your dotfiles:

```bash
.devcontainer/install-dotfiles.sh
```

### Customization
To modify dotfiles:
1. Edit files in your [dotfiles repository](https://github.com/srini-achanta0519/dotfiles)
2. Commit and push changes
3. Run the installation script or rebuild the codespace

## 🔧 Configuration

### Environment Variables
The following environment variables are configured:
- `TF_TOKEN_app_terraform_io`: Terraform Cloud token (from local environment)
- `CONTEXT7_API_KEY`: Context7 API key (from local environment)
- `SHELL`: Set to `/usr/bin/zsh`

### Post-Create Commands
The following actions are performed automatically:
1. Configure Terraform Cloud credentials (if token is provided)
2. Install and configure dotfiles

### Resource Requirements
- **CPUs**: 4 cores
- **Memory**: 16 GB
- **Storage**: 32 GB

## 📝 First-Time Setup

After creating a new codespace:

1. **Set Git user information** (if not already in dotfiles):
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

2. **Verify tools are installed**:
   ```bash
   az --version
   terraform --version
   kubectl version --client
   docker --version
   ```

3. **Test your aliases**:
   ```bash
   gs          # git status
   tf          # terraform
   k           # kubectl
   ```

## 🔄 Updates

### Updating the Dev Container
To apply changes to the dev container configuration:
1. Edit `.devcontainer/devcontainer.json`
2. Rebuild the container: **Command Palette** → **Codespaces: Rebuild Container**

### Updating Dotfiles
Dotfiles are automatically pulled when the container is created. To update manually:
```bash
cd ~/.dotfiles
git pull origin main
source ~/.zshrc
```

## 📚 Additional Resources

- [Dev Container Documentation](https://containers.dev/)
- [GitHub Codespaces Documentation](https://docs.github.com/en/codespaces)
- [Your Dotfiles Repository](https://github.com/srini-achanta0519/dotfiles)

## 🐛 Troubleshooting

### Dotfiles Not Applied
If dotfiles aren't loading:
```bash
# Check if dotfiles are installed
ls -la ~/.dotfiles

# Reinstall manually
.devcontainer/install-dotfiles.sh

# Reload shell
source ~/.zshrc
```

### Shell Not Zsh
If the terminal defaults to bash:
```bash
# Check default shell
echo $SHELL

# Switch to zsh
chsh -s $(which zsh)
```

### Git Configuration Issues
```bash
# Verify git config
git config --global --list

# Reset git config
rm ~/.gitconfig
.devcontainer/install-dotfiles.sh
```

---

**Last Updated**: October 2025
