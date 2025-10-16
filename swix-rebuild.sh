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
echo -ne "\033[?1049h\033[H"
echo "Rebuilding SwixOS..."

set +o pipefail # Disable pipefail since we check ourselves
# Rebuild, output simplified errors, log trackebacks
# TODO Get nh for better rebuild
sudo nixos-rebuild switch --flake ".#swedishos" &>swixos-switch.log || (cat swixos-switch.log | grep --color error && exit 1)
exit_code="${PIPESTATUS[0]}"
set -o pipefail # Re-enable pipefail

# Wait a bit before exiting buffer
echo -e "\n\033[34mSwixOS rebuild completed\033[0m (code: $exit_code)"
echo -ne "\rExit in 3" && sleep 1
echo -ne "\rExit in 2" && sleep 1
echo -ne "\rExit in 1" && sleep 1
echo -ne "\033[?1049l" # exit alt-buff

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)
# \/ gotta install jq ^ currently broken return table not string
#current=$(nixos-rebuild list-generations --json | jq '.[] | select (.current == true) | "\(.generation)"')


# Commit all changes with the generation metadata
git commit -am "$current"

# Back to where you were
popd

# Notify all OK!
notify-send -e "SwixOS Rebuilt OK!" --icon=software-update-available