#!/bin bash

#!/bin/bash

# Update package list and install Git
sudo apt-get update
sudo apt-get install -y git

# Clone the repository
git clone https://github.com/structwafel/stuff.git

# Change to the repository directory
cd stuff

# Run the install script
./just_server_things.sh