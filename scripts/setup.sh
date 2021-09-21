#!/usr/bin/env bash
## Dockerfile Usage:
## COPY scripts/setup.sh ./
## RUN bash setup.sh && rm -f setup.sh
set -euo pipefail
# Installation of Development dependencies that can be conducted as the current user
IDEA_VERSION='2021.2'

## Install Nerd Fonts
echo 'Installing Nerd Fonts'
wget --quiet https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip -qq JetBrainsMono.zip -d $HOME/.local/share/fonts
rm -f JetBrainsMono.zip
echo 'Updating Font Cache'
fc-cache -fv > /dev/null 2>&1

## IntelliJ
echo "Installing IntelliJ $IDEA_VERSION"
wget --quiet https://download.jetbrains.com/idea/ideaIU-$IDEA_VERSION.tar.gz
tar -xf ideaIU-$IDEA_VERSION.tar.gz &>/dev/null
rm -f ideaIU-$IDEA_VERSION.tar.gz
mv idea-IU* idea-IU-$IDEA_VERSION
echo "set -gx PATH \$PATH \$HOME/idea-IU-$IDEA_VERSION/bin" >> "$HOME/.config/omf/init.fish"

# Validation at the developer dependencies are installed and available
fish -c 'docker --version'