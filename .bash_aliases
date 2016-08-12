#!/usr/bin/env bash
# vim: set ts=4 sw=4 tw=0 ft=sh et :

alias ls='ls -G'
alias ssh='ssh -A'
alias lh1a='ssh lh1a'
alias lh1b='ssh lh1b'
alias lh2a='ssh lh2a'
alias lh2b='ssh lh2b'
alias tunnel='ssh -fN tunnel'
alias wh1a='open ~/RDP/wh1a.rdp'
alias wh1b='open ~/RDP/wh1b.rdp'
alias wh2a='open ~/RDP/wh2a.rdp'
alias wh2b='open ~/RDP/wh2b.rdp'
alias rm='rm -i'
alias cp='cp -i'
alias chmod='chmod -vv'
alias _reload='exec bash'

# Functions
ssh-alias() {
    cat ~/.ssh/config | grep "Host " | awk '{ print $2 }'
}
_HEADER() {
    curl --head -X HEAD $1
}

code () {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

_reload_docker() {
    STATUS=$(/usr/local/bin/docker-machine status docker-vm)
    if [ "$STATUS" != "Running" ] ; then
        echo -e "${GREEN}Docker-VM not running${NC}"
    else
        echo -e "${YELLOW}Docker IP ${CYAN}$(/usr/local/bin/docker-machine ip docker-vm)${NC}"
        eval "$(/usr/local/bin/docker-machine env docker-vm 2>/dev/null)"
    fi
}

