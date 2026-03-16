FROM node:22-slim

WORKDIR /app

# Install standard dependencies that native node modules might need
RUN apt-get update && apt-get install -y python3 make g++ git && rm -rf /var/lib/apt/lists/*

# Install OpenClaw globally with verbose logging to see what goes wrong
RUN npm install -g openclaw@latest --unsafe-perm

# Create a simple health check server to keep Render alive
COPY health-server.js /app/health-server.js
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Expose port for Render health check
EXPOSE 10000

# Start OpenClaw + health server
CMD ["/app/start.sh"]
