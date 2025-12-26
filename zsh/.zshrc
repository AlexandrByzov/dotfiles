# --- VIM MODE ---
bindkey -v

# --- COMPLETION ---
autoload -Uz compinit && compinit

# --- TOOLS ---
eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/alexandrbyzov/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# --- KUBE CONFIG ---
export SOPS_AGE_KEY=$(security find-generic-password -s "sops-age-key" -w | xxd -r -p)
export KUBECONFIG="${TMPDIR}kubeconfig"
sops -d ~/.kube/config > "$KUBECONFIG"

# --- ALIASES ---
alias k='kubectl'
