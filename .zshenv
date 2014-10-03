export QT5='/Users/villadelfia/Developer/Qt5/5.2.0/clang_64'
export EDITOR='subl -w'
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1
export GNUTERM=x11
export HOMEBREW_NO_EMOJI=1

# Path.
QTPATH=$HOME/Developer/Qt5/5.2.0/clang_64/bin
UNIXPATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
SERVERPATH=/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin
OTHERPATH=/opt/X11/bin:/usr/texbin
APPPATH=/Applications/DrRacket.app/Contents/MacOS/bin:/Applications/love.app/Contents/MacOS:/Library/Frameworks/Mono.framework/Versions/Current/bin
PYPATH=/Users/villadelfia/Library/Python/2.7/bin

export PATH=$QTPATH:$UNIXPATH:$SERVERPATH:$OTHERPATH:$APPPATH:$PYPATH

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export CMAKE_PREFIX_PATH=$HOME/Developer/Qt5/5.2.0/clang_64
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig