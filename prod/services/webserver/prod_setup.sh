#!/bin/bash

# Update packages information from repositories
sudo apt-get update -y
sudo apt-get -y install git wget
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install openssl

# Add Erlang Solutions Repository
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb

# Update packages information from repositories
sudo apt-get update -y

# Install Elixir and Erlang
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

# Install node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 17.5.0

cat <<EOF >> /home/ubuntu/.bashrc
export NVM_DIR="/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
EOF

# Clone Repository
cd /home/ubuntu
export HOME="/home/ubuntu"
git clone https://github.com/skp96/Wine-O-Inventory-API.git
cd Wine-O-Inventory-API

# Install phoenix dependencies
mix local.hex --force
mix deps.get

# Install node dependencies
npm --prefix ./client install


