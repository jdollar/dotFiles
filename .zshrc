# Created by newuser for 5.0.2
export TERMINFO=~/.terminfo
export PS1='%n@%m:%~ $ % '

typeset -A key

key[home]="${terminfo[khome]}"
key[end]="${terminfo[kend]}"
key[delete]="${terminfo[kdch1]}"

bindkey $key[home] beginning-of-line
bindkey $key[end] end-of-line
bindkey $key[delete] delete-char

