# History
  HISTORY_IGNORE='(bg|fg|cd*|rm*|clear|l[alsh]#( *)#|pwd|history|exit|make*|* --help|jrnl*|dnote*|nj*)' # hide common or private commands from history

  zshaddhistory() {
    emulate -L zsh
    ## uncomment if HISTORY_IGNORE
    ## should use EXTENDED_GLOB syntax
    setopt extendedglob
    [[ $1 != ${~HISTORY_IGNORE} ]]
  }
  HISTFILE=${ZDOTDIR:-${HOME}}/.zhistory
  HISTSIZE=99999
  SAVEHIST=99999

  setopt extended_history # record timestamp of command in HISTFILE
  setopt hist_ignore_all_dups # ignore duplicated commands history list
  setopt hist_expire_dups_first # delete dups first when reaching max history
  setopt completeinword   # save each commands beginning timestamp and the duration to the history file
  setopt hash_list_all  # save each commands beginning timestamp and the duration to the history file
  setopt inc_append_history     # add commands to HISTFILE in order of execution
  setopt share_history # share data between open sessions
  setopt hist_ignore_space      # ignore commands that start with space
  setopt hist_verify # Don't execute the command directly upon history expansion.
  # setopt hist_ignore_dups # Don't enter immediate duplicates into the history.
  # setopt hist_find_no_dups   # Don't display duplicates when searching the history.

# Terminal
  setopt auto_cd # Perform cd to a directory if the typed command is invalid, but is a directory.
  setopt auto_pushd # Make cd push the old directory to the directory stack.
  setopt pushd_ignore_dups # Don't push multiple copies of the same directory to the stack.
  setopt pushd_silent # Don't print the directory stack after pushd or popd.
  setopt pushd_to_home # Have pushd without arguments act like `pushd ${HOME}`.
  setopt extended_glob # Treat `#`, `~`, and `^` as patterns for filename globbing.
  unsetopt correct_all # disable auto correct

# Jobs
  setopt auto_resume # Resume an existing job before creating a new one.
  setopt long_list_jobs # List jobs in verbose format by default.
  setopt no_bg_nice # Prevent background jobs being given a lower priority.
  setopt no_hup # Prevent SIGHUP to jobs on shell exit.
  setopt no_check_jobs #Prevent reporting the status of background and suspended jobs before exiting a shell with job control.

# Input / Output
  setopt interactive_comments # Allow comments starting with `#` in the interactive shell.
  setopt no_clobber # Disallow `>` to overwrite existing files. Use `>|` or `>!` instead.


