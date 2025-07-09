# .bashrc

# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Support for single-user nix environments if we're running in one
if [ -e /home/$USER/.nix-profile/etc/profile.d/nix.sh ]; then . /home/$USER/.nix-profile/etc/profile.d/nix.sh; fi

source ~/.sharedrc

# Cool prompt and shit
git_prompt=/usr/share/git-core/contrib/completion/git-prompt.sh
if [[ -e $git_prompt ]]; then
  source $git_prompt
  export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
fi

# Configure fzf
[[ $- == *i* ]] && source "$HOME/.nix-profile/share/fzf/completion.zsh" 2>/dev/null
source "$HOME/.nix-profile/share/fzf/key-bindings.bash"

[[ -e $HOME/.brazil_completion/bash_completion ]] && source $HOME/.brazil_completion/bash_completion
#eval "$(mise activate bash)"

eval "$(direnv hook bash)"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path bash)"
