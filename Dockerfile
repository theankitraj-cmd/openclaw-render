FROM node:22-alpine

WORKDIR /app

# Install OpenClaw globally
RUN npm install -g openclaw@latest

# Create a simple health check server to keep Render alive
COPY health-server.js /app/health-server.js
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Expose port for Render health check
EXPOSE 10000

# Start OpenClaw + health server
CMD ["/app/start.sh"]
