echo -e "$(cat $HOME/stuff/dragon_parsed.txt)"; PF_INFO="title os host kernel uptime pkgs memory wm" pfetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
autoload -U colors
colors
#PS1="%{$fg[blue]%}\$%{$reset_color%} "
#RPS1="%{$fg[black]%}%{$bg[blue]%}%{$reset_color%}%{$bg[blue]%}$USER@${host} %{$fg[blue]%}%{$bg[green]%}%{$reset_color%}%{$bg[green]%} %~ %{$reset_color%}%{$fg[green]%}%{$reset_color%}"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh-history

alias ls="ls --color=auto"
alias vi="nvim"
alias vim="nvim"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export FILE="nnn"
source $HOME/Plugins/zsh-autopair/autopair.zsh
source $HOME/Plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

PATH=$PATH:$HOME/bin:$HOME/.local/bin 

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $HOME/Plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
