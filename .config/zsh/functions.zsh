function gacp() {
    git add .
    git commit -m "$1"
    git push
}

# creates a tmuxifier session using the directory name if none exists
function tmx_microservice() {
    local session
    local dir
    local layout
    local template

    dir="$(pwd -P)"
    session="${dir##*/}"
    layout="$HOME/.tmuxifier/layouts/${session}.session.sh"
    template="$HOME/.config/tmuxifier/default.session.sh"

    # Create layout if it doesn't exist
    if [[ ! -f "$layout" ]]; then
        sed "s|__DIR__|$dir|g" "$template" | sed "s|__SESSION_NAME__|$session|g" > "$layout"
    fi

    # Load and start the session
    tmxs "$session"
}

function tmx_generic() {
    local session
    local dir
    local layout
    local template

    echo $PATH

    dir="$(pwd -P)"
    session="${dir##*/}"
    layout="$HOME/.tmuxifier/layouts/${session}.session.sh"
    template="$HOME/.config/tmuxifier/session.sh"

    # Create layout if it doesn't exist
    if [[ ! -f "$layout" ]]; then
        sed "s|__DIR__|$dir|g" "$template" | sed "s|__SESSION_NAME__|$session|g" > "$layout"
    fi

    # Load and start the session
    tmxs "$session"
}

# takes a path, cd to the path and runs tmxg in the path
# this would be a typical flow for opening work.
# if path is has work/kredete, use tmx_microservice else use tmx generic
function tmx_work() {
    local p="$1"
    echo $1
    if [[ -z "$path" ]]; then
        echo "Usage: tmx_work <path>"
        return 1
    fi

    cd "$p" || return 1

    if [[ "$p" == *"/Work/kredete"* ]]; then
        tmx_microservice
    else
        tmx_generic
    fi
}