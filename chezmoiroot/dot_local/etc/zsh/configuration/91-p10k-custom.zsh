# typeset -g POWERLEVEL9K_MODE=compatible
local italics=`tput sitm`
local italics_off=`tput ritm`


  # The list of segments shown on the right. Fill it with less important segments.
  # Right prompt on the last prompt line (where you are typing your commands) gets
  # automatically hidden when the input line reaches it. Right prompt above the
  # last prompt line gets hidden if it would overlap with left prompt.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    # =========================[ Line #1 ]=========================
    status                  # exit code of the last command
    command_execution_time  # duration of the last command
    background_jobs         # presence of background jobs
    asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
    virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
    anaconda                # conda environment (https://conda.io/)
    pyenv                   # python environment (https://github.com/pyenv/pyenv)
    goenv                   # go environment (https://github.com/syndbg/goenv)
    nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
    nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
    nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
    # node_version          # node.js version
    # go_version            # go version (https://golang.org)
    # rust_version          # rustc version (https://www.rust-lang.org)
    # dotnet_version        # .NET version (https://dotnet.microsoft.com)
    # php_version           # php version (https://www.php.net/)
    # laravel_version       # laravel php framework version (https://laravel.com/)
    # java_version          # java version (https://www.java.com/)
    # package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
    rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
    rvm                     # ruby version from rvm (https://rvm.io)
    fvm                     # flutter version management (https://github.com/leoafarias/fvm)
    luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
    jenv                    # java version from jenv (https://github.com/jenv/jenv)
    plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
    phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
    scalaenv                # scala version from scalaenv (https://github.com/scalaenv/scalaenv)
    haskell_stack           # haskell version from stack (https://haskellstack.org/)
    kubecontext             # current kubernetes context (https://kubernetes.io/)
    terraform               # terraform workspace (https://www.terraform.io)
    aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
    aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
    azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
    gcloud                  # google cloud cli account and project (https://cloud.google.com/)
    google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
    context                 # user@hostname
    nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
    ranger                  # ranger shell (https://github.com/ranger/ranger)
    nnn                     # nnn shell (https://github.com/jarun/nnn)
    xplr                    # xplr shell (https://github.com/sayanarijit/xplr)
    vim_shell               # vim shell indicator (:sh)
    midnight_commander      # midnight commander shell (https://midnight-commander.org/)
    nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
    # vpn_ip                # virtual private network indicator
    # load                  # CPU load
    # disk_usage            # disk usage
    # ram                   # free RAM
    # swap                  # used swap
    todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
    timewarrior             # timewarrior tracking status (https://timewarrior.net/)
    taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
    # time                  # current time
    direnv                  # direnv status (https://direnv.net/)
    # =========================[ Line #2 ]=========================
    newline
    # ip                    # ip address and bandwidth usage for a specified network interface
    # public_ip             # public IP address
    # proxy                 # system-wide http/https/ftp proxy
    # battery               # internal battery
    # wifi                  # wifi speed
    # example               # example user-defined segment (see prompt_example function below)
  )


  ################################[ prompt_char: prompt symbol ]################################
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND='#b48ead'
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND='#bf616a'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='λ'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='Ⅴ'

##################################[ dir: current directory ]##################################
typeset -g POWERLEVEL9K_DIR_FOREGROUND=#5e81ac #067 #31
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=#4c566a #059 #103
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=#81a1c1  #067 #39

#####################################[ vcs: git status ]######################################
function my_git_formatter() {
  emulate -L zsh

  if [[ -n $P9K_CONTENT ]]; then
    # If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
    # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
    typeset -g my_git_format=$P9K_CONTENT
    return
  fi

  local italics=`tput sitm`
  local italics_off=`tput ritm`
  local grey='%F{#616161}'

  if (( $1 )); then
    # Styling for up-to-date Git status.
    local       meta='%f'     # default foreground
    local      clean='%F{#8fbcbb}'   # green foreground
    local   modified='%F{#ebcb8b}'  # yellow foreground
    local  untracked='%F{#b48ead}'   # blue foreground
    local conflicted='%F{#bf616a}'  # red foreground
  else
    # Styling for incomplete and stale Git status.
    local       meta='%F{#4C566A}'  # grey foreground
    local      clean='%F{#4C566A}'  # grey foreground
    local   modified='%F{#4C566A}'  # grey foreground
    local  untracked='%F{#4C566A}'  # grey foreground
    local conflicted='%F{#4C566A}'  # grey foreground
  fi

  local res

  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
    # If local branch name is at most 32 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    # Tip: To always show local branch name in full without truncation, delete the next line.
    (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
    res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${italics}${branch//\%/%%}${italics_off}"
  fi

  if [[ -n $VCS_STATUS_TAG
        # Show tag only if not on a branch.
        # Tip: To always show tag, delete the next line.
        && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
      ]]; then
    local tag=${(V)VCS_STATUS_TAG}
    # If tag name is at most 32 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    # Tip: To always show tag name in full without truncation, delete the next line.
    (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
    res+="${meta}#${clean}${tag//\%/%%}"
  fi

  # Display the current Git commit if there is no branch and no tag.
  # Tip: To always display the current Git commit, delete the next line.
  [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- this line
    res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

  # Show tracking branch name if it differs from local branch.
  if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
    res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
  fi

  # Display "wip" if the latest commit's summary contains "wip" or "WIP".
  if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
    res+=" ${modified}wip"
  fi

  # ⇣42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}%B⇣%b${grey}${VCS_STATUS_COMMITS_BEHIND}"
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && res+=" ${clean}%B⇡%b${grey}${VCS_STATUS_COMMITS_AHEAD}"
  # ⇠42 if behind the push remote.
  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
  # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${grey}${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}%B~%b${grey}${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}%B+%b${grey}${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}%B!%b${grey}${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
  # Remove the next line if you don't want to see untracked files at all.
  (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}%B${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}%b${grey}${VCS_STATUS_NUM_UNTRACKED}"
  # "─" if the number of unstaged files is unknown. This can happen due to
  # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (see below) being set to a non-negative number lower
  # than the number of files in the Git index, or due to bash.showDirtyState being set to false
  # in the repository config. The number of staged and untracked files may also be unknown
  # in this case.
  (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

  typeset -g my_git_format=$res
}
functions -M my_git_formatter 2>/dev/null

##########################[ status: exit code of the last command ]###########################
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND='#a3be8c'
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND='#a3be8c'
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND='#BF616A'
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND='#bf616a'
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND='#bf616a'

#######################[ background_jobs: presence of background jobs ]#######################
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='#a3be8c'

##################################[ disk_usgae: disk usage ]##################################
typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND='#bf616a'

##################################[ context: user@hostname ]##################################
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='#d08770'
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND='#ebcb8b'
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND='#ebcb8b'
typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE="${italics}%B%n@%m${italics_off}"
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE="${italics}%n@%m${italics_off}"
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE="${italics}%n@%m${italics_off}"

typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND='#8fbcbb'

################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
typeset -g POWERLEVEL9K_PYENV_FOREGROUND='#8fbcbb'

typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND='#8fbcbb'
typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION=''

################[ goenv: go environment (https://github.com/syndbg/goenv) ]################
typeset -g POWERLEVEL9K_GOENV_FOREGROUND='#8fbcbb'

##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
typeset -g POWERLEVEL9K_NVM_FOREGROUND='#a3be8c'

##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
typeset -g POWERLEVEL9K_NODENV_FOREGROUND='#a3be8c'

##############[ nvm: node.js version from nvm (https://github.com/nvm-sh/nvm) ]###############
typeset -g POWERLEVEL9K_NVM_FOREGROUND='#a3be8c'

#######################[ go_version: go version (https://golang.org) ]########################
typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND='#8fbcbb'

#################[ rust_version: rustc version (https://www.rust-lang.org) ]##################
typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND='#8fbcbb'

###############[ dotnet_version: .NET version (https://dotnet.microsoft.com) ]################
typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND='#b48ead'

##########[ luaenv: lua version from luaenv (https://github.com/cehoffman/luaenv) ]###########
typeset -g POWERLEVEL9K_LUAENV_FOREGROUND='#81a1c1'

###############[ jenv: java version from jenv (https://github.com/jenv/jenv) ]################
typeset -g POWERLEVEL9K_JENV_FOREGROUND='#81a1c1'

#############[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#############
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND='#b48ead'
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='ﴱ'
unset POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND # Unset to always show k8s context 

################[ terraform: terraform workspace (https://www.terraform.io) ]#################
typeset -g POWERLEVEL9K_TERRAFORM_DEFAULT_FOREGROUND='#88c0d0'

#[ aws: aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) ]#
typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND='#d08770'
# typeset -g POWERLEVEL9K_AWS_PROD_CONTENT_EXPANSION='> ${P9K_CONTENT} <'

##########[ gcloud: google cloud account and project (https://cloud.google.com/) ]###########
typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND='#81a1c1'
