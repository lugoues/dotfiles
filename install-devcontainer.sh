#!/usr/bin/env bash

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo touch /.devcontainer


${__dir}/install.sh
