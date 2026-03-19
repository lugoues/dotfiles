#!/usr/bin/env zsh

mkdir -p ~/.local/{etc,bin,share/zsh/{init.d,completion}}

mise self-update --yes

# Mise doesn't have tool dependency support so we must install them first.
mise use -g rust

mise install --yes
