# .bashrc

# Added by Kiro CLI
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="${PATH:+$PATH:}$HOME/.local/bin" ;; esac

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
. "$HOME/.cargo/env"

<<<<<<< Updated upstream
# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash"
||||||| Stash base
# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bashrc.post.bash"

# Added by AIM CLI
export PATH="$HOME/.aim/mcp-servers:$PATH"
=======

# Added by AIM CLI
export PATH="$HOME/.aim/mcp-servers:$PATH"
>>>>>>> Stashed changes
