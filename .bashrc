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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(~/.local/bin/mise activate bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

