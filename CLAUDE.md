# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository for macOS and Arch Linux systems, containing configuration files for development environments. The repository follows a structured approach using GNU Stow for symlink management.

## Repository Structure

The repository contains modular configuration directories, each representing a specific application or tool:

- **Core Development Tools:**
  - `nvim-kickstart/` - Neovim configuration based on kickstart.nvim
  - `vim/` - Legacy Vim configuration
  - `tmux/` - Terminal multiplexer with custom scripts and keybindings
  - `zsh/` - Shell configuration with Oh My Zsh, Powerlevel10k theme, and plugins

- **macOS Window Management:**
  - `yabai/` - Tiling window manager for macOS (BSP layout)
  - `skhd/` - Hotkey daemon for macOS
  - `aerospace/` - Alternative window manager configuration
  - `rectangle/` - Window management utility configuration

- **Linux Window Management:**
  - `i3/` - i3 window manager configuration
  - `polybar/` - Status bar configuration
  - `rofi/` - Application launcher configuration

- **Terminal & Graphics:**
  - `alacritty/` - Cross-platform terminal emulator
  - `picom/` - X11 compositor
  - `ranger/` - Console file manager
  - `redshift/` - Blue light filter

- **System Configuration:**
  - `fonts/` - System fonts (stow to `/usr/share/fonts`)
  - `fonts-config/` - Font configuration with `.Xresources`
  - `intel-graphics/` - Intel graphics driver configuration for Arch

## Installation and Management Commands

### Using GNU Stow

All configurations are managed using GNU Stow. The repository should be located in the home directory (`~/dotfiles` or similar).

```bash
# Install configuration for home directory
stow nvim-kickstart
stow tmux
stow zsh
stow yabai
stow skhd

# Install system-wide configurations (requires root)
sudo stow --target=/ fonts
sudo stow --target=/ intel-graphics
```

### Key Development Environment Setup

```bash
# Essential tools for this setup
brew install neovim tmux zsh stow yabai skhd  # macOS
pacman -S neovim tmux zsh stow i3-wm        # Arch Linux

# Shell setup
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Branch Strategy

- `vanilla-arch` - Main branch for Arch Linux configurations
- `osx` - Current branch with macOS-specific configurations

## Key Configuration Features

### Tmux Setup
- Custom prefix key (Ctrl+b maintained)
- Vim-style pane navigation (h/j/k/l)
- Window switching with Alt+h/l
- Custom scripts in `.scripts/` for project-specific tmux sessions
- Scripts follow pattern: `<project>-tmux` (e.g., `dotfiles-tmux`, `studio-tmux`)

### Zsh Configuration
- Powerlevel10k theme with instant prompt
- Key plugins: git, zsh-completions, zsh-syntax-highlighting, zsh-autosuggestions
- Environment setup for Go, Python, Node.js (via nvm), and various development tools
- Custom aliases for common operations
- Performance monitoring functions (`timezsh`, `timePlugins`)

### Neovim Setup
- Kickstart.nvim-based configuration with Lua
- LSP support via mason.nvim
- Telescope for fuzzy finding
- Treesitter for syntax highlighting

### Window Management (macOS)
- Yabai configured for BSP (Binary Space Partitioning) layout
- No padding/gaps for maximized screen usage
- Mouse follows focus disabled
- Specific app exclusions (System Settings, Calculator, etc.)

### Window Management (Linux)
- i3wm tiling window manager
- Polybar status bar
- Rofi application launcher

## Important Files and Patterns

### Configuration Entry Points
- `zsh/.zshrc` - Main shell configuration
- `tmux/.tmux.conf` - Terminal multiplexer settings
- `yabai/.config/yabai/yabairc` - macOS window manager
- `nvim-kickstart/.config/nvim/init.lua` - Neovim configuration

### Script Utilities
- `tmux/.scripts/neww` - Create new tmux window with custom name/command
- Various project-specific tmux session scripts in `tmux/.scripts/`

### Environment Setup
- Go development: `GO_PATH`, `GOOS=darwin`, personal workspace in `~/go/src/github.com/snehalyelmati`
- Python: Python 3.9 in PATH, UV completion enabled
- Node.js: NVM with lazy loading enabled
- Editor: Neovim set as default (`EDITOR='nvim'`)
- Terminal: 256-color support configured

## Cross-Platform Considerations

This repository supports both macOS and Arch Linux:
- Use appropriate stow commands based on the target system
- macOS-specific: yabai, skhd, aerospace, rectangle
- Linux-specific: i3, polybar, rofi, picom, redshift
- Shared: neovim, tmux, zsh, alacritty, ranger

## Notes

- The `images/` directory contains screenshots and should not be stowed
- Font files in `fonts/` require system-wide installation
- Intel graphics configuration in `intel-graphics/` is Arch Linux specific
- All tmux scripts are executable and follow consistent naming patterns