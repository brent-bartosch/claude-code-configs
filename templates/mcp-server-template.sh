#!/bin/bash
# MCP Server template with memory/vector search
# Usage: ./mcp-server-template.sh my-mcp-server

PROJECT_NAME="${1:-my-mcp-server}"

# Create project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize package.json
cat > package.json <<EOF
{
  "name": "$PROJECT_NAME",
  "version": "0.1.0",
  "type": "module",
  "scripts": {
    "dev": "tsx watch src/index.ts",
    "build": "tsup",
    "start": "node dist/index.js"
  }
}
EOF

# Compose Claude configs for MCP development
npx claude-config-composer memory-mcp-server drizzle

# Create basic directory structure
mkdir -p src

# Initialize git
git init
echo "node_modules/" > .gitignore
echo ".env*" >> .gitignore
echo ".claude/" >> .gitignore
echo "dist/" >> .gitignore

echo "✅ Created $PROJECT_NAME with MCP server configuration!"
echo "📁 cd $PROJECT_NAME && npm install"
echo "📝 Review CLAUDE.md for MCP-specific patterns"
