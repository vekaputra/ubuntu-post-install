#!/bin/bash

# set temporary download directory
mkdir ~/temp

# --- BASIC REQUIREMENT
sudo apt update
sudo apt install curl build-essential zsh software-properties-common unzip -y
sudo add-apt-repository ppa:ondrej/php -y

# --- PHP 8
# https://linuxize.com/post/how-to-install-php-8-on-ubuntu-20-04/
sudo apt install php8.0 php8.0-fpm php8.0-common php8.0-bcmath php8.0-json php8.0-mbstring php8.0-mysql php8.0-xml php8.0-zip

# --- COMPOSER
curl -sS https://getcomposer.org/installer -o ~/temp/composer-setup.php
sudo php ~/temp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# --- CHROME
curl -o ~/temp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -f install ~/temp/chrome.deb

# --- TELEGRAM
curl -o ~/temp/tsetup.2.5.1.tar.xz https://updates.tdesktop.com/tlinux/tsetup.2.5.1.tar.xz
sudo tar -C /usr/local -xzf ~/temp/tsetup.2.5.1.tar.xz

# DEVELOPMENT

# --- REDIS TOOLS
sudo apt-get install redis-tools -y

# --- GOLANG
curl -o ~/temp/go1.15.7.linux-amd64.tar.gz https://golang.org/dl/go1.15.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf ~/temp/go1.15.7.linux-amd64.tar.gz

# --- NODE
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install node

# --- DOCKER

## install
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" -y
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y

## allow docker without sudo
sudo usermod -aG docker ${USER}

# --- SLACK
curl -o ~/temp/slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.12.0-amd64.deb
sudo apt -f install ~/temp/slack.deb -y

# --- VIRTUALBOX
curl -o ~/temp/virtualbox.deb https://download.virtualbox.org/virtualbox/6.1.18/virtualbox-6.1_6.1.18-142142~Ubuntu~eoan_amd64.deb
sudo apt -f install ~/temp/virtualbox.deb -y

# --- CALIBRE
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# --- VSCode
curl -o ~/temp/code.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt -f install ~/temp/code.deb

# --- VLC
sudo snap install vlc

# --- Bitwarden
sudo snap install bw

# --- Simplenote
curl -o ~/temp/simplenote.deb https://github.com/Automattic/simplenote-electron/releases/download/v2.14.0/Simplenote-linux-2.14.0-amd64.deb
sudo apt -f install ~/temp/simplenote.deb

# --- COPY dotfiles
cp -a ~/ubuntu-post-install/dotfiles/. ~
source ~/.zshrc

# --- GRPC
sudo apt install protobuf-compiler -y
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1

# --- NGINX
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'
sudo systemctl enable nginx

# --- Jetbrains Toolbox
curl -o ~/temp/jt-toolbox.tar.gz https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.21.9547.tar.gz
sudo tar -C /usr/local -xzf ~/temp/jt-toolbox.tar.gz

# --- COPY docker
mkdir -p ~/docker/pgdata
cp -a ~/ubuntu-post-install/docker/docker-compose.yaml ~/docker/docker-compose.yaml

# --- Remove temp
rm -rf ~/temp

# --- Tools to be installed manually
## Jetbrains Toolbox + IDEA + DataGrip
## Setup ZSH `sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
## Use zsh p10k theme