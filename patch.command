#!/bin/bash

#set -x
cd ~/Projects/y50.git
git pull
#./download.sh
./install_downloads.sh
cd ~/Projects/y50.git
make
make install
cd ~/Projects/y50.git
curl -o ./ssdtPRGen.sh https://raw.githubusercontent.com/Piker-Alpha/ssdtPRGen.sh/master/ssdtPRGen.sh
chmod +x ./ssdtPRGen.sh
./ssdtPRGen.sh -p 'i7-4710HQ' -f 2600 -turbo 3600
cd ~/Projects/y50.git
sudo ./mount_efi.sh /
cp ~/Library/ssdtPRGen/ssdt.aml /Volumes/EFI/EFI/Clover/ACPI/patched/SSDT.aml
sudo pmset -a hibernatemode 0
sudo rm /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
cd ~/Projects/y50.git
sudo ./mount_efi.sh /
cd ~/Projects/y50.git
cp config.plist /Volumes/EFI/EFI/Clover/config.plist
sudo touch /System/Library/Extensions && sudo kextcache -u /




exit
