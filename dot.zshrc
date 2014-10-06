# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fino"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx python battery brew colored-man debian docker fabric golang sudo supervisor themes virtualenv virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# User configuration

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=${HOME}/go

export PATH="/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin"

source /usr/local/bin/virtualenvwrapper.sh

export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375

PATH=$PATH:/usr/local/go/bin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:~/.bin:${GOROOT}/bin:${GOPATH}/bin


export MANPATH="/usr/local/man:$MANPATH"

export ALTERNATE_EDITOR=nano
export EDITOR=emacsclient
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
