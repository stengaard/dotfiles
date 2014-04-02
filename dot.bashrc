export JAVA_HOME=/Library/Java/Home
export GOROOT=/usr/local/go
export GOPATH=${HOME}/go
PATH=$PATH:/usr/local/go/bin:/opt/local/bin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:~/.bin:${GOPATH}/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export CC=/usr/bin/clang

export EC2_HOME=~/.bin/ec2-api-tools/
export MANPATH=/opt/local/share/man:$MANPATH
export DISPLAY=:0.0

export LSCOLORS=exgxcxdxcxegedabagacad
alias ls='ls -G'

# emacs server setup
export ALTERNATE_EDITOR=vim
export EDITOR=emacsclient
export VISUAL=emacsclient

export EDITOR=emacsclient

export WORKON_HOME=~/.envs
source /usr/local/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export DOCKER_HOST=tcp://

