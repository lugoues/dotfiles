typeset -U fpath # make paths unique
fpath=(
  $( (( ${+ELLIPSIS_PATH} )) && echo $ELLIPSIS_PATH/comp)
  $( (( $+command[brew] )) && echo $(brew --prefix)/share/zsh/site-functions)
  "~/.local/share/zsh/completions"
  $fpath
)
export FPATH

typeset -U path # make paths unique
path=(
  ~/.local/bin
  ~/.cargo/bin
  $( (( ${+ELLIPSIS_PATH} )) && echo $ELLIPSIS_PATH/bin)
  /usr/local/sbin
  /usr/local/bin
  $( (( $+commands[brew] )) && \
    brew_prefix=$(brew --prefix) && \
    echo  ${brew_prefix}/opt/*/libexec/gnubin \
          "${brew_prefix}/opt/curl/bin" \
          "${brew_prefix}/opt/openjdk/bin" \
          "${brew_prefix}/opt/openssl/bin")
  $( (( $+commands[dotnet] )) && echo "${HOME}/.dotnet/tools");
  "$( [ -d "/Applications/Visual Studio Code.app" ] && echo "/Applications/Visual Studio Code.app/Contents/Resources/app/bin")"

  $path
)
export PATH #export caps path - both matter in zsh
