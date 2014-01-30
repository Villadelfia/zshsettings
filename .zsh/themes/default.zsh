# Automatically tries to make a prompt that looks like the native one for the OS

uname=$(uname -s)

nl='
'

if [ $UID -eq 0 ]; then
    usuf='#'
else
    usuf='\$'
fi

winify() {
    if echo "$1" | grep -q "$HOME"; then
        echo "$1" | sed "s:$HOME:~:" | sed 's:/:\\:g'
    else
        cygpath -aw "$1"
    fi
}

case $uname in
Cygwin*|CYGWIN*)
    # Cygwin
    autoload colors;
    colors;
    setopt prompt_subst

    export PS1="$nl%{$fg[green]%}%n@%m %{$fg[yellow]%}"'$(winify $PWD)'
    export PS1="$PS1$nl%{$reset_color%}$usuf "
    ;;
Darwin)
    # Mac OS X
    autoload colors;
    colors;
    setopt prompt_subst
    export PS1="%{$fg[yellow]%}%m:%c %n$usuf%{$reset_color%} "
    ;;
Linux|*)
    distro=$(lsb_release -si)
    case $distro in
    Fedora)
        # Probably a crapload of other distros as well
        export PS1="[%n@%m %c]$usuf "
        ;;
    Ubuntu|Debian|*)
        # Default to Debian-like shell.
        export PS1="%n@%m:%~$usuf "
        ;;
    esac
    ;;
esac
