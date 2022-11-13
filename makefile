DEST          := $(HOME)
STOW_BIN      := $(shell which stow)
STOW_ARGUMENT := --target=${DEST} --verbose=2

install:
	-gsettings set org.gnome.desktop.interface overlay-scrolling -bool false
	-defaults write NSGlobalDomain AppleShowScrollBars -string Always
	-defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
	-defaults write com.apple.dock showhidden -bool true
	-killall Dock
	${STOW_BIN} --stow src ${STOW_ARGUMENT}
uninstall:
	-gsettings reset org.gnome.desktop.interface overlay-scrolling
	-defaults delete NSGlobalDomain AppleShowScrollBars
	-defaults delete NSGlobalDomain AppleKeyboardUIMode
	-defaults delete com.apple.dock showhidden
	-killall Dock
	${STOW_BIN} --delete src ${STOW_ARGUMENT}