#!/usr/bin/env bash
set -euo pipefail

# ghostty's terminfo was accepted into ncurses but ncurses maintainer
# didn't allow for `xterm-ghostty`.
#
G=/usr/share/terminfo/g/ghostty
XG="${HOME}/.terminfo/x/xterm-ghostty"


mkdir -p "${HOME}/.terminfo/x"

if [[ -r ${G} && ! -e ${XG} ]]; then
  ln -s ${G} ${XG}
fi
