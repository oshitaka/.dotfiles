#!/bin/bash
# Default acpi script that takes an entry for all actions

TARGET_UID=1000
my_pactl() {
    setpriv --reuid $TARGET_UID sh -c "XDG_RUNTIME_DIR=/run/user/$TARGET_UID pactl $*"
}

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        # 20%
                        echo -n 24000 > /sys/class/backlight/intel_backlight/brightness
                        ;;
                    00000001)
                        #70%
                        echo -n 84000 > /sys/class/backlight/intel_backlight/brightness
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                ;;
            open)
                logger 'LID opened'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
        esac
        ;;
    video/brightnessdown)
        case "$2" in
            BRTDN)
                brightnessctl --min-value=1 --exponent set 5%-
                logger "Brightness down, $(brightnessctl g)"
                ;;
        esac
        ;;
    video/brightnessup)
        case "$2" in
            BRTUP)
                brightnessctl --min-value=1 --exponent set 5%+
                logger "Brightness up, $(brightnessctl get)"
                ;;
        esac
        ;;
    button/mute)
        case "$2" in
            MUTE)
                my_pactl set-sink-mute @DEFAULT_SINK@ toggle
                logger 'Mute button pressed'
                ;;
        esac
        ;;
    button/volumeup)
        case "$2" in
            VOLUP)
                my_pactl set-sink-mute @DEFAULT_SINK@ 0
                my_pactl set-sink-volume @DEFAULT_SINK@ +5%
                logger 'Volume up'
                ;;
        esac
        ;;
    button/volumedown)
        case "$2" in
            VOLDN)
                my_pactl set-sink-volume @DEFAULT_SINK@ -5%
                logger 'Volume down'
                ;;
        esac
        ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
