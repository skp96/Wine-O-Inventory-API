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
sudo apt-get install -y elixir=1.13.3

# Install node.js
sudo apt-get install -y nodejs=17.5.0
suod apt-get install -y npm=8.4.1

# Clone Repository
git clone https://github.com/skp96/Wine-O-Inventory-API.git
cd wine_o_inventory_api || exit

# Install phoenix dependencies
mix deps.get

# Install node dependencies
npm --prefix ./client install


