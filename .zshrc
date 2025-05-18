# -----------------------------
# 🧠 Basic settings
# -----------------------------
export ZSH_DISABLE_COMPFIX=true
export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"
setopt autocd              # cd by just typing folder name
setopt correct             # auto correct command spelling
setopt extended_glob       # advanced globbing
setopt hist_ignore_dups    # don't store duplicate history
setopt share_history       # share history across sessions

# -----------------------------
# 🎨 Prompt and colors
# -----------------------------
autoload -Uz colors && colors
PROMPT='%F{blue}%n@%m%f %F{green}%~%f %# '

# -----------------------------
# 🚀 Zinit plugin manager (https://github.com/zdharma-continuum/zinit)
# -----------------------------
if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
  mkdir -p ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

source ~/.zinit/bin/zinit.zsh

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light agkozak/zsh-z              # jump around folders with z

# -----------------------------
# 📦 Aliases
# -----------------------------
alias ls='ls --color=auto -F'
alias ll='ls -lah'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'

# -----------------------------
# 🔁 Load completions and theme
# -----------------------------
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit
prompt pure 2>/dev/null || true  # fallback if 'pure' prompt isn't installed

# -----------------------------
# 💾 Save history
# -----------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

