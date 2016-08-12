#!/usr/bin/env bash
# vim: set ts=2 sw=2 tw=0 ft=sh et :

[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s ~/Scripts/bash_colors ]] && source ~/Scripts/bash_colors
[[ -s ~/.aws.conf ]] && source ~/.aws.conf
[[ -s ~/.vcloud.conf ]] && source ~/.vcloud.conf
[[ -s ~/.bash_functions ]] && source ~/.bash_functions

export LANG=en_US.UTF-8

STATUS=$(/usr/local/bin/docker-machine status docker-vm)
if [ "$STATUS" != "Running" ] ; then
  echo -e "${GREEN}Docker-VM not running${NC}"
else
  echo -e "${YELLOW}Docker IP ${CYAN}$(/usr/local/bin/docker-machine ip docker-vm)${NC}"
  eval "$(/usr/local/bin/docker-machine env docker-vm 2>/dev/null)"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[[ -s "$(brew --prefix dvm)/dvm.sh" ]] && source "$(brew --prefix dvm)/dvm.sh"
[[ -r $DVM_DIR/bash_completion ]] && . $DVM_DIR/bash_completion

if [ -f ~/.bash-git-prompt/gitprompt.sh ];then
  # Set config variables first
  GIT_PROMPT_ONLY_IN_REPO=1
  source ~/.bash-git-prompt/gitprompt.sh
fi

export HISTTIMEFORMAT="%Y%m%d %T "
export PYTHONSTARTUP=~/.pythonrc
export LSCOLORS=ExGxFxDxCxDxDxhbhdaceb
export PATH=$PATH:/usr/local/Cellar/node/0.12.7/libexec/npm/bin:/usr/local/sbin:~/Scripts

if [ -z "$DOCKER_HOST" ]; then
  export DOCKER_HOST="tcp://dockerhost.verhaar.io:2376"
  export DOCKER_TLS_VERIFY="1"
  export DOCKER_CERT_PATH=~/.docker
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
