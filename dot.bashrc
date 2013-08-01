export JAVA_HOME=/Library/Java/Home
export GOROOT=/usr/local/go
export PATH=/opt/local/bin:/opt/local/sbin:/Users/brian/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export DISPLAY=:0.0

export LSCOLORS=exgxcxdxcxegedabagacad
alias ls='ls -G'


# emacs server setup
export ALTERNATE_EDITOR=vim
export EDITOR=vim
export VISUAL=vim

PATH=$PATH:/usr/local/go/bin:/opt/local/bin:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/share/npm/bin
EDITOR=emacsclient

export WORKON_HOME=~/.envs
source /usr/local/bin/virtualenvwrapper.sh

SSH_ENV=$HOME/.ssh/environment

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
