#!sh
case `which gsettings` in
/*)
    gsettings=(
        "org.gnome.desktop.interface overlay-scrolling"
    )
    gsettings_key=(
        "-bool false"
    )
    case "$1" in
    install)
        for i in "${!gesttings[@]}"; do
	        gsettings set ${gesttings[$i]} ${gesttings_key[$i]}
        done
        ;;
    uninstall)
        for i in "${gesttings[@]}"; do
            gsettings reset $i
        done
        ;;
    esac
    ;;
esac
case `uname` in
Darwin)
    case `which defaults` in
        /*)
            defaults=(
                "NSGlobalDomain AppleShowAllExtensions"
	            "NSGlobalDomain AppleShowScrollBars"
    	        "NSGlobalDomain AppleKeyboardUIMode"
	            "com.apple.desktopservices DSDontWriteNetworkStores"
	            "com.apple.dock showhidden"
    	        "com.apple.finder AppleShowAllFiles"
	            "com.apple.finder FXPreferredViewStyle"
	            "com.apple.finder ShowPathbar"
    	        "com.apple.finder QuitMenuItem"
            )
            defaults_key=(
                "-bool true"
	            "-string Always"
    	        "-int 2"
	            "-bool true"
	            "-bool true"
    	        "-bool true"
	            "-string clmv"
	            "-bool true"
    	        "-bool true"
            )
            killall=(
                Dock
                Finder
            )
            case "$1" in
            install)
                osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/System/Library/Desktop Pictures/Solid Colors/Stone.png"'
                for i in "${!defaults[@]}"; do
	                defaults write ${defaults[$i]} ${defaults_key[$i]}
                done
                for i in "${killall[@]}"; do
	                killall $i
                done
                ;;
            uninstall)
                for i in "${defaults[@]}"; do
	                defaults delete $i
                done
                for i in "${killall[@]}"; do
	                killall $i
                done
                ;;
            esac
            ;;
    esac
    ;;
esac
case "$1" in
    install);;
    uninstall);;
    *)
        cat<<__EOF__
usage: $0 COMMAND

COMMANDS:
    install
    uninstall
__EOF__
        ;;
esac