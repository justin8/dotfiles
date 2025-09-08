# .bashrc

# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

# Support for single-user nix environments if we're running in one
if [ -e /home/$USER/.nix-profile/etc/profile.d/nix.sh ]; then . /home/$USER/.nix-profile/etc/profile.d/nix.sh; fi

source ~/.sharedrc

# Configure fzf
[[ $- == *i* ]] && source "$HOME/.nix-profile/share/fzf/completion.zsh" 2>/dev/null
source "$HOME/.nix-profile/share/fzf/key-bindings.bash"

[[ -e $HOME/.brazil_completion/bash_completion ]] && source $HOME/.brazil_completion/bash_completion
#eval "$(mise activate bash)"

eval "$(direnv hook bash)"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path bash)"

# Extra manual completion files
[[ -e $HOME/.brazil_completion/bash_completion ]] && source $HOME/.brazil_completion/bash_completion
