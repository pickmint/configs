DEST          := $(HOME)
STOW_BIN      := $(shell which stow)
STOW_ARGUMENT := --target=${DEST} --verbose=2

install:
	@sh ./os-setup.sh install
	${STOW_BIN} --stow src ${STOW_ARGUMENT}
uninstall:
	@sh ./os-setup.sh uninstall
	${STOW_BIN} --delete src ${STOW_ARGUMENT}