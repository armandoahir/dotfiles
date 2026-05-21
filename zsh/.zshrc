# Source manjaro-zsh-configuration (solo config, non prompt)
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Prompt personalizzato
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PS1="%B%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[cyan]%}%m %{$fg[magenta]%}%~%{$fg[white]%}\${vcs_info_msg_0_} %{$reset_color%}%#%b "

# Alias
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias mkdir="mkdir -pv"
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lah --color=auto --group-directories-first"
alias la="ls -A --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Completamento
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
