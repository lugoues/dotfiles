
# MacOS
if [[ ${OSTYPE} == darwin* ]]; then
  op_sock="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
  if [ -S "${op_sock}" ]; then
    mkdir -p  ~/.local/share/1password
    ln -fs "${op_sock}"  ~/.local/share/1password/agent.sock

    export SSH_AUTH_SOCK=~/.local/share/1password/agent.sock
  fi

fi
