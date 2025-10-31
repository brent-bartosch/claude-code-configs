# Universal Setup Guide for Claude Code Configs

This guide shows you how to make these configurations available across **all your projects** without manual copying.

## 🎯 Quick Start (Recommended)

### Option A: NPM Global Install (Simplest)

```bash
# Install once globally
npm install -g claude-config-composer

# Use in any project
cd ~/my-new-project
claude-compose nextjs-15 shadcn tailwindcss
```

**Pros:**
- ✅ Works from anywhere
- ✅ Always up-to-date via `npm update -g`
- ✅ No local git repo needed

**Cons:**
- ❌ Requires npm
- ❌ Limited customization

---

## 🔧 Advanced Setups

### Option B: Local Repo + Shell Alias

Keep a local copy for customization and quick access:

```bash
# 1. Clone to a permanent location
cd ~
git clone https://github.com/Matt-Dionis/claude-code-configs.git
cd claude-code-configs/claude-config-composer
npm install && npm run build

# 2. Add alias to shell config (~/.bashrc, ~/.zshrc, or ~/.config/fish/config.fish)
# For bash/zsh:
echo 'alias claude-configs="node ~/claude-code-configs/claude-config-composer/dist/cli.js"' >> ~/.zshrc

# For fish:
echo 'alias claude-configs "node ~/claude-code-configs/claude-config-composer/dist/cli.js"' >> ~/.config/fish/config.fish

# 3. Reload shell
source ~/.zshrc  # or restart terminal

# 4. Use from anywhere
cd ~/my-project
claude-configs nextjs-15 shadcn
```

**Update your local copy:**
```bash
cd ~/claude-code-configs
git pull
cd claude-config-composer
npm install && npm run build
```

**Pros:**
- ✅ Can customize configurations locally
- ✅ Works offline
- ✅ Control over updates

**Cons:**
- ❌ Manual updates required
- ❌ Initial setup more complex

---

### Option C: Environment Variable + Helper Script

Create a centralized configuration system:

```bash
# 1. Clone repo
cd ~
git clone https://github.com/Matt-Dionis/claude-code-configs.git

# 2. Add to shell config
echo 'export CLAUDE_CONFIGS_HOME="$HOME/claude-code-configs"' >> ~/.zshrc
echo 'export PATH="$CLAUDE_CONFIGS_HOME/bin:$PATH"' >> ~/.zshrc

# 3. Create bin directory
mkdir -p ~/claude-code-configs/bin

# 4. Create helper script (see below)
# Save as ~/claude-code-configs/bin/claude-grab
chmod +x ~/claude-code-configs/bin/claude-grab

# 5. Reload shell
source ~/.zshrc

# 6. Use from anywhere
claude-grab list
claude-grab compose nextjs-15 shadcn
claude-grab copy frameworks/nextjs-15
```

**Helper script content** (`~/claude-code-configs/bin/claude-grab`):

```bash
#!/bin/bash

CONFIGS_DIR="${CLAUDE_CONFIGS_HOME:-$HOME/claude-code-configs}"
COMPOSER="$CONFIGS_DIR/claude-config-composer/dist/cli.js"

show_usage() {
  cat <<EOF
Usage: claude-grab <command> [args]

Commands:
  list              List all available configurations
  compose <configs> Merge multiple configs into current directory
  copy <path>       Copy single config to current directory
  update            Update the configs repository
  templates         List available project templates

Examples:
  claude-grab list
  claude-grab compose nextjs-15 shadcn tailwindcss
  claude-grab copy frameworks/nextjs-15
  claude-grab templates
EOF
}

case "$1" in
  list)
    echo "Available configurations:"
    echo ""
    echo "📦 Frameworks:"
    ls -1 "$CONFIGS_DIR/configurations/frameworks"
    echo ""
    echo "🎨 UI Libraries:"
    ls -1 "$CONFIGS_DIR/configurations/ui"
    echo ""
    echo "💾 Databases:"
    ls -1 "$CONFIGS_DIR/configurations/databases"
    echo ""
    echo "🛠️  Tools:"
    ls -1 "$CONFIGS_DIR/configurations/tooling"
    echo ""
    echo "🔌 MCP Servers:"
    ls -1 "$CONFIGS_DIR/configurations/mcp-servers"
    ;;

  compose)
    shift
    if [ ! -f "$COMPOSER" ]; then
      echo "⚠️  Composer not built. Building..."
      cd "$CONFIGS_DIR/claude-config-composer"
      npm install && npm run build
      cd - > /dev/null
    fi
    node "$COMPOSER" "$@"
    ;;

  copy)
    if [ -z "$2" ]; then
      echo "❌ Error: Config path required"
      echo "Example: claude-grab copy frameworks/nextjs-15"
      exit 1
    fi

    SOURCE="$CONFIGS_DIR/configurations/$2"
    if [ ! -d "$SOURCE" ]; then
      echo "❌ Error: Configuration not found at $SOURCE"
      exit 1
    fi

    cp -r "$SOURCE/.claude" . 2>/dev/null || echo "⚠️  No .claude directory found"
    cp "$SOURCE/CLAUDE.md" . 2>/dev/null || echo "⚠️  No CLAUDE.md found"
    cp "$SOURCE/README.md" "./CLAUDE_README.md" 2>/dev/null || echo "⚠️  No README.md found"

    echo "✅ Copied $2 configuration to current directory"
    ;;

  update)
    echo "📦 Updating claude-code-configs..."
    cd "$CONFIGS_DIR"
    git pull
    cd claude-config-composer
    npm install && npm run build
    echo "✅ Update complete!"
    ;;

  templates)
    echo "Available project templates:"
    ls -1 "$CONFIGS_DIR/templates" 2>/dev/null || echo "No templates found"
    ;;

  *)
    show_usage
    ;;
esac
```

**Pros:**
- ✅ Highly customizable
- ✅ Multiple helper commands
- ✅ Easy updates
- ✅ Template support

---

### Option D: Project Templates (For Frequent Use)

Create starter templates for common stacks:

```bash
# 1. Use the provided templates
cd ~/claude-code-configs/templates
chmod +x *.sh

# 2. Create new project with full config
./full-stack-template.sh my-awesome-app

# 3. Or MCP server
./mcp-server-template.sh my-mcp-server
```

**Create your own template:**
```bash
# ~/claude-code-configs/templates/my-stack-template.sh
#!/bin/bash
PROJECT_NAME="${1:-my-project}"

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Your custom setup here
npx claude-config-composer nextjs-15 your-favorite-configs

npm init -y
# ... more initialization
```

---

## 📋 Comparison Table

| Method | Setup Time | Flexibility | Updates | Offline | Customization |
|--------|-----------|------------|---------|---------|---------------|
| NPM Global | 1 min | Low | Auto | No | Low |
| Shell Alias | 5 min | Medium | Manual | Yes | High |
| Helper Script | 10 min | High | One command | Yes | Very High |
| Templates | 15 min | Very High | Manual | Yes | Complete |

---

## 🎯 Recommended Workflow

**For most users:**
1. Install globally: `npm install -g claude-config-composer`
2. Use when needed: `claude-compose <configs>`

**For power users:**
1. Clone locally: `git clone https://github.com/Matt-Dionis/claude-code-configs.git ~/claude-code-configs`
2. Install helper script (Option C)
3. Create custom templates for your common stacks
4. Update monthly: `claude-grab update`

---

## 🚀 Usage Examples

### Starting a new Next.js project:
```bash
mkdir my-app && cd my-app
npx create-next-app@latest . --typescript --tailwind --app
claude-compose nextjs-15 shadcn tailwindcss vercel-ai-sdk
```

### Adding to existing project:
```bash
cd existing-project
claude-compose drizzle vercel-ai-sdk
```

### Quick MCP server:
```bash
~/claude-code-configs/templates/mcp-server-template.sh my-server
```

---

## 🔄 Keeping Configs Updated

### NPM Global:
```bash
npm update -g claude-config-composer
```

### Local Clone:
```bash
cd ~/claude-code-configs
git pull
cd claude-config-composer
npm install && npm run build
```

### With Helper Script:
```bash
claude-grab update
```

---

## 💡 Pro Tips

1. **Combine with cookiecutter/degit** for full project scaffolding
2. **Version control your templates** for team consistency
3. **Customize local configs** before composing for your workflow
4. **Use `.env.example`** with placeholder values in templates
5. **Document your stack** in a team wiki with config commands

---

## 🐛 Troubleshooting

### "Command not found"
- Ensure PATH includes npm global bin: `npm config get prefix`
- Or use full path: `npx claude-config-composer`

### "Permission denied"
- Make scripts executable: `chmod +x ~/claude-code-configs/bin/*`

### "Configs outdated"
- Run update command or `git pull` in local clone

---

## 📚 Next Steps

1. Choose your preferred setup method above
2. Test with: `claude-compose list` or `claude-grab list`
3. Create your first project with configs
4. Customize templates for your common stacks
5. Share with your team!
