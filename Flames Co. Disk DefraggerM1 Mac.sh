#!/bin/bash

echo "🚀 Optimizing your M1 Pro (Snappy Mode Activated)..."

# 1️⃣ Enable CPU performance mode (reduce throttling)
sudo pmset -a powernap 0
sudo pmset -a autopoweroff 0
sudo pmset -a standby 0
sudo pmset -a ttyskeepawake 1
sudo pmset -a hibernatemode 0

# 2️⃣ Free up inactive memory (RAM purge)
sudo purge
echo "🧠 RAM optimized."

# 3️⃣ Enable TRIM for SSD speed boost
sudo trimforce enable
echo "⚡ SSD TRIM enabled for better performance."

# 4️⃣ Disable useless background processes
launchctl unload -w /System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist &>/dev/null
launchctl unload -w /System/Library/LaunchAgents/com.apple.CallHistoryPluginHelper.plist &>/dev/null
launchctl unload -w /System/Library/LaunchAgents/com.apple.CallHistorySyncHelper.plist &>/dev/null
launchctl unload -w /System/Library/LaunchAgents/com.apple.photoanalysisd.plist &>/dev/null
launchctl unload -w /System/Library/LaunchAgents/com.apple.mediaremoteagent.plist &>/dev/null
launchctl unload -w /System/Library/LaunchAgents/com.apple.screensharing.plist &>/dev/null
echo "🔧 Background processes trimmed."

# 5️⃣ Reduce UI animation lag
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.finder DisableAllAnimations -bool true
killall Dock
killall Finder
echo "🚀 UI animations reduced for snappier feel."

# 6️⃣ Disable sleep when lid is closed (for external monitor setups)
sudo pmset -a disablesleep 1
echo "🖥️ Sleep disabled when using external displays."

# 7️⃣ Boost network speed
sudo sysctl -w net.inet.tcp.delayed_ack=0
sudo sysctl -w net.inet.tcp.mssdflt=1460
echo "📡 Network performance optimized."

# 8️⃣ Clear system logs & cache
sudo rm -rf /private/var/log/*
sudo rm -rf /Library/Caches/*
sudo rm -rf ~/Library/Caches/*
echo "🧹 System cache cleaned."

# 9️⃣ Restart UI services to apply optimizations
killall -HUP SystemUIServer

echo "✅ Done! Your M1 Pro should now be snappier. 🚀"
