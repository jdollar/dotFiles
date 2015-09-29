#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias lsa='ls -a'
PS1='[\u@\h \W]\$ '
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
