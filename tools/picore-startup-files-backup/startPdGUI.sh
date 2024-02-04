#!/bin/sh

#PD=/home/tc/src/pure-data-ant1r-git/bin/pd
PD=/mnt/mmcblk0p2/App/pure-data/bin/pd

sudo killall pd
#sleep 5
tce-load -i unzip
#sudo prlimit --rtprio=99 /home/tc/src/pure-data-ant1r-git/bin/pd -nogui -open /home/tc/Pd/test.pd&
#sudo prlimit --rtprio=99 /home/tc/src/pure-data-ant1r-git/bin/pd -open /mnt/mmcblk0p2/App/Chimere/0main.pd
$PD -open /mnt/mmcblk0p2/App/Etoiles/1-Etoiles/0main.pd
