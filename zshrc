# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

export DEFAULT_USER=jpouliot

# Path to your oh-my-zsh installation.
export ZSH="/home/$DEFAULT_USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Set command history size
SAVEHIST=20000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  git
  gradle-completion
  vi-mode
  aws
  oc
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
#zstyle ':completion:*' format '%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/jpouliot/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Setup SSH Agent
if [ -f ~/.ssh/agent.env ] ; then
    . ~/.ssh/agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        echo "Stale agent file found. Spawning new agent… "
        eval `ssh-agent | tee ~/.ssh/agent.env`
        ssh-add
    fi
else
    echo "Starting ssh-agent"
    eval `ssh-agent | tee ~/.ssh/agent.env`
    ssh-add
fi

### My personal config

export EDITOR=vim

alias zrc="vim ~/.zshrc"
alias src="source ~/.zshrc"

alias i3config="vim ~/.config/i3/config"

alias ll="ls -lv --time-style=long-iso --group-directories-first"
alias la="ll -A"

alias now='date "+%Y-%m-%d %T"'
alias utc='now -u'

alias dollar_prompt="export PS1='%n@%m:%1~ %(!.#.$) '"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alt+. to insert last word from previous command
bindkey "^[." insert-last-word

# Setup directory stacks
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'

### Triton-laptop-specific

# Multi-monitor stuff

LEFT_MONITOR="DP-1.1"
CENTER_MONITOR="DP-1.2"
LAPTOP_MONITOR="DP-0"

alias monitors_one="xrandr \
	--output $LEFT_MONITOR --off \
	--output $CENTER_MONITOR --primary --auto \
	--output $LAPTOP_MONITOR --off"

alias monitors_all="xrandr \
	--output $LEFT_MONITOR --auto \
	--output $CENTER_MONITOR --primary --auto --right-of $LEFT_MONITOR \
	--output $LAPTOP_MONITOR --auto --right-of $CENTER_MONITOR"

alias monitors_laptop="xrandr \
	--output $LEFT_MONITOR --off \
	--output $CENTER_MONITOR --off \
	--output $LAPTOP_MONITOR --primary --auto"

# Sennheiser GSX 1200 Pro
alias set_sennheiser_default_sink='pactl set-default-sink alsa_output.usb-Sennheiser_GSX_1200_Pro_Main_Audio_5698810417005161-00.analog-output-surround71'

clone () { git clone git@bitbucket.org:scripps-tritondigital/$1.git }

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
