# More bash-like completion
setopt noalwayslastprompt
setopt noauto_remove_slash
setopt no_list_types
setopt complete_in_word
setopt autolist
setopt no_auto_menu
setopt bash_auto_list
unsetopt menucomplete
zstyle ':completion:*' file-patterns '*(D)' # invisible files
unlimit
