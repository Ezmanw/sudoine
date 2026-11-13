# sudoine

Like a sardine in a tin: lets an AI run `sudo` commands without ever seeing your password.

```bash
sudoine enable [--timeout MIN]   # type your password once
sudoine apt install -y fastfetch # the AI runs this
sudoine status
sudoine disable                  # broker dies, password forgotten
```

The password lives only in a background broker's memory. Each command runs `sudo` in its own
pty, so many can run in parallel. The socket is `0600` in `$XDG_RUNTIME_DIR` and checks the
caller's uid. Commands get no stdin, so use non-interactive flags.

**Caveat:** while enabled, any process running as you can run root commands. Use `--timeout`
or `disable` when done.

## Install (also a Claude Code skill)

```bash
git clone https://github.com/Ezmanw/sudoine ~/.claude/skills/sudoine
~/.claude/skills/sudoine/install.sh
```

Requires Linux, Python 3 and sudo. No dependencies.
