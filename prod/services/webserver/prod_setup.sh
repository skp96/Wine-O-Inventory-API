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
mix local.rebar --force
mix deps.get --only prod
MIX_ENV=prod mix compile

# Install node dependencies
npm --prefix ./client install

# Build React Frontend
npm --prefix ./client run build

# Digest and compress static files
MIX_ENV=prod mix phx.digest

# Set Secret Key and Database URL
export SECRET_KEY_BASE=$(mix phx.gen.secret)
export DATABASE_URL="postgresql://${db_username}:${db_password}@${db_address}:${db_port}/${db_name}"

MIX_ENV=prod mix ecto.migrate

PORT=8080 MIX_ENV=prod mix phx.server


