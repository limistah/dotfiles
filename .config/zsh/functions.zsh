function gacp() {
    git add .
    git commit -m "$1"
    git push
}

# creates a tmuxifier session using the directory name if none exists
function tmxg() {
    local session
    local dir
    local layout
    local template

    dir="$(pwd -P)"
    session="$(basename "$dir")"
    layout="$HOME/.tmuxifier/layouts/${session}.session.sh"
    template="$HOME/.config/tmuxifier/templates/default.session.sh"

    # Create layout if it doesn't exist
    if [[ ! -f "$layout" ]]; then
        sed "s|__DIR__|$dir|g" "$template" | sed "s|__SESSION_NAME__|$session|g" > "$layout"
    fi

    # Load and start the session
    tmxs "$session"
}