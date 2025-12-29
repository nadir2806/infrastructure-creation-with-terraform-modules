#!/bin/bash
apt update -y && apt upgrade -y
apt install -y curl build-essential
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt install -y nodejs
npm install -g @angular/cli
