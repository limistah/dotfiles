# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/{{WINDOW_NAME}}"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "__WINDOW_NAME__"

# Run commands.
run_cmd "nvim"     # runs in active pane