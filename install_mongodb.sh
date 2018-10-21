#!/bin/sh
echo "Starting mongodb installation ..."
echo "Applying key for mongodb repo ..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "Trying to add mongodb repo to sources list..."
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
echo "Checking for package index update ..."
sudo apt-get update
echo "Going to install mongodb"
sudo apt-get install -y mongodb-org
echo "Starting database service ..."
sudo systemctl start mongod
echo -e "Installed!\nSystemd service startup turning on ..."
sudo systemctl enable mongod
