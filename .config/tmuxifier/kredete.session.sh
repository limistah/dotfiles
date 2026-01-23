window_root "__DIR__"

if initialize_session "__SESSION_NAME__"; then

    # Create a new window inline within session layout definition.
    new_window "Editor"
    run_cmd "nvim __DIR__"

    # Create service window with default layout
    new_window "Service CLI"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session