# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ruby \
         archlinux \
         rails3 \
         debian \
         command-not-found \
         git \
         lein \
         gas \
         git-extras \
         dirpersist \
         dircycle \
         npm \
         github)

source $ZSH/oh-my-zsh.sh
#correction is annoying
unsetopt correct_all
setopt correct

# prevent > redirection to existing files without >!
setopt noclobber

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$HOME/bin:.

function gvim_background() {
  gvim $@ &
}

alias ls="ls -hF --color=auto"
alias vi=vim
alias v=gvim_background
export EDITOR=vim

alias ack=ack-grep
export JAVA_HOME=/usr/lib/jvm/default-java

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# 256 color support in gnome
# not sure how to conditionally enable it
export TERM="xterm-256color"

# install fasd for better completion
eval "$(fasd --init auto)"

# wrap git with hub
eval "$(hub alias -s)"
