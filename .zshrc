# 1. 环境变量与系统路径（确保系统命令能被找到）
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:$PATH"

# Zsh history Config
# 指定历史记录保存的文件路径
HISTFILE="$HOME/.zsh_history"

# 内存中保存的历史记录条数
HISTSIZE=10000

# 硬盘历史文件中保存的历史记录条数
SAVEHIST=10000

# ----- 历史记录的高级优化选项（推荐） -----
setopt append_history       # 多个终端会话以追加的方式写入同一个历史文件
setopt share_history        # 在不同的终端窗口之间实时共享命令历史记录
setopt inc_append_history   # 执行命令后立即写入文件，而不是等待终端退出
setopt hist_ignore_dups     # 如果连续输入相同的命令，不重复记录
setopt hist_ignore_space    # 如果命令以空格开头，不记录（用于隐藏敏感密码等）

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
export FNM_NODE_DIST_MIRROR=https://mirrors.cernet.edu.cn/nodejs-release/
eval "$(fnm env --use-on-cd --shell zsh)"

# pnpm
export PNPM_HOME="/home/yuuki/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end
