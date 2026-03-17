#!/bin/sh

echo "========================================="
echo "  OpenClaw on Render - Starting..."
echo "========================================="

# Limit memory for the tiny health server
node --max-old-space-size=64 /app/health-server.js &
echo "✅ Health check server started on port ${PORT:-10000}"

# Give OpenClaw the rest of the memory
# We use NODE_OPTIONS so it applies to OpenClaw and any sub-processes it spawns
export NODE_OPTIONS="--max-old-space-size=320"

echo "🚀 Starting OpenClaw..."
# Run openclaw
openclaw start --non-interactive

echo "✅ OpenClaw is running!"

# Keep container alive
wait
