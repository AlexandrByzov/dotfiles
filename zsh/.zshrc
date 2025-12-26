# --- VIM MODE ---
bindkey -v

# --- ENVIRONMENT VARIABLES ---
export GITHUB_USER=alexandrbyzov
export GITHUB_TOKEN=$(security find-generic-password -s "github-mini-homelab-token" -w)

# --- COMPLETION ---
autoload -Uz compinit && compinit
. <(flux completion zsh)

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
