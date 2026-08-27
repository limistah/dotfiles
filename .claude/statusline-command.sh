#!/bin/bash
# Claude Code status line - robbyrussell-inspired theme
# Shows: arrow, cwd, git branch/status, model, context usage, rate limits

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

RESET=$'\033[0m'
CYAN=$'\033[36m'
GREEN=$'\033[32m'
BOLD_GREEN=$'\033[1;32m'
RED=$'\033[31m'
YELLOW=$'\033[33m'
GRAY=$'\033[90m'

dir_display=$(basename "$cwd")

# Git segment: branch name colored red if dirty, green if clean
git_segment=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
  if [ -z "$branch" ]; then
    branch=$(git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  fi
  if [ -n "$(git -C "$cwd" --no-optional-locks status --porcelain 2>/dev/null)" ]; then
    git_color="$RED"
    dirty=" ✗"
  else
    git_color="$GREEN"
    dirty=" ✓"
  fi
  git_segment=" ${git_color}git:(${branch})${dirty}${RESET}"
fi

# Context window usage
context_segment=""
if [ -n "$used_pct" ]; then
  context_segment=$(printf " %sctx:%.0f%%%s" "$GRAY" "$used_pct" "$RESET")
fi

# Rate limit usage (5h / 7d)
rate_segment=""
if [ -n "$five" ] || [ -n "$week" ]; then
  rate_str=""
  if [ -n "$five" ]; then
    rate_str="5h:$(printf '%.0f' "$five")%"
  fi
  if [ -n "$week" ]; then
    [ -n "$rate_str" ] && rate_str="$rate_str "
    rate_str="${rate_str}7d:$(printf '%.0f' "$week")%"
  fi
  rate_segment=" ${YELLOW}${rate_str}${RESET}"
fi

model_segment=" ${GRAY}[${model}]${RESET}"

arrow="${BOLD_GREEN}➜${RESET}"
dir_colored="${CYAN}${dir_display}${RESET}"

printf "%s %s%s%s%s%s\n" "$arrow" "$dir_colored" "$git_segment" "$model_segment" "$context_segment" "$rate_segment"
