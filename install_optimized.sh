#!/bin/bash
# Optimized installation script for N95

set -e

# Update package list and install dependencies
apt-get update && apt-get install -y \
    curl \
    wget \
    build-essential \
    libssl-dev \
    python3-dev \
    python3-pip

# Get the latest version of N95
N95_VERSION="latest"
N95_URL="https://n95.example.com/download/N95_$N95_VERSION.tar.gz"

# Download the software
wget -O n95.tar.gz $N95_URL

# Extract the downloaded file
mkdir n95_install_dir && tar -xzf n95.tar.gz -C n95_install_dir

# Install N95
cd n95_install_dir/N95_$N95_VERSION
./configure
make
make install

# Clean up
cd ../..
rm -rf n95_install_dir n95.tar.gz

echo "N95 installation completed successfully!"