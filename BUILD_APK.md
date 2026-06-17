# Signal Inbox — Build APK Guide

## Prerequisites (install once)
- Node.js: https://nodejs.org
- Android Studio: https://developer.android.com/studio
- Java JDK 17+: https://adoptium.net

---

## Step 1 — Set up the project

```bash
# Create project folder
mkdir signal-inbox-app
cd signal-inbox-app

# Initialize npm
npm init -y

# Install Capacitor
npm install @capacitor/core @capacitor/cli @capacitor/android

# Initialize Capacitor
npx cap init "Signal Inbox" "com.signalinbox.app" --web-dir www
```

---

## Step 2 — Add your app files

```bash
# Create www folder
mkdir www

# Copy your index.html into www/
cp /path/to/index.html www/index.html
```

---

## Step 3 — Add Android platform

```bash
npx cap add android
npx cap sync
```

---

## Step 4 — Configure app (optional branding)

Edit `android/app/src/main/res/values/strings.xml`:
```xml
<string name="app_name">Signal Inbox</string>
```

Edit `android/app/src/main/AndroidManifest.xml` — add internet permission:
```xml
<uses-permission android:name="android.permission.INTERNET" />
```

Edit `capacitor.config.json`:
```json
{
  "appId": "com.signalinbox.app",
  "appName": "Signal Inbox",
  "webDir": "www",
  "server": {
    "androidScheme": "https"
  }
}
```

---

## Step 5 — Build the APK

```bash
# Open in Android Studio
npx cap open android
```

In Android Studio:
1. Wait for Gradle sync to finish (~2 min)
2. Go to **Build** → **Build Bundle(s) / APK(s)** → **Build APK(s)**
3. Click **locate** when build finishes
4. APK is at:
   `android/app/build/outputs/apk/debug/app-debug.apk`

---

## Step 6 — Install on your phone

### Option A — USB
```bash
# Enable USB Debugging on phone (Settings > Developer Options)
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

### Option B — File transfer
1. Copy `app-debug.apk` to your phone
2. Open it with a file manager
3. Enable "Install unknown apps" if prompted
4. Tap Install

---

## Fastest Alternative — PWABuilder (no Android Studio needed)

1. Host index.html on Netlify: https://app.netlify.com/drop
2. Go to: https://www.pwabuilder.com
3. Enter your Netlify URL
4. Click Android → Generate Package → Download APK

---

## App Details
- Package: com.signalinbox.app
- Version: 1.0.0
- Min Android: 5.0 (API 21)
- Target Android: 14 (API 34)
