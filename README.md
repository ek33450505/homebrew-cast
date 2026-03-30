# homebrew-cast

Homebrew tap for [CAST — Claude Agent Specialist Team](https://github.com/ek33450505/claude-agent-team).

## Install

```bash
brew tap ek33450505/cast
brew install cast
```

Then set up the full framework into `~/.claude/`:

```bash
bash $(brew --prefix cast)/libexec/install.sh
```

## Usage

```bash
cast status     # health dashboard
cast doctor     # validate your setup
cast --help     # full command reference
```

## More

Full docs: [github.com/ek33450505/claude-agent-team](https://github.com/ek33450505/claude-agent-team)
