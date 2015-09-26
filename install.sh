#!/bin/sh

#create symbolic links in home parent directory
ln -f .bashrc ../
ln -f .bash_logout ../
ln -f .bash_profile ../
ln -f .fehbg ../
ln -f .vimrc ../
ln -f .xinitrc ../
ln -f .i3 ../

#Directory symbolic link and remove directory if exist
rm -rf $(pwd)/../.i3
ln -sf $(pwd)/.i3/ $(pwd)/../
rm -rf $(pwd)/../.config
ln -sf $(pwd)/.config/ $(pwd)/../

#Copying image files back a directory
cp -r wallpapers ../
