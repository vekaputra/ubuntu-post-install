#!/bin/bash

# set temporary download directory
mkdir ~/temp

# --- BASIC REQUIREMENT
sudo apt install curl chromium-browser build-essential -y

# --- ZSH
sudo apt install zsh -y

# --- TELEGRAM
curl -o ~/temp/tsetup.2.5.1.tar.xz https://updates.tdesktop.com/tlinux/tsetup.2.5.1.tar.xz
sudo tar -C /usr/local -xzf ~/temp/tsetup.2.5.1.tar.xz

# DEVELOPMENT

# --- GOLANG

## install
curl -o ~/temp/go1.15.7.linux-amd64.tar.gz https://golang.org/dl/go1.15.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf ~/temp/go1.15.7.linux-amd64.tar.gz

# --- AWS CORRETTO 1.8 OPENJDK
curl -fSL https://apt.corretto.aws/corretto.key | sudo apt-key add - 
sudo add-apt-repository 'deb https://apt.corretto.aws stable main' -y
sudo apt update
sudo apt install java-1.8.0-amazon-corretto-jdk -y

# --- NODE

## nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install node

# --- FLUTTER

## flutter
mkdir ~/.flutter
curl -o ~/temp/flutter_linux_1.22.5-stable.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.22.5-stable.tar.xz
tar -C ~/.flutter -xf ~/temp/flutter_linux_1.22.5-stable.tar.xz

## kvm https://developer.android.com/studio/run/emulator-acceleration#vm-linux
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

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
sudo snap install --classic code

# --- VLC
sudo snap install vlc

# --- COPY dotfiles
cp -a ~/ubuntu-post-install/dotfiles/. ~
source ~/.zshrc

# --- GRPC
go get google.golang.org/protobuf/cmd/protoc-gen-go google.golang.org/grpc/cmd/protoc-gen-go-grpc

# --- flutter precache
flutter precache

# --- COPY docker
mkdir -p ~/docker/pgdata
cp -a ~/ubuntu-post-install/docker/docker-compose.yaml ~/docker/docker-compose.yaml

# --- Remove temp
rm -rf ~/temp

# --- Tools to be installed manually
## Jetbrains Toolbox
## Android SDK and Emulator https://medium.com/michael-wallace/how-to-install-android-sdk-and-setup-avd-emulator-without-android-studio-aeb55c014264
## 