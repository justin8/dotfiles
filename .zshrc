# Uncomment to enable profiling to debug startup time issues. Make sure to uncomment 'zprof' at the end of the file too
# zmodload zsh/zprof

# Enable bash completion (This doesn't seem to work? and is super slow)
#autoload bashcompinit && bashcompinit
#autoload -U +X compinit && compinit

# Source per-machine overrides
source ~/.sharedrc
source ~/.zshrc-addon

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.config/yadm/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="powerlevel10k/powerlevel10k" # Disabled as we're using starship now

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

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

if [[ ! -e /etc/redhat-release ]]; then
	plugin+=(zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh

# Increase history size
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# Export ZDOTDIR to allow sudo and keeping the same zsh dot files (still requires changing to zsh or having root's shell set to zsh)
export ZDOTDIR=$HOME

# Custom ZSH Completions
fpath=(~/.zsh-completion $fpath)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# Uncomment along with the first line to enable profiling of zsh startup
# zprof

