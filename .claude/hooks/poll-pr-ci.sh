#!/bin/bash
# Detached watcher spawned by watch-pr-ci-on-create.sh (never run directly by
# a hook's own PostToolUse call — it backgrounds this immediately and moves
# on). Polls the PR associated with the current branch in the given working
# directory until every non-skipped check reaches a terminal state, then
# fires one macOS notification (pass or fail) and logs the outcome.
#
# Notify-only, deliberately: this does not attempt to fix a failure itself.
# Self-terminates after MAX_MINUTES if CI never finishes, so a hung run
# doesn't leave a watcher polling forever.

CWD="$1"
POLL_INTERVAL=30
MAX_MINUTES=60

[ -z "$CWD" ] && exit 0
cd "$CWD" 2>/dev/null || exit 0

# Resolves the PR for the CURRENT branch. If `gh pr create` failed (no PR
# exists for this branch) there is nothing to watch, and this exits quietly.
PR_INFO=$(gh pr view --json number,url 2>/dev/null)
[ -z "$PR_INFO" ] && exit 0

PR_NUM=$(echo "$PR_INFO" | jq -r '.number // empty')
PR_URL=$(echo "$PR_INFO" | jq -r '.url // empty')
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner 2>/dev/null)
[ -z "$PR_NUM" ] || [ -z "$REPO" ] && exit 0

LOG="$HOME/.claude/pr-ci-watch.log"
ts() { date '+%Y-%m-%d %H:%M:%S'; }

ELAPSED=0
while [ "$ELAPSED" -lt $((MAX_MINUTES * 60)) ]; do
  CHECKS=$(gh pr checks "$PR_NUM" -R "$REPO" --json name,bucket 2>/dev/null)
  if [ -n "$CHECKS" ]; then
    PENDING=$(echo "$CHECKS" | jq '[.[] | select(.bucket=="pending")] | length' 2>/dev/null)
    if [ "$PENDING" = "0" ]; then
      FAILED_NAMES=$(echo "$CHECKS" | jq -r '[.[] | select(.bucket=="fail") | .name] | join(", ")' 2>/dev/null)
      if [ -n "$FAILED_NAMES" ]; then
        osascript -e "display notification \"$FAILED_NAMES\" with title \"CI failed \xE2\x80\x94 $REPO #$PR_NUM\" sound name \"Basso\"" 2>/dev/null
        echo "$(ts) FAIL $REPO #$PR_NUM: $FAILED_NAMES ($PR_URL)" >> "$LOG"
      else
        osascript -e "display notification \"All checks passed\" with title \"CI passed \xE2\x80\x94 $REPO #$PR_NUM\" sound name \"Glass\"" 2>/dev/null
        echo "$(ts) PASS $REPO #$PR_NUM ($PR_URL)" >> "$LOG"
      fi
      exit 0
    fi
  fi
  sleep "$POLL_INTERVAL"
  ELAPSED=$((ELAPSED + POLL_INTERVAL))
done

echo "$(ts) TIMEOUT watching $REPO #$PR_NUM after ${MAX_MINUTES}m ($PR_URL)" >> "$LOG"
exit 0
