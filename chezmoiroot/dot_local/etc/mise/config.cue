settings: {
	experimental: true
	npm: bun:  true
	pipx: uvx: true
	auto_install:      true
	exec_auto_install: true
	jobs:              8
	idiomatic_version_file_enable_tools: []
	lockfile:          true
	use_versions_host: false
	disable_backends: ["asdf", "gem", "vfox"]
	unix_default_file_shell_args:        "zsh -c -o errexit"
	unix_default_inline_shell_args:      "zsh -c -o errexit"
	use_file_shell_for_executable_tasks: true
}

env: {
	"_ZO_DATA_DIR":     "{{ env.HOME }}/.local/share/zoxide"
	BAT_CONFIG_PATH:    "{{ env.HOME }}/.local/etc/bat.conf"
	ZELLIJ_CONFIG_DIR:  "{{ env.HOME }}/.local/etc/zellij"
	ATUIN_CONFIG_DIR:   "{{ env.HOME }}/.local/etc/atuin"
	STARSHIP_CONFIG:    "{{ env.HOME }}/.local/etc/starship/config.toml"
	SHELDON_CONFIG_DIR: "{{ env.HOME }}/.local/etc/sheldon"
  GOPASS_CONFIG:      "{{ env.HOME }}/.local/etc/gopass/config.yaml"
}

tools: {
	"aqua:1password/cli": {
		version: "v2.31.1"
		postinstall: ##"""
			  _zsh_cache_completion op \
					op completion zsh;
			"""##
	}
	"aqua:99designs/aws-vault": "latest"
	"aqua:ajeetdsouza/zoxide": {
		version: "latest"
		postinstall: ##"""
				_zsh_cache_init zoxide \
					zoxide init zsh;
			"""##
	}
	"aqua:antonmedv/fx": "latest"
	"aqua:astral-sh/uv": {
		version: "latest"
		postinstall: ##"""
				_zsh_cache_completion uv \
					uv --generate-shell-completion zsh;
			"""##
	}
	"aqua:atuinsh/atuin": {
		version:     "latest"
		postinstall: ##"""
      _zsh_cache_init atuin \
        atuin init zsh --disable-up-arrow;
      _zsh_cache_completion atuin \
        atuin gen-completions --shell zsh;
    """##
	}
	"aqua:aws/aws-cli":          "latest"
	"aqua:BurntSushi/ripgrep":   {
    version:  "latest"
    postinstall: ##"""
      _zsh_cache_completion rg \
        rg --generate complete-zsh
    """##
  }
	"aqua:charmbracelet/crush":  {
    version: "latest"
    postinstall: ##"""
      _zsh_cache_completion crush \
        crush completion zsh;
    """##
  }
	"aqua:charmbracelet/freeze": "latest"
	"aqua:charmbracelet/glow": {
    version: "latest"
//    postinstall: ##"""
//      _zsh_cache_completion glow \
//        glow complestion zsh;
//    """##
  }
	"aqua:charmbracelet/skate":  "latest"
	"aqua:ClementTsang/bottom":  "latest"
	"aqua:dandavison/delta": {
		version:     "latest"
		postinstall: ##"""
      _zsh_cache_completion delta \
        delta --generate-completion zsh;
    """##
	}
	"aqua:denisidoro/navi": {
		version:     "2.23.0"
		postinstall: ##"""
      _zsh_cache_init navi \
        navi widget zsh;
    """##
	}
	"aqua:direnv/direnv":       "latest"
	"aqua:ducaale/xh":          "latest"
	"aqua:dylanaraps/neofetch": "latest"
	"aqua:FiloSottile/mkcert":  "latest"
	"aqua:ip7z/7zip":           "latest"
	"aqua:jdx/mise": {
		version:     "latest"
		postinstall: ##"""
      mise plugins update --yes;
      _zsh_cache_completion mise \
        mise completion zsh;
    """##
	}
	"aqua:jj-vcs/jj":  {
    version: "latest"
    postinstall: ##"""
      _zsh_cache_completion jj \
        jj util completion zsh;
    """##
  }
	"aqua:jqlang/jq":            "latest"
	"aqua:junegunn/fzf":         "latest"
	"aqua:Lifailon/lazyjournal": "latest"
	"aqua:mikefarah/yq":         "latest"
	"aqua:mr-karan/doggo": {
    version: "latest"
    postinstall: ##"""
      _zsh_cache_completion doggo \
        doggo completions zsh;
    """##
  }
	"aqua:neovim/neovim":        "latest"
	"aqua:oven-sh/bun":          "latest"
	"aqua:pypa/pipx":            "latest"
	"aqua:rossmacarthur/sheldon": {
		version:     "latest"
		postinstall: ##"""
      _zsh_cache_completion sheldon \
        sheldon completions --shell zsh;
    """##
	}
	"aqua:sachaos/viddy": "latest"
	"aqua:sharkdp/bat": {
		version:     "latest"
		postinstall: ##"""
      _zsh_cache_completion bat \
        bat --completion zsh;
    """##
	}
	"aqua:sharkdp/fd": {
    version:    "latest"
//    postinstall: ##"""
//      echo ${MISE_TOOL_INSTALL_PATH};
//      cp ${MISE_TOOL_INSTALL_PATH}/autocomplete/_fd ~/.local/share/zsh/completion/;
//    """##
  }
	"aqua:sharkdp/vivid": version: "latest"
	"aqua:showwin/speedtest-go": "latest"
	"aqua:sigstore/cosign":      "latest"
	"aqua:sxyazi/yazi":          "latest"
	"aqua:txn2/kubefwd":         "latest"
	"aqua:wagoodman/dive":       "latest"
	"aqua:zellij-org/zellij":    "latest"
	"bun":                       "latest"
  "rust":                      "latest"
	"cargo-binstall":            "latest"
	"cargo:broot":               "latest"
	"cargo:du-dust":             "latest"
	"cargo:eza":                 "latest"
	"cargo":                     "latest"
	"npm:@withgraphite/graphite-cli": {
		version:     "latest"
		postinstall: ##"""
      _zsh_cache_completion gt \
        gt completion;
    """##
	}
	"node":                   "latest"
	"pipx:nicolargo/glances": "latest"
	"ubi:tstack/lnav":        "v0.13.0"
  "aqua:getsops/sops":      "latest"
  "aqua:FiloSottile/age":   "latest"
  "aqua:gopasspw/gopass":   "latest"
  "aqua:tailscale/tailscale": "latest"
}
