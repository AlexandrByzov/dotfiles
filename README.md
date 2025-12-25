# How to use this setup?

To sync installed apps in `brew`, you need to use:

```bash
brew bundle --file ~/dotfiles/Brewfile
```

To generate a bundle of brew to Brewfile, use the following command:

```bash
brew bundle dump --file ~/dotfiles/Brewfile --force
```

The `dotfiles` directory becomes a source of truth for different tools. Then with `stow` you can sync symlinks. For example, `stow zsh` will create symlinks in `$HOME`that allows to easily set up new instruments.

# How to use multiple Github accounts?

If you have several git accounts, you can add several hosts.

Example of ~/.ssh/config that allows for using multiple git accounts. When you do git clone, you use `git clone git@Host-of-ssh-config`. 

```
Host github.com
    HostName github.com
    User git
    IdentityFile path-to-identity-file
    IdentitiesOnly yes
    AddKeysToAgent yes
    UseKeychain yes
```

- `IdentitiesOnly yes`: Prevents SSH from trying all keys (security & performance)
- `AddKeysToAgent yes`: Caches passphrase in SSH agent
- `UseKeychain yes`: (macOS) Stores passphrase in system keychain

# Additional instructions

For a smoother experience, enable key repeat by running this command in a terminal:

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```