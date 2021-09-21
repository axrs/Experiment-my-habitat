#!/usr/bin/env bash
## Dockerfile Usage:
## COPY scripts/install_intellij.sh ./
## RUN bash install_intellij.sh && rm -f install_intellij.sh
set -euo pipefail
# Installation of Development dependencies that can be conducted as the current user
IDEA_VERSION='2021.2'

echo "Installing IntelliJ $IDEA_VERSION"
wget --quiet https://download.jetbrains.com/idea/ideaIU-$IDEA_VERSION.tar.gz
tar -xf ideaIU-$IDEA_VERSION.tar.gz &>/dev/null
rm -f ideaIU-$IDEA_VERSION.tar.gz
mv idea-IU* idea-IU-$IDEA_VERSION
echo "set -gx PATH \$PATH \$HOME/idea-IU-$IDEA_VERSION/bin" >> "$HOME/.config/omf/init.fish"

eula_path="$HOME/.java/.userPrefs/jetbrains/_!(!!cg\"p!(}!}@\"j!(k!|w\"w!'8!b!\"p!':!e@=="
mkdir -p "$eula_path"
echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE map SYSTEM "http://java.sun.com/dtd/preferences.dtd">
<map MAP_XML_VERSION="1.0">
  <entry key="eua_accepted_version" value="1.2"/>
</map>' > "$eula_path/prefs.xml"