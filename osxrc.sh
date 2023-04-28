#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Initialise
export THISHOST=`cat ${HOME}/Developer/Bootstrap/computer_name.cfg`

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Hostname stuff                                                              #
###############################################################################
sudo scutil --set HostName ${THISHOST}.local
sudo scutil --set LocalHostName ${THISHOST}
sudo scutil --set ComputerName ${THISHOST}.local
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${THISHOST}"

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -float 0.3166667
defaults write NSGlobalDomain InitialKeyRepeat -float 0.5833333

###############################################################################
# Finder                                                                      #
###############################################################################

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

###############################################################################
# Kill affected applications and flush Cache                                  #
###############################################################################

for app in "cfprefsd" \
	"Dock" \
  "Finder" \
  "SystemUIServer"; do
  killall "${app}" &> /dev/null
done

dscacheutil -flushcache

echo "Done. Note that some of these changes require a logout/restart to take effect."
