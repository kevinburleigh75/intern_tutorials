##
## Add custom paths
##

PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH=$PATH:/Users/burleigh/bin
#PATH=$PATH:/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin
PATH=$PATH:/Applications/Sublime\ Text.app/Contents/SharedSupport/bin
PATH=$PATH:~/Library/Python/3.5/bin

##
## Misc environment update
##

# fix the shell's encoding: https://github.com/cucumber/gherkin
export LC_CTYPE=en_US.UTF-8
#export LC_CTYPE=C

##
## Aliases
##
alias ss='source ~/.bashrc'
alias kdiff3='/Applications/kdiff3.app/Contents/MacOS/kdiff3 >& /dev/null'

alias parrot='ssh 50.116.31.239'

# alias mailcatcher='/Users/burleigh/.gem/.rvm/gems/ruby-1.9.3-p194/gems/mailcatcher-0.5.12/bin/mailcatcher'
# alias mailcatcher='/Users/burleigh/.rvm/gems/ruby-1.9.3-p194/bin/mailcatcher'

alias gitdt="git difftool --no-prompt -t kdiff3"
alias gitdtc="gitdt --cached"
alias gitmr="git merge --no-commit --no-ff"

##
## Set the prompt to be the output of ~/bin/prompt.pl
##

PS1='$(/Users/burleigh/bin/prompt.pl)'

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/Applications/kdiff3.app/Contents/MacOS
PATH=$PATH:/opt/local/bin

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## Stuff for deployment
export WORKON_HOME=~/.environments
source /usr/local/bin/virtualenvwrapper.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1

export JAVA_HOME=$(/usr/libexec/java_home)

## Stuff for AWS CLI autocompletion
complete -C '/Users/burleigh/analysis/160925_awsCli/kenv/bin/aws_completer' aws
export PATH=/usr/local/aws/bin:$PATH

## python vtk per: http://www.vtk.org/Wiki/VTK/Tutorials/PythonEnvironmentSetup
# export PYTHONPATH=/home/doriad/bin/VTK/lib:/home/doriad/bin/VTK/lib/site-packages:/home/doriad/bin/VTK/Wrapping/Python:$PYTHONPATH

umask 0022

