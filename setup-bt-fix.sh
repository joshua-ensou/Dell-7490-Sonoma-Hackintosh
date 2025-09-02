#!/bin/bash

echo "🔧 Starting Bluetooth auto-fix setup..."

# Step 1: Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "🍺 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed."
fi

# Step 2: Install SleepWatcher
echo "🛌 Installing SleepWatcher..."
brew install sleepwatcher

# Determine SleepWatcher path
if [ -f "/usr/local/sbin/sleepwatcher" ]; then
    SW_PATH="/usr/local/sbin/sleepwatcher"
elif [ -f "/opt/homebrew/sbin/sleepwatcher" ]; then
    SW_PATH="/opt/homebrew/sbin/sleepwatcher"
else
    echo "❌ SleepWatcher not found after install. Exiting."
    exit 1
fi

# Step 3: Create wakeup script
echo "📜 Creating wakeup script at ~/.wakeup..."
cat << 'EOF' > ~/.wakeup
#!/bin/bash
# Fix Intel Bluetooth after wake on Hackintosh
/usr/bin/pkill -9 blued
/usr/bin/pkill -9 bluetoothd
EOF

chmod +x ~/.wakeup
echo "✅ Wakeup script created and made executable."

# Step 4: Create LaunchAgent plist
PLIST_PATH=~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher.plist
echo "🧩 Creating LaunchAgent plist at $PLIST_PATH..."
mkdir -p ~/Library/LaunchAgents

cat << EOF > "$PLIST_PATH"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>de.bernhard-baehr.sleepwatcher</string>
    <key>ProgramArguments</key>
    <array>
        <string>$SW_PATH</string>
        <string>-V</string>
        <string>-w</string>
        <string>/Users/$USER/.wakeup</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
EOF

# Step 5: Load the LaunchAgent
echo "🚀 Loading SleepWatcher LaunchAgent..."
launchctl unload "$PLIST_PATH" 2>/dev/null
launchctl load "$PLIST_PATH"

echo "✅ Setup complete! Bluetooth will auto-restart after sleep."

# Optional: Confirm it's running
echo "🔍 Checking SleepWatcher status..."
launchctl list | grep sleepwatcher || echo "⚠️ SleepWatcher not listed—check plist or permissions."