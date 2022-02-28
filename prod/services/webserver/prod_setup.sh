#!/bin/bash

# Update packages information from repositories
sudo apt-get update -y
sudo apt-get install -y git wget

# Add Erlang Solutions Repository
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb

# Update packages information from repositories
sudo apt-get update -y

# Install Elixir and Erlang
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

# Install node.js
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
sudo apt-get install -y nodejs

# Clone Repository
git clone https://github.com/skp96/Wine-O-Inventory-API.git
cd Wine-O-Inventory-API || exit

# Install phoenix dependencies
mix deps.get

# Install node dependencies
npm --prefix ./client install


