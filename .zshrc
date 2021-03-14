echo -e "$(cat $HOME/stuff/dragon_parsed.txt)"; PF_INFO="title os kernel uptime pkgs memory wm" pfetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath=(/usr/share/zsh/site-functions $fpath)
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
autoload -U colors
colors

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh-history

alias ls="ls --color=auto" sl="ls --color=auto"
alias vi="nvim" vim="nvim"
export EDITOR="nvim" VISUAL="nvim" FILE="nnn" BROWSER="firefox-nightly"
alias sudo="sudo "
# source some stuff
source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

PATH=$PATH:$HOME/bin:$HOME/.local/bin

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
