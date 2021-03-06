# Enable extra completion options
fpath=($HOME/.zsh/func $HOME/.zsh/git $fpath)
typeset -U fpath

# Enable autocomplete
zstyle :compinstall filename "$HOME/.zshrc"
autoload -U compinit
compinit
_comp_options+=(globdots)

# Enable auto-correction
setopt correctall

# Allow typing folder names mean cd
setopt autocd

# Beep
setopt beep

# Enable advanced (regex) globbing
setopt extendedglob

# Themes! 
loadtheme() {
    if [ -f $HOME/.zsh/themes/$theme.zsh ]; then
        source $HOME/.zsh/themes/$theme.zsh
    else
        echo "zsh: warning, could not load theme '$theme'." >&2
    fi
}

theme=git
loadtheme

# Plugins!
loadplugins() {
    for x in ${plugins[@]}; do
        if [ -f $HOME/.zsh/plugins/$x.zsh ]; then
            source $HOME/.zsh/plugins/$x.zsh
        else
            echo "zsh: warning, could not find plugin '$x'." >&2
        fi
    done
}

# publ ssh-tunnel bashlike func
plugins=(func history)
loadplugins

# Load local stuff
if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi

# Aliases
manpre() { man -t $@ | open -f -a /Applications/Preview.app }
alias git-pull-all='for branch in `git branch -a | grep remotes | grep -v HEAD | grep -v master`; do git branch --track ${branch##*/} $branch; done'
function tvim(){ tmux -u -2 new-session "TERM=screen-256color reattach-to-user-namespace -l vim $@" ; }
gcmake() { CC=gcc-4.7 CXX=g++-4.7 cmake "$@" }
alias unzip-all="find . -name '*.zip' -exec unzip {} \;"
alias cdlink="cd `readlink $(pwd)`"
dotfiles() { ~/Projects/Github/villadelfia/dotfiles/dotfiles.sh "$@" }

# Case insensitive files system -> case insensitive commands.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Fix the navigation keyblock.
bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[6~" end-of-history
bindkey "^[[5~" beginning-of-history

# perlbrew, modifies path.
source ~/perl5/perlbrew/etc/bashrc

# rvm, modifies path.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"