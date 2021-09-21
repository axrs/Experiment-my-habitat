#!/usr/bin/env bash
## Dockerfile Usage:
## COPY scripts/setup.sh ./
## RUN bash setup.sh && rm -f setup.sh
set -euo pipefail
# Installation of Development dependencies that can be conducted as the current user

## Install Nerd Fonts
echo 'Installing Nerd Fonts'
wget --quiet https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip -qq JetBrainsMono.zip -d $HOME/.local/share/fonts
rm -f JetBrainsMono.zip
echo 'Updating Font Cache'
fc-cache -fv > /dev/null 2>&1

# Validation at the developer dependencies are installed and available
fish -c 'docker --version'

maven_repo_location="$(mvn help:evaluate -Dexpression=settings.localRepository -q -DforceStdout)"
[[ "$maven_repo_location" == "/volumes/maven-cache" ]] || exit 1

sed -i -e "s/habitat/${HABITAT_USER}/g" "$HOME/.clojure/bin/clj"
sed -i -e "s/habitat/${HABITAT_USER}/g" "$HOME/.clojure/bin/clojure"
fish -c 'clojure -e "(inc 1)"'
