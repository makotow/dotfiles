# Dotfiles - XDG Base Directory Compliant

This repository contains configuration files for various development tools, organized according to the [XDG Base Directory specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).

## 📁 Structure

```
dotfiles/
├── bootstrap/
│   └── .zshenv          # Bootstrap file for zsh (sets ZDOTDIR)
├── git/
│   ├── config           # Git configuration
│   └── ignore           # Global gitignore
├── tmux/
│   └── tmux.conf        # Tmux configuration
├── tig/
│   └── config           # Tig configuration
├── zsh/
│   ├── .zshrc           # Main zsh configuration
│   ├── .zprofile        # Zsh profile
│   ├── .p10k.zsh        # Powerlevel10k theme
│   └── *.zsh            # Modular zsh configurations
└── link.sh              # Setup script
```

## 🚀 Installation

### Quick Start

```bash
# Clone this repository
git clone https://github.com/yourusername/dotfiles.git ~/.config/dotfiles

# Run the setup script
cd ~/.config/dotfiles
./link.sh
```

### What the setup script does

The `link.sh` script creates symbolic links following XDG Base Directory standards:

- `~/.config/git/` → Git configuration
- `~/.config/tmux/` → Tmux configuration
- `~/.config/tig/` → Tig configuration
- `~/.config/zsh/` → Zsh configuration files
- `~/.zshenv` → Bootstrap file (only file in home directory)

### Manual Installation

If you prefer manual setup:

```bash
# Create symbolic links
ln -s ~/.config/dotfiles/git ~/.config/git
ln -s ~/.config/dotfiles/tmux ~/.config/tmux
ln -s ~/.config/dotfiles/tig ~/.config/tig
ln -s ~/.config/dotfiles/zsh ~/.config/zsh
ln -s ~/.config/dotfiles/bootstrap/.zshenv ~/.zshenv
```

## 📝 Configuration Details

### Git

Configuration files are located in `~/.config/git/`:
- `config` - Main Git configuration
- `ignore` - Global gitignore patterns

### Zsh

Zsh uses the `ZDOTDIR` environment variable to specify the configuration directory:
- `~/.zshenv` - Minimal bootstrap file that sets `ZDOTDIR=$HOME/.config/zsh`
- `~/.config/zsh/.zshrc` - Main zsh configuration
- `~/.config/zsh/.zprofile` - Profile settings
- Other modular configuration files in `~/.config/zsh/`

### Tmux

Configuration is located at `~/.config/tmux/tmux.conf`

### Tig

Configuration is located at `~/.config/tig/config`

## 🔄 Updating

```bash
cd ~/.config/dotfiles
git pull
```

No need to re-run `link.sh` unless the structure changes.

## ✨ Benefits of XDG Compliance

- **Clean home directory**: Only `~/.zshenv` is required in home directory
- **Standard locations**: Follows freedesktop.org standards
- **Easy backup**: All configs are in `~/.config/`
- **Better organization**: Clear separation of different tool configurations

## 🛠️ Customization

To add your local, machine-specific configurations:
- Create `~/.config/zsh/local.zsh` for zsh-specific settings
- Modify files directly in this repository and commit changes

## 📚 References

- [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
- [Git XDG Support](https://git-scm.com/docs/git-config#FILES)
- [Zsh Startup Files](https://zsh.sourceforge.io/Intro/intro_3.html)

## 📄 License

MIT
