# Uncomment to enable profiling to debug startup time issues. Make sure to uncomment 'zprof' at the end of the file too
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

source ~/.sharedrc

# Source per-machine overrides
[[ -e $HOME/.zshrc-addon ]] && source ~/.zshrc-addon

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.config/yadm/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Disable additional calls to compinit
ZSH_DISABLE_COMPFIX="true"

# Disable magic functions like auto-escaping URLs when you paste them in the terminal (See https://github.com/ohmyzsh/ohmyzsh/issues/7632)
DISABLE_MAGIC_FUNCTIONS="true"


# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws direnv)

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        [ -e /etc/profile.d/vte.sh] && source /etc/profile.d/vte.sh
fi

source $ZSH/oh-my-zsh.sh

# Overwrite aliases defined in oh-my-zsh
alias ls='ls --color=auto' # It defaults to 'ls -G' which doesn't work on all zsh versions

# Configure history settings
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

# Export ZDOTDIR to allow sudo and keeping the same zsh dot files (still requires changing to zsh or having root's shell set to zsh)
export ZDOTDIR=$HOME


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
alias ls='ls --color=auto'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Configure fzf
[[ $- == *i* ]] && source "$HOME/.nix-profile/share/fzf/completion.zsh" 2> /dev/null
source "$HOME/.nix-profile/share/fzf/key-bindings.zsh"

# Set up mise for runtime management
eval "$(mise activate zsh)"

# if you wish to use IMDS set AWS_EC2_METADATA_DISABLED=false
export AWS_EC2_METADATA_DISABLED=true

# Custom ZSH Completions
fpath=(~/.nix-profile/share/zsh/site-functions $fpath)
[[ -e $HOME/.brazil_completion/zsh_completion ]] && source $HOME/.brazil_completion/zsh_completion

# Enable bash completion (This doesn't seem to work? and is super slow)
#autoload bashcompinit && bashcompinit

# On slow systems, checking the cached .zcompdump file to see if it must be 
# regenerated adds a noticable delay to zsh startup.  This little hack restricts 
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.
fpath=($fpath /usr/share/zsh/site-functions)
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit
else
	compinit -C
fi

############################################################################
# Some hacky shit to get compinit working in direnv/nix shells dynamically #
############################################################################
autoload -Uz compinit add-zsh-hook

# Store the original fpath before any direnv modifications
typeset -gA __direnv_saved_states
typeset -g __direnv_baseline_fpath
typeset -g __direnv_nix_fpaths=()

if [[ -z "$__direnv_baseline_fpath" ]]; then
  __direnv_baseline_fpath=("${fpath[@]}")
fi

# Helper: detect nix-related site-functions dirs in $PATH
function __direnv_collect_nix_completions() {
  local p compdir
  local collected=()
  for p in ${(s/:/)PATH}; do
    compdir="$p/../share/zsh/site-functions"
    if [[ -d $compdir ]]; then
      collected+=$compdir
    fi
  done
  echo $collected
}

# Apply the nix completions paths (add them to fpath, avoiding duplicates)
function __direnv_add_nix_fpaths() {
  local new_paths=("$@")
  local added=()

  for p in $new_paths; do
    if [[ ${fpath:#$p} == $fpath ]]; then
      fpath=($p $fpath)
      added+=$p
    fi
  done

  # Store added nix paths so we can remove them later
  __direnv_nix_fpaths=(${added[@]})
}

# Remove nix completions paths from fpath
function __direnv_remove_nix_fpaths() {
  local p
  for p in "${__direnv_nix_fpaths[@]}"; do
    fpath=(${fpath:#$p})
  done
  __direnv_nix_fpaths=()
}

# Detect if direnv is currently active with nix environment loaded
function __direnv_is_active() {
  # Heuristic: DIRENV_WATCHES is present and NIX_* variables set
  [[ -n "$DIRENV_WATCHES" ]] && return 0
  return 1
}

# Main precmd hook: detect direnv activation/deactivation
function __direnv_fpath_manager() {
  if __direnv_is_active; then
    # Direnv active: add nix completions paths if not already added
    if [[ -z "$__direnv_saved_states[active]" ]]; then
      # Save current baseline fpath just in case
      __direnv_baseline_fpath=("${fpath[@]}")
      local nix_paths=( $(__direnv_collect_nix_completions) )
      __direnv_add_nix_fpaths "${nix_paths[@]}"
      __direnv_saved_states[active]=1
      echo "[direnv] activated: added zsh completions for nix env"
      compinit -i
    fi
  else
    # Direnv inactive: remove nix completions paths if previously added
    if [[ -n "$__direnv_saved_states[active]" ]]; then
      __direnv_remove_nix_fpaths
      __direnv_saved_states[active]=""
      echo "[direnv] deactivated: removed nix completions"
      compinit -i
    fi
  fi
}

add-zsh-hook precmd __direnv_fpath_manager

#################################
# End hacky shit for direnv/nix #
#################################

# Fix for cline shell integration
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  . "$(code --locate-shell-integration-path zsh)"
fi

[[ -e $HOME/.zshrc-addon-late ]] && source ~/.zshrc-addon-late

# Uncomment along with the first line to enable profiling of zsh startup
# zprof

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
