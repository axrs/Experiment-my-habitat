#!/usr/bin/env bash
## Dockerfile Usage:
## USER root
## COPY scripts/as_root/install_utilities.sh ./
## RUN bash install_utilities.sh && rm -f install_utilities.sh
set -euo pipefail

apt-get update
apt-get upgrade -y
apt-get install -y \
    apt-utils \
    jq \
    maven \
    rlwrap \
    silversearcher-ag