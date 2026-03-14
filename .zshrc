# ─── Performance: skip global compinit (macOS re-runs it needlessly) ───────────
skip_global_compinit=1

# ─── Completion system ──────────────────────────────────────────────────────────
autoload -Uz compinit && compinit

export PNPM_HOME="/Users/goutham/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="/opt/homebrew/bin:$PATH"

alias cd=z
alias cdi=zi

eval "$(zoxide init zsh)"

eval "$(atuin init zsh)"
# Colors
autoload -U colors && colors

# Git branch in prompt
_git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
    echo " %F{243}($branch)%f"
}

# Git dirty state
_git_dirty() {
    [[ -n $(git status --porcelain 2>/dev/null) ]] && echo " %F{yellow}✗%f"
}

# Prompt
setopt PROMPT_SUBST
# PROMPT='%F{cyan}%~%f$(_git_branch)$(_git_dirty) %F{green}❯%f '
PROMPT='%F{cyan}%1~%f$(_git_branch)$(_git_dirty) %(?.%F{green}.%F{red})❯%f '
