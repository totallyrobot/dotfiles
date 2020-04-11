autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
autoload -U colors
colors
PS1="%{$fg[blue]%}\$%{$reset_color%} "
RPS1="%{$fg[black]%}%{$bg[blue]%}%{$reset_color%}%{$bg[blue]%}$USER@$(hostname) %{$fg[blue]%}%{$bg[green]%}%{$reset_color%}%{$bg[green]%} %~ %{$reset_color%}%{$fg[green]%}%{$reset_color%}"

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh-history

alias ls="ls --color=auto"
alias vi="nvim"
alias vim="nvim"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export FILE="ranger"
source $HOME/Plugins/zsh-autopair/autopair.zsh
source $HOME/Plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/Plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/Plugins/sudo.zsh

PATH=$PATH:$HOME/bin:$HOME/.local/bin 
echo -e "$(cat stuff/dragon_parsed.txt)"; PF_INFO="title os host kernel uptime pkgs memory wm" pfetch

