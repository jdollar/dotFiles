#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export VGL_DISPLAY=$DISPLAY

#if ! [[-n "$SSH_CLIENT"]]; then
  startx
#fi
