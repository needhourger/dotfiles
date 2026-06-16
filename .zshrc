# 1. 环境变量与系统路径（确保系统命令能被找到）
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:$PATH"

# 2. 补全系统初始化（解决 compdef not found）
autoload -Uz compinit && compinit

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## P10k Config
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

## Alias
alias vim="nvim"
alias ls="ls --color=auto"
alias ll="ls -lahF --color --time-style=long-iso"
alias gitc='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias fastfetch='fastfetch | lolcat'
alias ssh='kitty +kitten ssh'
alias kiff='kitty +kitten diff'

## Sheldon plugins
eval "$(sheldon source)"

## fnm node environment management
eval "$(fnm env --use-on-cd --shell zsh)"
