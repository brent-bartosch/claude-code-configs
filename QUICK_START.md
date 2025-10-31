# Quick Start - Universal Config Access

Pick your style and start using Claude Code configs in seconds.

## ⚡ Fastest (No Installation)

```bash
# In any project directory
npx claude-config-composer nextjs-15 shadcn tailwindcss
```

**That's it!** Your configs are ready to use.

---

## 🚀 Fastest (With Install)

```bash
# One-time install
npm install -g claude-config-composer

# Then in any project
claude-compose nextjs-15 shadcn

# Update when needed
npm update -g claude-config-composer
```

---

## 🔧 Power User Setup (5 minutes)

```bash
# 1. Clone repo to home directory
cd ~
git clone https://github.com/Matt-Dionis/claude-code-configs.git
cd claude-code-configs/claude-config-composer
npm install && npm run build

# 2. Add helper to your shell config (~/.zshrc or ~/.bashrc)
echo 'export CLAUDE_CONFIGS_HOME="$HOME/claude-code-configs"' >> ~/.zshrc
echo 'export PATH="$CLAUDE_CONFIGS_HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# 3. Use from anywhere
claude-grab list
claude-grab compose nextjs-15 shadcn
claude-grab update  # Update configs anytime
```

---

## 📦 Project Templates

```bash
# After power user setup above:
cd ~/claude-code-configs/templates

# Full-stack Next.js app
./full-stack-template.sh my-awesome-app

# MCP Server
./mcp-server-template.sh my-mcp-server

# Or with helper:
claude-grab new full-stack my-app
```

---

## 📋 Common Commands

### List Available Configs
```bash
npx claude-config-composer list
# or
claude-grab list
```

### Compose Multiple Configs
```bash
# Combine several configs intelligently
npx claude-config-composer nextjs-15 shadcn tailwindcss drizzle vercel-ai-sdk

# or
claude-compose nextjs-15 shadcn tailwindcss drizzle vercel-ai-sdk
```

### Copy Single Config
```bash
# With helper only
claude-grab copy frameworks/nextjs-15
claude-grab copy ui/shadcn
```

### Update Configs
```bash
# Global NPM
npm update -g claude-config-composer

# Local clone
claude-grab update
```

---

## 🎯 Common Stacks

### Full-Stack Web App
```bash
claude-compose nextjs-15 shadcn tailwindcss drizzle vercel-ai-sdk
```

### Simple Next.js + UI
```bash
claude-compose nextjs-15 shadcn tailwindcss
```

### AI Application
```bash
claude-compose vercel-ai-sdk drizzle
```

### MCP Server Development
```bash
claude-compose memory-mcp-server drizzle
```

---

## 🆘 Troubleshooting

### "Command not found: claude-compose"
```bash
# Use full npx command
npx claude-config-composer list

# Or check npm global path
npm config get prefix
# Add /bin to your PATH
```

### "Command not found: claude-grab"
```bash
# Make sure you ran the power user setup
# Check PATH includes $CLAUDE_CONFIGS_HOME/bin
echo $PATH | grep claude-config

# Make script executable
chmod +x ~/claude-code-configs/bin/claude-grab
```

### Outdated Configs
```bash
# NPM global
npm update -g claude-config-composer

# Local clone
cd ~/claude-code-configs
git pull
cd claude-config-composer && npm install && npm run build
```

---

## 📚 Full Documentation

For complete setup options and advanced usage:

- **[Universal Setup Guide](SETUP_UNIVERSAL.md)** - All setup methods
- **[Main README](README.md)** - Full documentation
- **[Templates Guide](templates/README.md)** - Creating templates
- **[Migration Guide](MIGRATION.md)** - Upgrading from old configs

---

## 💡 Next Steps

1. **Choose your setup** (npx, global, or power user)
2. **Try it**: `claude-compose list`
3. **Use in a project**: Pick your stack and compose
4. **Customize**: Edit `.claude/` configs as needed
5. **Share**: Help your team use the same setup!

---

**Made by the community, for the community** ❤️
