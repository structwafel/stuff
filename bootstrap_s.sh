#!/bin bash

#!/bin/bash

# Update package list and install Git
sudo apt-get update
sudo apt-get install -y git

# Clone the repository
git clone https://github.com/yourusername/yourrepo.git

# Change to the repository directory
cd yourrepo

# Run the install script
./just_server_things.sh