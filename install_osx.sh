#!/bin/sh

export DOTFILE_DIR=$HOME/personalrepos/dotFiles

is_installed()
{
  local program=$1
  [[ ! -x  /bin/$program && ! -x /usr/bin/$program && ! -x /usr/local/bin/$program ]] && return 0 || return 1
}

install_brew()
{
  is_installed brew
  if [[ $? = 0 ]]; then
    echo "Installing homebrew..."

    is_installed ruby
    if [[ $? = 0 ]]; then
      echo "Ruby installation not found. Please install ruby so we can install homebrew."
      return 0;
    fi
    
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
    return 1;
  else
    echo "Homebrew already installed. Skipping..."
    return 2;
  fi
}

install_zsh()
{
  is_installed zsh
  if [[ $? = 0 ]]; then
    brew install zsh
    ln -s $DOTFILE_DIR/osx/zsh/zshrc ~/.zshrc
    ln -s $DOTFILE_DIR/osx/zsh/zsh_aliases ~/.zsh_aliases
    ln -s $DOTFILE_DIR/osx/zsh/zsh_profile ~/.zsh_profile
    return 1;
  else
    echo "zsh already installed. Skipping..."
    return 2;
  fi

  return 0;
}

install_vim()
{
  is_installed vim
  if [[ $? = 0 ]]; then
    echo "installing vim..."
    brew install vim
    ln -s $DOTFILE_DIR/osx/vim/vim ~/.vim
    ln -s $DOTFILE_DIR/osx/vim/vimrc ~/.vimrc
    ln -s $DOTFILE_DIR/osx/vim/viminfo ~/.viminfo
    return 1;
  else
    echo "vim already installed. Skipping..."
    return 2;
  fi

  return 0;
}

install_brew
install_zsh
install_vim
