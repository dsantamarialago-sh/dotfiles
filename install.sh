#!/bin/sh

# Check for Oh My Zsh and install if we don't have it
if [ ! -f "$HOME/.zshrc" ]; then
  echo ":: Installing Oh-My-ZSH!..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Installing OH MY ZSH Theme and plugins
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  echo ":: Installing zsh-autosuggestions plugin..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# Check for Homebrew and install if we don't have it
if test ! "$(which brew)"; then
  echo ":: Installing Brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
echo ":: Updating brew..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo ":: Install Brew dependencies..."
brew tap homebrew/bundle
brew bundle

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc


# Install SDKMAN
if [ ! -d $HOME/.sdkman ] ; then
  echo ":: Installing SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
  echo ":: :: Installing JDK 8.0.302-zulu"
  sdk install java 8.0.302-zulu
fi

# Download QA Repos
echo ":: Cloning common repos..."
./clone-repos.sh
