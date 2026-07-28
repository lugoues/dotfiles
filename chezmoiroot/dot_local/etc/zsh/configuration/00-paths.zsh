typeset -U fpath # make paths unique
fpath=(
  $( (( $+commands[brew] )) && echo $(brew --prefix)/share/zsh/site-functions)
  ~/.local/share/zsh/completions
  ~/.local/share/zsh/functions
  $fpath
)
export FPATH

typeset -U path # make paths unique
path=(
  ~/.local/bin
  ~/.cargo/bin
  /usr/local/sbin
  /usr/local/bin
  $( (( $+commands[brew] )) && \
    brew_prefix=$(brew --prefix) && \
    echo  ${brew_prefix}/opt/*/libexec/gnubin \
          "${brew_prefix}/opt/curl/bin" \
          "${brew_prefix}/opt/openjdk/bin" \
          "${brew_prefix}/opt/openssl/bin")
  $path
)
export PATH #export caps path - both matter in zsh