#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WIKI_DIR="${SCRIPT_DIR}/../references/wiki"

if [ -d "${WIKI_DIR}/.git" ]; then
    echo "Updating Hyprland wiki in ${WIKI_DIR}..."
    git -C "${WIKI_DIR}" pull --rebase
else
    echo "Cloning Hyprland wiki into ${WIKI_DIR}..."
    git clone --depth 1 https://github.com/hyprwm/hyprland-wiki "${WIKI_DIR}"
fi

echo "Hyprland wiki is up to date."
