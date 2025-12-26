# Dotfiles

Personal macOS development environment configuration and setup automation.

## Overview

This repository contains my dotfiles and configuration files for a reproducible development environment. It uses [GNU Stow](https://www.gnu.org/software/stow/) for symlink management and [Homebrew](https://brew.sh/) for package management.

### What's Included

- **zsh**: Shell configuration and customizations
- **git**: Git configuration and aliases
- **config**: Application-specific configurations
- **kube**: Kubernetes-related configurations, encrypted with sops
- **Brewfile**: Declarative package management for all installed tools

## Quick Start

### Prerequisites

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Installation

```bash
# Clone repo
git clone https://github.com/alexandrbyzov/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install package from Brewfile
brew bundle --file ~/dotfiles/Brewfile
```

### Create symlinks with Stow

```bash
stow zsh git config
```

## Usage

### Managing Homebrew Packages

Install packages from Brewfile:
```bash
brew bundle --file ~/dotfiles/Brewfile
```

Update Brewfile with currently installed packages:
```bash
brew bundle dump --file ~/dotfiles/Brewfile --force
```

### Managing Dotfiles with Stow

The dotfiles directory is the source of truth. Stow creates symlinks from this repo to your `$HOME` directory.

```bash
# Add new dotfiles
stow <directory-name>

# Remove symlinks
stow -D <directory-name>

# Restow (useful after changes)
stow -R <directory-name>
```

## Configuration Guides

### Multiple GitHub Accounts

Configure multiple GitHub accounts by setting up separate SSH hosts in `~/.ssh/config`:

```ssh-config
Host github.com
    HostName github.com
    User git
    IdentityFile path-to-identity-file
    IdentitiesOnly yes
    AddKeysToAgent yes
    UseKeychain yes
```

**Configuration options:**
- `IdentitiesOnly yes` - Prevents SSH from trying all keys (improves security & performance)
- `AddKeysToAgent yes` - Caches passphrase in SSH agent
- `UseKeychain yes` - (macOS) Stores passphrase in system keychain

**Usage:**
```bash
git clone git@github.com:username/repo.git
```

### Storing Secrets in macOS Keychain

For sensitive data like age keys, SSH keys, or API tokens, store them securely in macOS Keychain instead of plain files.

#### Store a Secret

```bash
# Store from file
security add-generic-password -s "secret-name" -a "$USER" -w "$(cat /path/to/secret)"

# Store from clipboard
security add-generic-password -s "secret-name" -a "$USER" -w "$(pbpaste)"

# Add -U flag to sync via iCloud Keychain (optional)
security add-generic-password -s "secret-name" -a "$USER" -w "$(cat /path/to/secret)" -U
```

#### Retrieve a Secret

```bash
# Print to stdout
security find-generic-password -s "secret-name" -w

# Print to stdout multi-line secret (they are usually Hex-encoded)
security find-generic-password -s "secret-name" -w | xxd -r -p

# Write to file
security find-generic-password -s "secret-name" -w > /path/to/secret
```

## macOS Tweaks

### Enable Key Repeat

For a smoother typing experience in editors like VS Code:

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

Restart your applications for the change to take effect.
