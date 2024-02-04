#!/bin/sh
APPDIR=/mnt/mmcblk0p2/App
#PD=/home/tc/src/pure-data-ant1r-git/bin/pd
PD=/mnt/mmcblk0p2/App/pure-data/bin/pd

~/loadX.sh

sudo killall pd

amixer -c 1 cset numid=6 28,28

if false ; then
	#### setup acces point
	sudo dhcpcd -f $APPDIR/hostapconf/dhcpcd.conf
	sudo dnsmasq -l /tmp/dnsmasq.leases -C $APPDIR/hostapconf/dnsmasq.conf
	sudo hostapd -B $APPDIR/hostapconf/hostapd.conf
else
	sudo wpa_supplicant -B -Dnl80211 -iwlan0 -c$APPDIR/wpa_supplicant.conf
	sleep 2
	sudo ifconfig wlan0 193.168.4.110
	#sudo iwconfig wlan0 essid Domozic key s:bidouchette
fi


sleep 5

screen -S OSC -d -m $APPDIR/Etoiles/1-Etoiles/runOSC.sh

#screen -S PD -d -m sudo prlimit --rtprio=99 /home/tc/src/pure-data-ant1r-git/bin/pd -nogui -open $APPDIR/Chimere/0main.pd
screen -S PD -d -m $PD -noaudio -nrt -nogui -open $APPDIR/Etoiles/1-Etoiles/0main.pd

