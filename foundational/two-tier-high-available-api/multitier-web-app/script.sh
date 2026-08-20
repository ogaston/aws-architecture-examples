#!/bin/bash

# Sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# Update the package list
sudo apt-get update

# Install Git
sudo apt-get install git

# Install Node.js
sudo apt-get install nodejs

# Clone the repository
git clone https://github.com/ogaston/terraform-examples.git

# Change directory to the cloned repository
cd terraform-examples/nodejs-app

# Install dependencies
npm install

# Run the Node.js app
node app.js