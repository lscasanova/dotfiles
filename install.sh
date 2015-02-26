#!/bin/bash

# Install essential apps
sudo apt-get install -q -y \
    git-core python-dev build-essential gunicorn dkms tree \
    postgresql postgresql-client libpq-dev postgresql-contrib \
    msttcorefonts


# Reload fonts cache
sudo fc-cache -fv


# Google Chrome
if [[ -z `which google-chrome` ]]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable
fi

# Install dotfiles
if [ ! -d ~/dev/dotfiles ]; then
    mkdir -p ~/dev
    pushd ~/dev
    git clone git@github.com:lscasanova/dotfiles.git
    . ~/dev/dotfiles/dotfiles.sh
    popd
fi

# Python stuff
sudo pip install -r ~/dev/dotfiles/python/requirements.txt
mkdir -p ~/.virtualenvs
