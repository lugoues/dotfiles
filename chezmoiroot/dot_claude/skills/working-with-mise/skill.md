Working with mise
Overview

mise is a polyglot tool version manager. Use this skill when:

    Adding tools to a project via mise
    Troubleshooting "command not found" when mise should have tools available
    Deciding whether mise is the right choice for a dependency

The Iron Rules

    Use mise use to add tools - never manually edit config files
    Detect existing config files first - don't create new ones when one exists
    Fix the shell, don't workaround - if tools aren't on PATH, diagnose the activation issue rather than using mise exec as a permanent workaround

When to Use mise vs Alternatives
Use mise when version matters per-project

Tools where different projects need different versions:

    Language runtimes: node, python, ruby, go, rust
    Infrastructure tools: terraform, kubectl, helm
    Tools with breaking changes between versions

# Good mise candidates - version sensitivity
mise use node@20      # Projects may need different Node versions
mise use terraform@1.5  # IaC often pins specific versions
mise use ruby@3.2     # Gemfiles often require specific Ruby

Use Homebrew/system when version rarely matters

Stable CLIs with consistent interfaces across versions:

    jq, yq - query languages are stable
    gh, hub - GitHub CLI
    ripgrep, fd - search tools
    tree, htop - system utilities

# Better as Homebrew - version doesn't matter
brew install jq gh ripgrep

Decision checklist

Ask yourself:

    Does this project's README/docs specify a version? → mise
    Could different team members need different versions? → mise
    Does the tool have breaking changes between versions? → mise
    Is it a stable CLI you use the same way everywhere? → Homebrew

Adding Tools with mise
1. Check for existing config files first

Before adding tools, detect what config format the project uses:

# Check for existing mise config
ls -la mise.toml .mise.toml .mise.local.toml .tool-versions 2>/dev/null

Config file precedence (mise uses the first it finds):

    mise.toml or .mise.toml - standard mise config
    .mise.local.toml - local overrides (usually gitignored)
    .tool-versions - legacy asdf format

If a config file exists, use that format. Don't create a new one.
2. Use mise use to add tools

Always use the CLI - it validates the tool exists and works:

# Add to project config (mise.toml or existing format)
mise use node@20

# Add to global config (~/.config/mise/config.toml)
mise use -g python@3.12

# Dry run to see what would happen
mise use --dry-run terraform@1.5

Never manually edit config files - mise use ensures:

    The tool/version exists in the registry
    The tool installs correctly
    The config syntax is valid

3. Verify the tool is available

# Check mise sees the tool
mise ls

# Check the tool is on PATH
which node
node --version

# Compare with mise's view
mise which node

Troubleshooting "Command Not Found"

When a tool should be available but isn't found:
Diagnostic workflow

# 1. Check mise installation health
mise doctor

# 2. Check what tools mise knows about
mise ls                    # All installed tools
mise ls --current          # Tools for current directory

# 3. Compare which vs mise which
which node                 # What shell finds
mise which node            # What mise thinks it should be

# 4. Check if tool would work via mise exec
mise exec -- node --version  # If this works, it's an activation issue

Common causes and fixes
Shell activation not set up

Symptom: mise exec -- node works, but node doesn't

Diagnose:

mise doctor  # Look for activation warnings

Fix - add to shell rc file:

# For zsh (~/.zshrc)
eval "$(mise activate zsh)"

# For bash (~/.bashrc)
eval "$(mise activate bash)"

# For fish (~/.config/fish/config.fish)
mise activate fish | source

Then restart your shell or source the rc file.
Config file not trusted

Symptom: mise shows trust warning, tools not activated

Fix:

mise trust

Tool not installed for current directory

Symptom: mise ls shows tool globally but not in mise ls --current

Diagnose:

# Check what config file applies
mise config

# Check if there's a local config overriding global
cat mise.toml .mise.toml .tool-versions 2>/dev/null

Fix: Add the tool to the project config:

mise use node@20  # Adds to project config

Shims vs PATH activation confusion

Symptom: Tools work in terminal but not in IDE/scripts

See @references/dev-tools/shims-html.md for detailed explanation.

Quick fix for non-interactive contexts:

# In ~/.zprofile or ~/.bash_profile (non-interactive)
eval "$(mise activate zsh --shims)"

# In ~/.zshrc or ~/.bashrc (interactive)
eval "$(mise activate zsh)"

When to use mise exec (legitimately)

mise exec is appropriate for:

    One-off commands with specific versions: mise exec node@18 -- npm test
    CI/CD scripts where activation isn't available
    Testing a different version temporarily

mise exec is NOT a fix for:

    Tools not being on PATH in your terminal (fix activation instead)
    "It works with mise exec" as a permanent solution

Validation Commands

After configuration changes, verify everything works:

# Full health check
mise doctor

# Verify specific tool
mise which node && node --version

# Verify PATH includes mise tools
echo $PATH | tr ':' '\n' | grep mise

Available References

    @references/cli/use-html.md - Full mise use documentation
    @references/cli/doctor-html.md - Diagnostic commands
    @references/cli/activate-html.md - Shell activation
    @references/cli/which-html.md - Path resolution
    @references/dev-tools/shims-html.md - Shims vs PATH activation
    @references/guides/getting-started.md - Setup guide

Red Flags - You're About to Violate

    "Let me just add this to mise.toml manually" → Use mise use instead
    "I'll use mise exec as a workaround" → Diagnose why activation isn't working
    "Let me create a .mise.toml" → Check if config already exists first
    Adding jq/gh/ripgrep to mise → Consider if version actually matters
    Assuming mise is activated → Run mise doctor to verify

