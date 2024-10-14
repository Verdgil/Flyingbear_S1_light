
if ! id "toor" &>/dev/null; then
    echo "toor:x:0:0::/root:/bin/bash" >> /etc/passwd
    echo "toor:*:18411:0:99999:7:::" >> /etc/shadow
fi

# Устанавливаем пароль для пользователя 'toor'
echo 'toor:0000' | chpasswd

rm -rf /root/.oh-my-zsh /root/.zshrc

systemctl stop makerbase-time-monitor.service
systemctl disable makerbase-time-monitor.service

systemctl stop gpio-monitor.service
systemctl disable gpio-monitor.service

systemctl stop alsa-state.service
systemctl stop alsa-restore.service
systemctl disable alsa-restore.service
systemctl disable alsa-state.service

systemctl stop cups.service
systemctl disable cups.service

systemctl enable ntp
systemctl start ntp

apt update

apt purge -y zsh-common zsh tmux gcc g++-8 python3-mako python3-markdown \
python3-markupsafe pulseaudio xserver-xorg xfce4 xserver-xorg-core xserver-common \
xserver-xorg-legacy x11-common lightdm wireguard-tools xdg-utils \
printer-driver-hpcups printer-driver-all spice-vdagent cups-* \
smbclien lxtask alsa-utils gcc-8 git-man git gnome-desktop3-data \
gnome-font-viewer gnome-icon-theme gtk-update-icon-cache
apt autoremove -y
apt-get clean

sync

