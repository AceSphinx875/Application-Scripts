#!/bin/bash

# Update the system
sudo apt update -y && sudo apt upgrade -y

# Install dependencies
sudo apt install -y wget

# Download the latest Google Chrome .deb package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp

# Install Google Chrome
sudo apt install -y /tmp/google-chrome-stable_current_amd64.deb

# Enable auto-update for Google Chrome
echo "Setting up auto-update for Google Chrome..."
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# Update Google Chrome
sudo apt update
sudo apt --only-upgrade install google-chrome-stable

# Setting up automatic cache and cookies clearing
echo "Setting up automatic cache and cookies clearing..."
mkdir -p ~/.config/google-chrome/Default
echo '{"browser":{"clear_data":{"settings":{"clear_site_data_on_exit":true,"clear_cache_on_exit":true}}}}' > ~/.config/google-chrome/Default/Preferences

echo "Google Chrome is installed with auto-update and cache & cookies clearing enabled!"

# Clean up
rm /tmp/google-chrome-stable_current_amd64.deb

echo "Script completed successfully!"
