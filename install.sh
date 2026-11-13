#!/bin/sh
# Symlink sudoine into ~/.local/bin
set -e
d=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$HOME/.local/bin"
ln -sf "$d/sudoine" "$HOME/.local/bin/sudoine"
echo "installed: $HOME/.local/bin/sudoine (make sure it's on your PATH)"
