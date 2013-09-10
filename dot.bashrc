export JAVA_HOME=/Library/Java/Home
export GOROOT=/usr/local/go
export GOPATH=${HOME}/go
PATH=$PATH:/usr/local/go/bin:/opt/local/bin
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:~/.bin:${GOPATH}/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH


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
