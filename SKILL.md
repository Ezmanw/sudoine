---
name: sudoine
description: Run sudo/root commands (apt install, systemctl, editing /etc, etc.) through the sudoine broker without ever seeing the user's password. Use whenever a task needs root and `sudo` would prompt for a password.
---

# sudoine

`sudoine` lets you run commands as root. The user types their password once into a
background broker (`sudoine enable`); you never see it.

## Use

Prefix the command with `sudoine` instead of `sudo`:

```bash
sudoine apt install -y fastfetch
sudoine systemctl restart nginx
sudoine sh -c 'echo hi > /etc/motd'
```

- Each call gets its own background terminal, so you can run several in parallel.
- Exit code and working directory are preserved. Output is merged stdout+stderr.
- There is no stdin: always use non-interactive flags (`-y`, `--noconfirm`, ...).
- If it prints `sudoine: not enabled`, **ask the user to run `sudoine enable`** and wait.
  Never try to get or type the password yourself.
- Check with `sudoine status`. Do not run `sudoine disable` unless the user asks;
  tell them they can run it when done.
- If `sudoine` is not on PATH, run `~/.claude/skills/sudoine/sudoine`, or ask the user
  to run `~/.claude/skills/sudoine/install.sh`.
- Prefer the least privilege needed; avoid destructive root commands without confirming.
