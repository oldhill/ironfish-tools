#!/bin/bash

set -e

# Iron Fish miner install script for testnet
# Standard disclaimer: USE AT YOUR OWN RISK, secure your server first
# Tested in January 2022 on: AWS EC2 c6g.4xlarge instance (16 cores, Arm-based AWS Graviton2, running Ubuntu 20 Focal)

# On 1st machine login: Linux package installation, upgrade, reboot
# sudo apt-get update && sudo apt-get install build-essential -y && sudo apt-get upgrade -y
# sudo reboot

# Nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 16
npm install -g npm@latest
npm install --global yarn

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Ironfish
mkdir ironfish && cd ironfish
git clone https://github.com/iron-fish/ironfish.git
cd ironfish
yarn install
