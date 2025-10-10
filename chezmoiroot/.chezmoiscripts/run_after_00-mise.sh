#!/usr/bin/env zsh

mkdir -p ~/.local/{etc,bin,share/zsh/{init.d,completion}}

~/.local/bin/mise self-update

# Mise doesn't have tool dependency support so we must install them first.
~/.local/bin/mise use -g rust

~/.local/bin/mise install --yes
