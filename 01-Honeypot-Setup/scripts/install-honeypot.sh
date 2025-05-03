#!/bin/bash
# Install Cowrie Honeypot
sudo apt update
sudo apt install -y git python3-pip
git clone https://github.com/cowrie/cowrie.git /opt/cowrie
cd /opt/cowrie
pip3 install -r requirements.txt
cp etc/cowrie.cfg.dist etc/cowrie.cfg
bin/cowrie start
