#!/usr/bin/env bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups

# Aliases in their own file
if [ -r ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

shopt -s checkwinsize

# Hardening bash history
shopt -s histappend
readonly HISTFILE
readonly HISTFILESIZE
readonly HISTSIZE
readonly HISTCMD
readonly HISTCONTROL
readonly HISTIGNORE

case "$TERM" in
  xterm-color*)     color_prompt=y;;
  xterm-256color*)  color_prompt=y;;
  screen)           color_prompt=y;;
  *)                color_prompt=n;;
esac

if [ "$color_prompt" = y ]; then
  #PS1='\[\033]0;\u@\h\007\[\033[01;32m\][\u@\h\[\033[00m\] \[\033[01;34m\]\W]\[\033[00m\]\$ '
  PS1='\[\033]0;\u@\h\007\[\033[01;32m\][\u@\h\[\033[00m\]:\[\033[01;34m\]$(~/Scripts/shortenpath.py)]\[\033[00m\]\n\$ '
else
  #PS1='[\u@\h \W]\$ '
  PS1='[\u@\h:$(~/Scripts/shortenpath.py)]\n\$ '
fi

# vim: set ts=2 sw=2 tw=0 ft=sh et :

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PATH="/Users/alexander/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/alexander/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/alexander/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/alexander/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/alexander/perl5"; export PERL_MM_OPT;
