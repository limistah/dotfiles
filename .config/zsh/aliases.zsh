alias python=python3

# work directory related aliases
alias work='cd $HOME/Library/Work'
alias config='cd $HOME/Library/Work/configs'

# Portfolio directory work related aliases
alias blog='cd $HOME/Library/Work/portfolio/limsitah.dev'

# MC2 Work Related aliases
alias mc2='cd $HOME/Library/Work/mcsquared/'
alias mc2m='cd $HOME/Library/Work/mcsquared/mc2.mono/'
alias mc2s='cd $HOME/Library/Work/mcsquared/mc2.service-mono/'

# Open Source related aliases
alias oss='cd $HOME/Library/Work/oss'
alias obsp='cd $HOME/Library/Work/obsp'

# editor related aliases
alias edcfg='nvim $HOME/Library/Work/configs/dotfiles'
alias edblog='nvim $HOME/Library/Work/portfolio/limsitah.dev'

alias clr='clear'
alias ex='exit'

alias krd='cd $HOME/Library/Work/kredete'

# command related aliases
alias lg='lazygit'
function gacp() {
    git add .
    git commit -m "$1"
    git push
}
