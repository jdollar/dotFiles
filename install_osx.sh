#!/bin/sh

export DOTFILE_DIR=$HOME/personalrepos/dotFiles

# Zsh
ln -s $DOTFILE_DIR/osx/zsh/zshrc ~/.zshrc
ln -s $DOTFILE_DIR/osx/zsh/zsh_aliases ~/.zsh_aliases
ln -s $DOTFILE_DIR/osx/zsh/zsh_profile ~/.zsh_profile

# vim
ln -s $DOTFILE_DIR/osx/vim/vim ~/.vim
ln -s $DOTFILE_DIR/osx/vim/vimrc ~/.vimrc
ln -s $DOTFILE_DIR/osx/vim/viminfo ~/.viminfo
