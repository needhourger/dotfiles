# Zinit init
source /usr/share/zinit/zinit.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt RE_MATCH_PCRE   # _fix-omz-plugin function uses this regex style

# Workaround for zinit issue#504: remove subversion dependency. Function clones all files in plugin
# directory (on github) that might be useful to zinit snippet directory. Should only be invoked
# via zinit atclone"_fix-omz-plugin"
_fix-omz-plugin() {
  if [[ ! -f ._zinit/teleid ]] then return 0; fi
  if [[ ! $(cat ._zinit/teleid) =~ "^OMZP::.*" ]] then return 0; fi
  local OMZP_NAME=$(cat ._zinit/teleid | sed -n 's/OMZP:://p')
  git clone --quiet --no-checkout --depth=1 --filter=tree:0 https://github.com/ohmyzsh/ohmyzsh
  cd ohmyzsh
  git sparse-checkout set --no-cone plugins/$OMZP_NAME
  git checkout --quiet
  cd ..
  local OMZP_PATH="ohmyzsh/plugins/$OMZP_NAME"
  local file
  for file in ohmyzsh/plugins/$OMZP_NAME/*~(.gitignore|*.plugin.zsh)(D); do
    local filename="${file:t}"
    echo "Copying $file to $(pwd)/$filename..."
    cp $file $filename
  done
  rm -rf ohmyzsh
}

####
# oh-my-zsh libs
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::correction.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::grep.zsh
# zinit snippet OMZL::nvm.zsh # 500ms at least
zinit snippet OMZL::history.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::prompt_info_functions.zsh

####
# oh-my-zsh plugins
zinit snippet OMZP::archlinux
zinit snippet OMZP::sudo
zinit snippet OMZP::cp
zinit snippet OMZP::vscode
zinit snippet OMZP::encode64
zinit snippet OMZP::npm
zinit snippet OMZP::node
zinit snippet OMZP::kitty
zinit snippet OMZP::qrcode
zinit snippet OMZP::thefuck
# zinit snippet OMZP::nvm # 500ms at least
zinit snippet OMZP::git
zinit snippet OMZP::git-commit
zinit wait lucid for \
	atpull"%atclone" atclone"_fix-omz-plugin" OMZP::docker \
	atpull"%atclone" atclone"_fix-omz-plugin" OMZP::docker-compose \
	atpull"%atclone" atclone"_fix-omz-plugin" OMZP::extract \
	atpull"%atclone" atclone"_fix-omz-plugin" OMZP::pip \
	atpull"%atclone" atclone"_fix-omz-plugin" OMZP::yarn \
	atpull"%atclone" atclone"_fix-omz-plugin" OMZP::z \
	atpull"%atclone" atclone"_fix-omz-plugin" OMZP::golang \
	atpull"%atclone" atclone"_fix-omz-plugin" OMZP::shell-proxy

# Theme
zinit ice depth="1"
zinit light romkatv/powerlevel10k

# Plugins

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light dracula/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
#zinit light marlonrichert/zsh-autocomplete
zinit light arzzen/calc.plugin.zsh
zinit light aubreypwd/zsh-plugin-download
zinit light oz/safe-paste
zinit light wbingli/zsh-wakatime

# Yi Yan
# zinit ice lucid wait=0
# zinit light derry96/hitokoto


# Completion
autoload -Uz compinit
compinit

# Binding Keys
bindkey '^I' menu-complete


# Alias
alias vim="nvim"
alias ls="ls --color=auto"
alias ll="ls -lahF --color --time-style=long-iso"
alias gitc='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias neofetch='neofetch | lolcat'
alias ssh='kitty +kitten ssh'
alias kiff='kitty +kitten diff'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Nvm node environment
source /usr/share/nvm/init-nvm.sh

# Environment variable
export PATH=$PATH:/home/yuuki/.go/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yuuki/.conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yuuki/.conda/etc/profile.d/conda.sh" ]; then
        . "/home/yuuki/.conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/yuuki/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

## autocomplete settings
zstyle ':autocomplete:*' delay 0.1  # seconds (float)

# bun completions
[ -s "/home/yuuki/.bun/_bun" ] && source "/home/yuuki/.bun/_bun"
