#!/usr/bin/env bash
#
# A rebuild script that commits on a successful build

set -e

# Edit your config
#$EDITOR configuration.nix

# cd to your config dir
pushd ~/swix

# Early return if no changes were detected
if git diff --quiet '*.nix'; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi

# Autoformat your nix files
#alejandra . &>/dev/null \
#  || ( alejandra . ; echo "formatting failed!" && exit 1)

# Shows your changes
git diff -U0 '*.nix'

echo "SwixOS Rebuilding..."

# Rebuild, output simplified errors, log trackebacks
# TODO Get nh for better rebuild
sudo nixos-rebuild switch --flake ".#swedishos" &>swixos-switch.log || (cat swixos-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations --json | jq '.[] | select (.current == true) | "Swix-v1-g\(.generation)-NixOs\(.nixosVersion)"')

# Commit all changes with the generation metadata
git commit -am "$current"

# Back to where you were
popd

echo "Swix rebuild success! build: $current"
