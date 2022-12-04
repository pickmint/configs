source $XDG_CONFIG_HOME/alias

autoload -Uz compinit
compinit -i -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
zstyle ':completion:*' menu select cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

prompt=$'\n'"%F{yellow}~%n%f%F{blue}@%m%f%F{green}:%~%f %F{red}%#%f "

bindkey -e

setopt correct

source $XDG_CONFIG_HOME/shellrc