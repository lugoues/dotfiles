#!/usr/bin/env bash

gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys F830361B1E1D63B0
echo "036eb1713f7165b1857aeaa7f830361b1e1d63b0:6:" | gpg --import-ownertrust
