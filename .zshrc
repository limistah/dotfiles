# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/limistah/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" )

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  gitignore
  emoji
  docker
  aws
  colored-man-pages
  laravel5
  node
  nvm
  npm
  redis-cli
  sudo
  ubuntu
  vscode
  yarn
  python
  pylint
  history
  go
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Dating Kinky Dir Locations
alias dk='cd ~/dk'
alias dkadmin='cd ~/dk/admin.datingkinky.com'
alias dkapi='cd ~/dk/api.datingkinky.com'
alias dkemails='cd ~/dk/emails.datingkinky.com'
alias dkweb='cd ~/dk/www.datingkinky.com'
alias dkdocs='cd ~/dk/docs.datingkinky.com'
alias dkmobile='cd ~/dk/mobile.datingkinky.com'

# Dating Kinky Command Line actions

# Start DK API Project
alias dkapis='dkapi && npms'
# Install the API project dependicies
alias dkapii='dkapi && npmi'
# Install the API project dependicies
alias dkapid='dkapi && npmd'
# Seed dk  api project dummy data
alias dkapiseed='dkapi && node seed.js'
# Run test
alias dkapit='dkapi && npm run test'
# Run test in watch
alias dkapitw='dkapi && npm run test:watch'
# Start DK Web Project
alias dkwebs='dkweb && npms'
# Run DK web project in development mode
alias dkwebd='dkweb && npmd'
# Install the web project dependicies
alias dkwebi='dkweb && npmi'
# Start DK Web Project
alias dkadmins='dkadmin && npms'
# Run DK web project in development mode
alias dkadmind='dkadmin && npmd'
# Install the web project dependicies
alias dkadmini='dkadmin && npmi'
# Just build the docs
alias dkdocsb='dkdocs && npmb'
# Build and push DK docs
alias dkdocsp='dkdocsb && npmp'
# SSH into datingkinky Live Server
alias dklive='ssh ubuntu@18.204.62.243'
alias dkstaging='ssh ubuntu@18.215.107.52'
alias dkdump="mongodump --host Cluster0-shard-0/cluster0-shard-00-00-vwlw3.mongodb.net:27017,cluster0-shard-00-01-vwlw3.mongodb.net:27017,cluster0-shard-00-02-vwlw3.mongodb.net:27017 --ssl --username dk --password  R3OWmG8usiuhwS3"

## Personal
alias personal='cd ~/Personal'


# General stuffs that we do
alias des='cd ~/Desktop'
alias down='cd ~/Downloads'
alias home='cd ~'

## Git stuffs
alias gp='git push'
alias gf='git fetch --all'
alias gpl='git pull'
alias ga='git add *'
alias gr='git reset --hard'


## NPM stuffs
alias npmi='pnpm install'
alias npmu='pnpm update'
alias npms='pnpm start'
alias npmb='pnpm run build'
alias npmd='pnpm run dev'
alias npmc='pnpm cache clean --force'
alias npmu='pnpm update npm'
alias npmtw='pnpm run test:watch'


## MACHINE
alias ex="exit"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias gitconfig='git config --global user.name "Aleem Isiaka" && git config --global user.email aleemisiaka@gmail.com'
alias editzsh='subl ~/.zshrc'
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
alias netmon='sudo nethogs'
alias cal="zenity --calendar"