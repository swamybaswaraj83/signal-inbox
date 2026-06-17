#!/bin/bash
# Signal Inbox - One-command setup script
# Run this in the folder containing your index.html

echo "🚀 Setting up Signal Inbox APK build..."

# Install dependencies
npm install

# Create www folder and copy app
mkdir -p www
cp index.html www/index.html
echo "✓ App files copied to www/"

# Add Android platform
npx cap add android
npx cap sync
echo "✓ Android platform added"

echo ""
echo "✅ Done! Now run:"
echo "   npx cap open android"
echo "   Then: Build > Build APK(s) in Android Studio"
