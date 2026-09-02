# Global instructions

## Never attribute a commit, PR, or issue to Claude/AI

Do not add `Co-Authored-By: Claude ...` (or any equivalent AI/Anthropic
attribution — "Generated with Claude Code", the 🤖 emoji line,
`noreply@anthropic.com`, etc.) to any commit message, PR description, or
issue/comment body, in any repo. Author fields stay the user's own identity.

This is enforced mechanically by a `PreToolUse` hook
(`~/.claude/hooks/block-ai-attribution.sh`, registered in this same
`settings.json`) that blocks `git commit`, `git push`, and
`gh pr/issue create|edit|comment` when attribution text is present — but
don't rely on the hook alone; don't generate the attribution in the first
place.
