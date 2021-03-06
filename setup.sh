#!/usr/bin/env bash

# echo "Installing Xcode CLI..."
# xcode-select --install

# if test ! $(which brew); then
#     echo "Installing Homebrew..."
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# else
#     echo "Homebrew is already installed!"
# fi

echo "Updating Homebrew..."
brew update

echo "Installing Heroku CLI..."
brew install heroku/brew/heroku

echo "Installing Azure CLI... "
brew install azure-cli

echo "Installing Kubernetes CLI..."
brew install kubectl

echo "Installing AWS CLI..."
brew install awscli

echo "Installing AWS vault..."
brew install aws-vault

echo "Installing Terraform CLI..."
brew install tfenv

# echo "Installing Nvm..."
# brew install nvm

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

echo "Installing Pyenv..."
brew install pyenv

echo "Installing apps with cask..."
apps=(
    iterm2
    alfred
    mongodb-compass
    google-chrome
    firefox
    visual-studio-code
    intellij-idea
    spotify
    slack
    microsoft-teams
    docker
    lastpass
    postman
    notion
)

brew install --cask --appdir="/Applications" ${apps[@]}

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Creating an SSH key..."
ssh-keygen -t rsa -b 4096

echo "Cleaning up..."
brew cleanup

echo "Setting Mac settings..."
git config --global user.name "Thomas H"
git config --global user.email "itmethomas@gmail.com"
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch

# Enable three finger drag - not working M1
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1

# Enable tap to click - not working M1
# defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 0

# Show all filename extensions in Finder by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show all hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# Show Path Bar in Finder - not working
# defaults write com.apple.finder ShowPathbar -bool true

# Show Status Bar in Finder
# defaults write com.apple.finder ShowStatusBar -bool true

# Use column view in all Finder windows by default
# defaults write com.apple.finder FXPreferredViewStyle Clmv

# Avoiding the creation of .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Setting Dock to auto-hide and removing the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate
defaults write com.apple.dock tilesize -int 36

# Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Use `~/Downloads/Incomplete` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

killall Finder
killall Dock

echo "Setup complete!"
