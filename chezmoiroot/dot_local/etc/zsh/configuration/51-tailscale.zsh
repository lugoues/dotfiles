if [[ ${OSTYPE} == darwin* ]]; then
  tailscale_bin="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
  if [ -f ${tailscale_bin} ]; then
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
  fi
fi
