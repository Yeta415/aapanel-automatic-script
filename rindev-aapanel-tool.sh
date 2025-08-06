#!/bin/bash

# ==================================================
# Rindev aaPanel Installer & Uninstaller
# Author: github.com/yourusername (Credit: Rindev)
# Versi: 1.0
# ==================================================

function install_aapanel() {
    echo "🚀 Installing aaPanel..."
    wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && su bash install.sh
}

function uninstall_aapanel() {
    echo "🚨 WARNING: This will uninstall aaPanel and delete all web files!"
    read -p "Are you sure you want to continue? (yes/no): " confirm

    if [[ "$confirm" != "yes" ]]; then
        echo "❌ Uninstallation cancelled."
        return
    fi

    echo "🛑 Stopping aaPanel and related services..."
    systemctl stop nginx apache2 mysqld bt 2>/dev/null || true
    service nginx stop 2>/dev/null || true
    service apache2 stop 2>/dev/null || true
    service mysqld stop 2>/dev/null || true
    service bt stop 2>/dev/null || true

    echo "🔓 Removing file protections..."
    find /www -name ".user.ini" -exec chattr -i {} \; 2>/dev/null
    chattr -iR /www/server/panel 2>/dev/null

    echo "🧹 Deleting aaPanel files and directories..."
    rm -rf /www /etc/init.d/bt /usr/bin/bt

    echo "🧼 Cleaning up crontab entries..."
    crontab -l | grep -v "/www/server" | grep -v "/www/script" > tempcron
    crontab tempcron
    rm -f tempcron

    echo "🛡️ Removing firewall rules..."
    iptables -D INPUT -p tcp --dport 8888 -j ACCEPT 2>/dev/null || true
    iptables -D INPUT -p tcp --dport 7800 -j ACCEPT 2>/dev/null || true

    echo "✅ aaPanel has been completely uninstalled."
    echo "🔁 Please reboot your server: sudo reboot"
}

function show_menu() {
    clear
    echo "========================================"
    echo "   🛠️ Rindev aaPanel Management Script"
    echo "========================================"
    echo " 1. Install aaPanel"
    echo " 2. Uninstall aaPanel"
    echo " 0. Exit"
    echo "========================================"
    read -p "Choose an option [0-2]: " choice

    case "$choice" in
        1) install_aapanel ;;
        2) uninstall_aapanel ;;
        0) echo "❎ Exit."; exit 0 ;;
        *) echo "⚠️ Invalid option!"; sleep 2; show_menu ;;
    esac
}

# Run the menu
show_menu
