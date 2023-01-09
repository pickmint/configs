source $XDG_CONFIG_HOME/alias

autoload -Uz compinit
compinit -i -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
zstyle ':completion:*' menu select cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

prompt=$'\n'"%F{yellow}~%n%f%F{blue}@%m%f%F{green}:%3~%f %F{red}%#%f " # "<newline> ~username@host:directory % "

bindkey -e # Emacs' keymap

setopt correct

source $XDG_CONFIG_HOME/shellrc
