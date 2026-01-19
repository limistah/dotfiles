window_root "__DIR__"

if initialize_session "__SESSION_NAME__"; then

    # Create a new window inline within session layout definition.
    new_window "editor"

    # Create service window with default layout
    new_window "service"
    run_cmd "nvim __DIR__"
    split_h 30
    select_pane 1
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session