# How to use this setup

To sync installed apps in `brew`, you need to use:

```bash
brew bundle --file ~/dotfiles/Brewfile
```

To generate a bundle of brew to Brewfile, use the following command:

```bash
brew bundle dump --file ~/dotfiles/Brewfile --force
```

The `dotfiles` directory becomes a source of truth for different tools. Then with `stow` you can sync symlinks. For example, `stow zsh` will create symlinks in `$HOME`that allows to easily set up new instruments.

# Additional instructions

For a smoother experience, enable key repeat by running this command in a terminal:

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```