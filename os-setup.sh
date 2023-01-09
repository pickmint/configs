#!bash
gsettings=(
    "org.gnome.desktop.interface overlay-scrolling"
    "org.gnome.nautilus.preferences default-folder-viewer"
)
gsettings_key=(
    "-bool false"
    "list-view"
)
macos_defaults=(
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
macos_defaults_key=(
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
macos_killall=(
    Dock
    Finder
)
darwin_install(){
    case `which defaults` in
        /*)
            osascript <<__EOF__
                tell application "System Events"
                    tell every desktop
                        set picture to "/System/Library/Desktop Pictures/Solid Colors/Stone.png"
                    end
                end
__EOF__
            for i in "${!macos_defaults[@]}"; do
                defaults write ${macos_defaults[$i]} ${macos_defaults_key[$i]}
            done
            for i in "${macos_killall[@]}"; do
                killall $i
            done
        ;;
    esac
}
case "$1" in
    install)
        case `uname` in
        Darwin)
            darwin_install
        ;;
        *)
            case `which gsettings` in
                /*)
                    for i in "${!gesttings[@]}"; do
	                    gsettings set ${gesttings[$i]} ${gesttings_key[$i]}
                    done
                ;;
            esac
        ;;
        esac
    ;;
    uninstall)
        case `uname` in
            Darwin)
                case `which defaults` in
                    /*)
                        for i in "${macos_defaults[@]}"; do
	                        defaults delete $i
                        done
                        for i in "${macos_killall[@]}"; do
	                        killall $i
                        done
                    ;;
                esac
            ;;
            *)
                case `which gsettings` in
                    /*)
                        for i in "${gesttings[@]}"; do
                            gsettings reset $i
                        done
                    ;;
                esac
            ;;
        esac
    ;;
    *)
        cat<<__EOF__
usage: $0 COMMAND

COMMANDS:
    install
    uninstall
__EOF__
    ;;
esac