#!/bin/bash

# The symlinks
ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Install essential apps
sudo apt-get install -q -y \
    git-core python-dev build-essential gunicorn dkms tree \
    postgresql postgresql-client libpq-dev postgresql-contrib \
    msttcorefonts

# Makes sure the repository is up to date
git pull origin master


# Reload fonts cache
sudo fc-cache -fv


# Google Chrome
if [[ -z `which google-chrome` ]]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable
fi




# Python stuff
sudo pip install -r ~/dev/dotfiles/python/requirements.txt
mkdir -p ~/.virtualenvs
