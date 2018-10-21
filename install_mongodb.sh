#!/bin/sh
echo "Starting mongodb installation ..."
echo "Applying key for mongodb repo ..."
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "Trying to add mongodb repo to sources list..."
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
echo "Checking for package index update ..."
apt-get update
echo "Going to install mongodb"
apt-get install -y mongodb-org
echo "Starting MONGODB ..."
systemctl start mongod
echo -e "enable MONGODB ..."
systemctl enable mongod
