#!/bin/bash


# Run as root, please, it's just easier that way
sudo -s


# Add folder, Download Scripts
mdkr /etc/DOAZLAB
cd /etc/DOAZLAB
wget https://raw.githubusercontent.com/DefensiveOrigins/DO-LAB/main/C2/scripts/Install-Tools.sh
wget https://raw.githubusercontent.com/DefensiveOrigins/DO-LAB/main/C2/scripts/RunAtReboot.sh
chmod +x Install-Tools.sh
chmod +x RunAtReboot.sh


# Add Log
touch /etc/DOAZLAB/DOAZLABLog


## Add Crontab for RunAtReboot
echo "Time: $(date). Updating Crontab for RunAtReboot" >> /etc/DOAZLAB/DOAZLABLog
echo @reboot /etc/DOAZLAB/RunAtReboot.sh >> /etc/crontab

#add RunOnceTrigger
touch /etc/DOAZLAB/RunInstallToolsAtNextReboot


# Get updatd APT Pacakges and Upgrade
echo "Time: $(date). Updating Packages and Upgrading" >> /etc/DOAZLAB/DOAZLABLog 
apt-get update
apt-get upgrade -y


# Reboot
echo "Time: $(date). Rebooting" >> /etc/DOAZLAB/DOAZLABLog 
reboot -h now