#! /bin/bash
# Installs ruby and mongodb
sudo su -
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
apt-get update
apt-get install -y ruby-full ruby-bundler build-essential mongodb-org
systemctl start mongod
systemctl enable mongod
exit
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
