# Created by newuser for 5.0.2
export TERMINFO=~/.terminfo

typeset -A key

key[home]="${terminfo[khome]}"
key[end]="${terminfo[kend]}"

bindkey "\E[3~" delete-char
bindkey "\E[1~" beginning-of-line
bindkey "\E[4~" end-of-line
