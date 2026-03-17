#!/bin/sh

echo "========================================="
echo "  OpenClaw on Render - Starting..."
echo "========================================="

# Limit Node.js memory usage to fit within 512MB RAM free tier
export NODE_OPTIONS="--max-old-space-size=400"

# Start health check server in background (keeps Render alive)
node /app/health-server.js &
echo "✅ Health check server started on port ${PORT:-10000}"

# Start OpenClaw gateway
echo "🚀 Starting OpenClaw..."
openclaw start --non-interactive

echo "✅ OpenClaw is running!"

# Keep container alive
wait
