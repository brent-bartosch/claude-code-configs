#!/bin/bash
# Full-stack Next.js template with all configs
# Usage: ./full-stack-template.sh my-new-project

PROJECT_NAME="${1:-my-app}"
CONFIGS_DIR="$(dirname "$0")/.."

# Create project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize package.json
cat > package.json <<EOF
{
  "name": "$PROJECT_NAME",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start"
  }
}
EOF

# Compose Claude configs
npx claude-config-composer nextjs-15 shadcn tailwindcss drizzle vercel-ai-sdk

# Initialize git
git init
echo "node_modules/" > .gitignore
echo ".env*" >> .gitignore
echo ".claude/" >> .gitignore

echo "✅ Created $PROJECT_NAME with full-stack configuration!"
echo "📁 cd $PROJECT_NAME && npm install"
