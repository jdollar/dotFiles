#!/bin/sh

export DOTFILE_DIR=$HOME/personalrepos/dotFiles
skippingLabel="\033[7mSkipping...\033[27m"

is_installed()
{
  local program=$1
  [[ ! -x  /bin/$program 
    && ! -x /usr/bin/$program 
    && ! -x /usr/local/bin/$program 
    && ! -x /usr/local/Caskroom/$program ]] && return 0 || return 1
}

install_brew()
{
  local homebrewLabel="\033[30;43mhomebrew\033[0m"

  is_installed brew
  if [[ $? = 0 ]]; then
    echo "Installing $homebrewLabel..."

    is_installed ruby
    if [[ $? = 0 ]]; then
      local rubyLabel="\033[39;41mRuby\033[0m"
      echo "$rubyLabel installation not found. Please install ruby so we can install homebrew."
      return 0;
    fi
    
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
    return 1;
  else
    echo "$homebrewLabel already installed. $skippingLabel"
    return 2;
  fi
}

install_zsh()
{
  local zshLabel="\033[30;106mzsh\033[0m"
  is_installed zsh
  if [[ $? = 0 ]]; then
    brew install zsh
    ln -s $DOTFILE_DIR/osx/zsh/zshrc ~/.zshrc
    ln -s $DOTFILE_DIR/osx/zsh/zsh_aliases ~/.zsh_aliases
    ln -s $DOTFILE_DIR/osx/zsh/zsh_profile ~/.zsh_profile
    return 1;
  else
    echo "$zshLabel already installed. $skippingLabel"
    return 2;
  fi

  return 0;
}

install_vim()
{
  local vimLabel="\033[45;30mvim\033[0m"
  is_installed vim
  if [[ $? = 0 ]]; then
    echo "installing $vimLabel..."
    brew install vim
    ln -s $DOTFILE_DIR/osx/vim/vim ~/.vim
    ln -s $DOTFILE_DIR/osx/vim/vimrc ~/.vimrc
    ln -s $DOTFILE_DIR/osx/vim/viminfo ~/.viminfo
    return 1;
  else
    echo "$vimLabel already installed. $skippingLabel"
    return 2;
  fi

  return 0;
}

install_atom()
{
  local atomLabel="\033[42;39matom\033[0m"
  is_installed atom
  if [[ $? = 0 ]]; then
    echo "installing $atomLabel..."
    brew cask install atom
    ln -s $DOTFIRE_DIR/osx/atom ~/.$atomLabel
    return 1; 
  else
    echo "$atomLabel already installed. $skippingLabel"
    return 2;
  fi

  return 0;
}

install_brew
if [[ $? != 0 ]]; then
  install_zsh
  install_vim
  install_atom
fi
