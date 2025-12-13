#!/bin/bash

echo "🚀 Setting up Omar AI WhatsApp Bot..."

echo "📦 Installing Python dependencies..."
pip install -r requirements.txt

echo "📦 Installing Node.js dependencies..."
npm install

echo "🔧 Making apkeep executable..."
chmod +x apkeep
./apkeep --version

echo "🔧 Checking aria2..."
aria2c --version | head -1

echo "🔧 Checking ffmpeg..."
ffmpeg -version | head -1

echo "🔧 Installing Playwright browsers..."
playwright install chromium --with-deps 2>/dev/null || echo "Playwright setup skipped"

echo "✅ Setup complete!"
echo ""
echo "To run the bot:"
echo "  1. Start API Server: python api_server.py"
echo "  2. Start WhatsApp Bot: node bot.js"
