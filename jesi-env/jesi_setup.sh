#!/usr/bin/env bash
## Dockerfile Usage:
## COPY jesi-env/jesi_setup.sh ./
## RUN bash jesi_setup.sh && rm -f jesi_setup.sh
set -e

# Installation of Development dependencies that need to be conducted as the root user
## CircleCI CLI
curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | bash

# Validation at the developer dependencies are installed and available
fish -c 'circleci version'