#!/bin/bash

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$TIMESTAMP] 🚀 STARTING AUTOMATED DEPLOYMENT PIPELINE..."

echo "Phase 1: Syncing codebase with upstream cloud repository..."
git pull origin master

echo "Phase 2: Flushing legacy cache buffers to prevent conflicts..."
mkdir -p ./tmp/cache
rm -rf ./tmp/cache/*

echo "Phase 3: Reloading the core engine application service..."
sudo systemctl restart nginx

echo "Phase 4: Executing final post-deployment health check..."
if systemctl is-active --quiet nginx; then
    echo "[$TIMESTAMP] ✅ DEPLOYMENT SUCCESSFUL: Service is fully healthy and operational!"
else
    echo "[$TIMESTAMP] ❌ DEPLOYMENT FAILED: Service failed to start after update!"
    exit 1
fi
