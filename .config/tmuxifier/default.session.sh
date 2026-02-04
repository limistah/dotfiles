window_root "__DIR__"

if initialize_session "__SESSION_NAME__"; then

  # Create a new window inline within session layout definition.
  new_window "Editor"
  run_cmd "nvim __DIR__"

  new_window "Opencode AI"
  run_cmd "opencode" --port

  # Create service window with default layout
  new_window "CLI"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

