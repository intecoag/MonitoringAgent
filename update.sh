#!/bin/bash

set -e

# Script to auto-update the MonitoringAgent project
# This script pulls the latest changes and restarts the Docker containers

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=========================================="
echo "MonitoringAgent Auto-Update"
echo "=========================================="

# Check if .env file exists
if [ ! -f .env ]; then
    echo "⚠️  .env file not found. Creating from template..."
    cp .env.template .env
    echo "✓ .env file created. Please review and update if needed."
fi

# Load environment variables
set -a
source .env
set +a

echo "📦 Pulling latest changes from git..."
git pull

echo "🔄 Rebuilding Docker images..."
docker compose build --pull

echo "🚀 Restarting containers..."
docker compose down
docker compose up -d

echo ""
echo "✅ Update complete!"
echo "=========================================="
