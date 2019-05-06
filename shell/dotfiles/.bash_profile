[[ -s ~/.bashrc ]] && source ~/.bashrc

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(rbenv init -)"

export PATH="$PATH:/Applications"
