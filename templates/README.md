# Project Templates

Pre-configured project templates with Claude Code configurations built-in.

## Available Templates

### 1. Full-Stack Template (`full-stack-template.sh`)

Creates a complete Next.js application with all the bells and whistles:

**Includes:**
- Next.js 15 with App Router
- shadcn/ui components
- Tailwind CSS
- Drizzle ORM
- Vercel AI SDK

**Usage:**
```bash
./full-stack-template.sh my-awesome-app
cd my-awesome-app
npm install
```

**What you get:**
- `package.json` with scripts
- Complete `.claude/` directory with 40+ agents
- `CLAUDE.md` with best practices
- Git repository initialized
- Proper `.gitignore`

---

### 2. MCP Server Template (`mcp-server-template.sh`)

Creates an MCP server project with memory and vector search capabilities:

**Includes:**
- Memory MCP Server configuration
- Drizzle ORM for PostgreSQL
- TypeScript setup
- Development tooling

**Usage:**
```bash
./mcp-server-template.sh my-mcp-server
cd my-mcp-server
npm install
```

**What you get:**
- `package.json` with MCP scripts
- `.claude/` directory with 15+ MCP-specific agents
- `CLAUDE.md` with MCP patterns
- Basic project structure
- TypeScript configuration

---

## Using Templates with `claude-grab`

If you've set up the `claude-grab` helper script:

```bash
# List templates
claude-grab templates

# Create from template
claude-grab new full-stack my-app
claude-grab new mcp-server my-server
```

---

## Creating Custom Templates

Create your own template for your common stack:

```bash
#!/bin/bash
# my-stack-template.sh
# Description of what this template does

PROJECT_NAME="${1:-my-project}"

# Create project
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Setup package.json
cat > package.json <<EOF
{
  "name": "$PROJECT_NAME",
  "version": "0.1.0",
  "private": true
}
EOF

# Add your preferred Claude configs
npx claude-config-composer your-favorite-configs

# Additional setup
# ...

echo "✅ Created $PROJECT_NAME!"
```

**Save it** in the `templates/` directory and make it executable:
```bash
chmod +x templates/my-stack-template.sh
```

---

## Template Best Practices

1. **Always include:**
   - `package.json` with useful scripts
   - `.gitignore` with sensible defaults
   - Basic directory structure
   - Claude Code configurations

2. **Consider adding:**
   - `.env.example` with required environment variables
   - `README.md` specific to the template
   - Basic configuration files (tsconfig.json, etc.)
   - Sample code/components

3. **Use parameters:**
   - Accept project name as first argument
   - Use sensible defaults
   - Document usage in comments

4. **Keep it focused:**
   - One template per common use case
   - Don't try to be everything
   - Make it easy to customize after generation

---

## Common Stacks to Template

Consider creating templates for:

- **Landing Page:** Next.js + Tailwind + shadcn
- **SaaS App:** Next.js + Auth + Database + Payments
- **AI Chat:** Vercel AI SDK + Streaming + Memory
- **API Server:** Express/Fastify + Database + Auth
- **CLI Tool:** TypeScript + Commander + Inquirer
- **Chrome Extension:** Manifest V3 + TypeScript
- **Discord Bot:** discord.js + Database + Commands

---

## Sharing Templates

If you create useful templates:

1. Test them thoroughly
2. Document all requirements
3. Add usage examples
4. Consider contributing back via PR!

---

## Template Variables

Templates can use these variables:

```bash
PROJECT_NAME="${1:-default-name}"           # From first argument
CONFIGS_DIR="${CLAUDE_CONFIGS_HOME:-...}"  # Config location
USER_NAME="${USER}"                         # Current user
```

---

## Advanced: Template Generators

For complex setups, consider using template generators:

```bash
#!/bin/bash
# interactive-template.sh

# Prompt for project details
read -p "Project name: " PROJECT_NAME
read -p "Use TypeScript? (y/n): " USE_TS
read -p "Add authentication? (y/n): " ADD_AUTH

# Conditionally set up based on responses
# ...
```

This makes templates more flexible and user-friendly.
