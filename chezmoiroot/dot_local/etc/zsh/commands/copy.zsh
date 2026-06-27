function copy () {
  printf '\033]52;c;%s\a' "$(cat | base64 | tr -d '\n')"
}
