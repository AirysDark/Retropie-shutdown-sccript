#!/bin/sh
# Install script for RetroFlag Pi Case safe shutdown script

PI_CONFIG_FILE="/boot/config.txt"
INITD_DIR="/etc/init.d"
SYSTEMD_DIR="/etc/systemd/system"
ETC_DIR="/etc"

INSTALL_DIR="/opt/retroflag-AD"  # hard coded in etc/* files


# re-mount "/" and "/boot" filesystems as read/write
remount_rw() {
    echo "Re-mounting readonly filesystems as read/write."
    mount -o remount,rw "/"
    mount -o remount,rw "/boot"
}

# enable UART (turn on case LED at beginning of boot)
enable_uart() {
    if grep -q "^enable_uart=1" "$PI_CONFIG_FILE"; then
        echo "UART already enabled."
    else
        echo "Enabling UART."
        sed -i '/^enable_uart=0/d' "$PI_CONFIG_FILE"  # delete existing
        echo >> "$PI_CONFIG_FILE"
        echo "# turn on case LED at beginning of boot" >> "$PI_CONFIG_FILE"
        echo "enable_uart=1" >> "$PI_CONFIG_FILE"
    fi
}

# install service script and specified version of the shutdown script
install_scripts() {
    echo "Installing scripts."
    os="$1"
    install -d "$INSTALL_DIR"
    install "./opt/service.py" "$INSTALL_DIR"
    install "./opt/shutdown.$os" "$INSTALL_DIR/shutdown.sh"
}

# install Systemd service file and enable/start service
install_systemd_service() {
    echo "Installing Systemd service."
    install -m 644 -T "./etc/ADRF.systemd" "$SYSTEMD_DIR/ADRF.service"
    systemctl daemon-reload
    systemctl enable ADRF.service
    systemctl start ADRFservice
}

# prompt for y/n input until a valid selection is given
ask() {
    prompt="$1 [y/n] "
    while true; do
        printf "$prompt"
        read -r key
        case "$key" in
            Y|y) return 0 ;;
            N|n) return 1 ;;
        esac
    done
}


# exit on error
set -e

# exit if not root
if [ $(id -u) -ne 0 ]; then
    echo "Install script must be ran as root."
    exit 1
fi

# perform install
os="${1:-$(uname -n | tr '[:upper:]' '[:lower:]')}"  # lowercase node name
case "$os" in
    retropie)
        enable_uart
        install_scripts retropie
        install_systemd_service
        ;;
        
    *)
        echo "Could not determine operating system."
        exit 1
        ;;
esac

# prompt reboot
echo "Installation complete."
if ask "Reboot?"; then
    shutdown -r now
fi
