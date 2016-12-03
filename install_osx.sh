#!/bin/sh

DOTFILE_DIR=$HOME/personalrepos/dotFiles
DOT_OSX_DIR=$DOTFILE_DIR/osx
HOMEBREW_INSTALL_URL=https://raw.githubusercontent.com/Homebrew/install/master/install

#labels
SKIPPING_LABEL="\033[7mSkipping...\033[27m"
HOMEBREW_LABEL="\033[30;43mhomebrew\033[0m"
ZSH_LABEL="\033[30;106mzsh\033[0m"
VIM_LABEL="\033[45;30mvim\033[0m"
ATOM_LABEL="\033[42;39matom\033[0m"
RUBY_LABEL="\033[39;41mRuby\033[0m"

is_installed()
{
  local program=$1
  [[ ! -x  /bin/$program 
    && ! -x /usr/bin/$program 
    && ! -x /usr/local/bin/$program 
    && ! -x /usr/local/Caskroom/$program ]] && return 0 || return 1
}

install_with_brew()
{
  local program=$1
  local label=$2
  is_installed $program
  if [[ $? = 0 ]]; then
    echo "installing $label..."
    brew cask install $program
    ln -s $DOT_OSX_DIR/$program ~/.$program
    return 1; 
  else
    echo "$label already installed. $SKIPPING_LABEL"
    return 2;
  fi

  return 0;
}

install_brew()
{
  is_installed brew
  if [[ $? = 0 ]]; then
    echo "Installing $HOMEBREW_LABEL..."

    is_installed ruby
    if [[ $? = 0 ]]; then
      echo "$RUBY_LABEL installation not found. Please install ruby so we can install homebrew."
      return 0;
    fi
    
    /usr/bin/ruby -e "$(curl -fsSL $HOMEBREW_INSTALL_URL)" 
    return 1;
  else
    echo "$HOMEBREW_LABEL already installed. $SKIPPING_LABEL"
    return 2;
  fi
}

install_zsh()
{
  install_with_brew zsh $ZSH_LABEL
  if [[ $? = 1 ]]; then
    ln -s $DOT_OSX_DIR/zsh/zshrc ~/.zshrc
    ln -s $DOT_OSX_DIR/zsh/zsh_aliases ~/.zsh_aliases
    ln -s $DOT_OSX_DIR/zsh/zsh_profile ~/.zsh_profile
    return 1;
  fi

  return 0;
}

install_vim()
{
  install_with_brew vim $VIM_LABEL
  if [[ $? = 1 ]]; then
    ln -s $DOT_OSX_DIR/vim/vim ~/.vim
    ln -s $DOT_OSX_DIR/vim/vimrc ~/.vimrc
    ln -s $DOT_OSX_DIR/vim/viminfo ~/.viminfo
    return 1;
  fi

  return 0;
}

install_atom()
{
  install_with_brew atom $ATOM_LABEL
  if [[ $? = 1 ]]; then
    ln -s $DOT_OSX_DIR/atom ~/.$ATOM_LABEL
    return 1; 
  fi

  return 0;
}

install_brew
if [[ $? != 0 ]]; then
  install_zsh
  install_vim
  install_atom
fi
