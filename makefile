DEST          := $(HOME)
STOW_BIN      := $(shell which stow)
STOW_ARGUMENT := --target=${DEST} --verbose=2

install:
	@bash ./os-setup.sh install
	${STOW_BIN} --stow src ${STOW_ARGUMENT}
uninstall:
	@bash ./os-setup.sh uninstall
	${STOW_BIN} --delete src ${STOW_ARGUMENT}