function gacp() {
    git add .
    git commit -m "$1"
    git push
}

# start work here - creates a tmuxifier session using the directory name if none exists
# uses default.session.sh template for kredete projects, session.sh for others
function swh() {
    local dir="$(pwd -P)"
    local session="${dir##*/}"
    local layout="$HOME/.tmuxifier/layouts/${session}.session.sh"
    local template

    if [[ "$dir" == *"/Work/kredete"* ]]; then
        template="$HOME/.config/tmuxifier/kredete.session.sh"
    else
        template="$HOME/.config/tmuxifier/default.session.sh"
    fi

    # Create layout if it doesn't exist
    if [[ ! -f "$layout" ]]; then
        sed "s|__DIR__|$dir|g" "$template" | sed "s|__SESSION_NAME__|$session|g" > "$layout"
    fi

    # Load and start the session
    tmuxifier load-session "$session"
}

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
