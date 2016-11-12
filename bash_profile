# Git aliases
alias gc='git checkout'
alias gd='git diff'
alias gl='git log --graph'
alias gb='git branch'
alias ga='git add .'
alias modified=$'git status | grep modified | awk \'{print $3}\''
alias unstage='git reset .'
alias uncommit='git reset --hard HEAD^'

# General shortcuts
alias gr='grep'
alias ta='tmux attach'
alias cgb="git branch | grep -E '^\*' | awk '{print $2}'"
alias t='tree'
alias l='clear && ls'
alias c='cd'
alias delarch='gb | cut -c3- | grep archpatch- | xargs -n1 gb -D'
DATE=$(date +%m/%d/%y)

# Add a new line to the shell prompt
PS1=$PS1" $DATE @) "

mkcd () { mkdir -p "$1" && cd "$1"; }

# Forward SSH across tmux
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# Pressing Ctrl-S causes my keystrokes to stop being processed. This prevents that.
stty ixany
stty ixoff -ixon
alias act='source env/bin/activate'
alias new-branch='git fetch origin && git checkout origin/master -b '

tmux >/dev/null
