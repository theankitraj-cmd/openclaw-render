// Simple health check server to keep Render free tier alive
// Cron-job.org will ping this every 5 minutes to prevent sleep

const http = require('http');

const PORT = process.env.PORT || 10000;

const server = http.createServer((req, res) => {
  if (req.url === '/health' || req.url === '/') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({
      status: 'ok',
      service: 'OpenClaw',
      uptime: process.uptime(),
      timestamp: new Date().toISOString()
    }));
  } else {
    res.writeHead(404);
    res.end('Not Found');
  }
});

server.listen(PORT, () => {
  console.log(`Health check server running on port ${PORT}`);
});
