#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install homebrew (https://brew.sh/)
if ! command -v bsrew >/dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install Bash 4.
brew install bash

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install other useful tools.
brew install vim
brew install grep
brew install wget
brew install openssh
brew install screen
brew install git
brew install yarn --ignore-dependencies
brew install rename
brew install ssh-copy-id
brew install tree

# Remove outdated versions from the cellar.
brew cleanup

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# Install Node LTS (long-term support) version.
# Remote the systerm node which installed because of yarn.
brew uninstall --ignore-dependencies node
nvm install --lts
nvm use --lts