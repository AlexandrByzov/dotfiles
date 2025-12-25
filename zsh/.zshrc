# --- VIM MODE ---
bindkey -v

# --- COMPLETION ---
autoload -Uz compinit && compinit

# --- TOOLS ---
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh