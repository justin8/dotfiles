# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source per-machine overrides
source ~/.sharedrc
source ~/.zshrc-addon

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

##Font configuration. Copy this to .zshrc-addon and uncomment
#if [[ -z $SSH_TTY ]] && [[ $TERM != linux ]]; then
#	export IHAVEPATCHEDFONTS=1
#fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [ -z $IHAVEPATCHEDFONTS ]; then
	ZSH_THEME="lukerandall"
else
	ZSH_THEME="powerlevel10k/powerlevel10k"
fi

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search fabric gem)

if [[ ! -e /etc/redhat-release ]]; then
	plugin+=(zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh

# Quick dirs
setopt auto_cd
cdpath=($HOME/git)

# Export ZDOTDIR to allow sudo and keeping the same zsh dot files (still requires changing to zsh or having root's shell set to zsh)
export ZDOTDIR=$HOME

# Custom ZSH Completions
fpath=(~/.zsh-completion $fpath)
autoload -Uz compinit
today=$(date '+%s')
yesterday=$(($today - 60 * 60 * 24))
if [[ $(uname -s) == "Darwin" ]]; then
	zcomp_timestamp=$(stat -f '%Sm' -t '%s' ~/.zcompdump)
else
	zcomp_timestamp=$(stat -c '%Y' ~/.zcompdump)
fi

if [[ $zcomp_timestamp < $yesterday ]]; then
	compinit
else
	compinit -C
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh