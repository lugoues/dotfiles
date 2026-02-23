#!/usr/bin/env bash
set -euo pipefail

# ghostty's terminfo was accepted into ncurses but ncurses maintainer
# didn't allow for `xterm-ghostty`.
#
terminfo_dir=/usr/share/terminfo
G=${terminfo_dir}/g/ghostty
XG=${terminfo_dir}/x/xterm-ghostty

if [[ -r ${G} && ! -e ${XG} ]]; then
  ln -s ${G} ${XG}
fi
