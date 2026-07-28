# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text

autoload -U add-zsh-hook

setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}

stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

set-window-title() {
  stt_both "${HOST/.*/}"
}

set-cmd-title() {
  case "$1" in
    mise\ run\ *|mr\ *)
      stt_both "mise: ${1##* }"
      ;;
    *)
      stt_both "$1 ahh"
      ;;
  esac

  set-window-title "no"
}


PR_TITLEBAR=''
set-window-title

add-zsh-hook precmd set-window-title
add-zsh-hook preexec set-cmd-title

