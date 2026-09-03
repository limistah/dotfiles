#!/bin/bash
# PostToolUse hook (matcher: Bash). After a `gh pr create` call, spawns a
# fully detached background watcher (poll-pr-ci.sh) that polls the resulting
# PR's CI checks and fires a macOS notification once they all reach a
# terminal state. Never blocks the session and never fails it: always exits
# 0, even when nothing matched or the watcher couldn't be started.
#
# Detection deliberately re-resolves the PR via `gh pr view` on the branch's
# own repo (see poll-pr-ci.sh) rather than parsing this command's stdout —
# the PostToolUse payload's tool_response shape isn't a stable contract to
# depend on, but "the current branch's PR" is always resolvable from cwd.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null)
CWD=$(echo "$INPUT" | jq -r '.cwd // empty' 2>/dev/null)

[ -z "$COMMAND" ] && exit 0

# Anchored to the start of the command or right after a shell operator, same
# convention as block-ai-attribution.sh's is_cmd — avoids firing on a command
# that merely mentions "gh pr create" in passing (an echo, a comment).
NORMALIZED=$(echo "$COMMAND" | tr '\n' ';')
if ! echo "$NORMALIZED" | grep -qE '(^|[;&|]) *gh +pr +create\b'; then
  exit 0
fi

[ -z "$CWD" ] && CWD="$PWD"

HOOK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG="$HOME/.claude/pr-ci-watch.log"
mkdir -p "$HOME/.claude" 2>/dev/null

# nohup + redirected fds + backgrounding is enough for the child to survive
# this hook process exiting — it gets reparented once the parent is gone.
# macOS has no setsid in the base install, so this is the portable path.
nohup bash "$HOOK_DIR/poll-pr-ci.sh" "$CWD" >> "$LOG" 2>&1 < /dev/null &

exit 0
