# .bashrc

# Source global definitions
if [[ -f /etc/bashrc ]]; then
  . /etc/bashrc
fi

source ~/.sharedrc

# Cool prompt and shit
git_prompt=/usr/share/git-core/contrib/completion/git-prompt.sh
if [[ -e $git_prompt ]]; then
  source $git_prompt
  export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
fi

# Configure fzf
[[ $- == *i* ]] && source "$HOME/.nix-profile/share/fzf/completion.zsh" 2>/dev/null
source "$HOME/.nix-profile/share/fzf/key-bindings.zsh"

eval "$(mise activate bash)"
