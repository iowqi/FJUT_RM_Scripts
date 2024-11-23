#!/bin/bash
sudo snap remove --purge firefox
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo apt install --target-release 'o=LP-PPA-mozillateam' firefox -y
sudo touch /etc/apt/preferences.d/mozillateamppa
sudo sh -c 'echo "Package: firefox*" > /etc/apt/preferences.d/mozillateamppa'
sudo sh -c 'echo "Pin: release o=LP-PPA-moaillateam" >> /etc/apt/preferences.d/mozillateamppa'
sudo sh -c 'echo "Pin-Priority: 501" >> /etc/apt/preferences.d/mozillateamppa'


