#!/bin/bash
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service
sudo snap remove --purge firefox
sudo apt remove --purge snapd
sudo rm -rf /var/cache/snapd/
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo apt install --target-release 'o=LP-PPA-mozillateam' firefox -y
sudo touch /etc/apt/preferences.d/mozillateamppa
sudo sh -c 'echo "Package: firefox*" > /etc/apt/preferences.d/mozillateamppa'
sudo sh -c 'echo "Pin: release o=LP-PPA-moaillateam" >> /etc/apt/preferences.d/mozillateamppa'
sudo sh -c 'echo "Pin-Priority: 1001" >> /etc/apt/preferences.d/mozillateamppa'
sudo sh -c 'echo "Package: firefox*" > /etc/apt/preferences.d/mozillateamppa'
sudo sh -c 'echo "Pin: release o=Ubuntu" >> /etc/apt/preferences.d/mozillateamppa'
sudo sh -c 'echo "Pin-Priority: -1" >> /etc/apt/preferences.d/mozillateamppa'

