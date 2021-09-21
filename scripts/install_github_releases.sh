#!/usr/bin/env bash
set -euo pipefail

function install-from-github(){
    local tmp_dir loc repo url dest tarfilename
    tmp_dir="$(mktemp -d -t tmp-XXXXXXXXXX)"
    loc="$tmp_dir/$1"
    dest="$2"
    repo="https://api.github.com/repos/$1/releases/latest"
    url=$(curl -s "$repo" | grep 'browser_download_url' | grep 'linux' | cut -d '"' -f 4)
    echo "Downloading $url from $repo"
    mkdir -p "$loc"
    curl -sOL --output-dir "$loc" "$url"
    tarfilename="$(find "$loc" -name "*.tar.gz")"
    echo "Extracting $tarfilename"
    mkdir -p "$dest"
    tar xzf "$tarfilename" -C "$dest"
    rm -rf "$tmp_dir"
}

install-from-github 'ardourtech/habitat' "$HOME/bin"
fish -c 'habitat --version'