#!/bin/bash

DATESTR=`date "+%Y%m%d%H%M%S"`
INTERVAL=2
DURATION=10
OUTDIR=/tmp/pss$DATESTR
TARGETS="bash sshd"

function pgreps() { echo $(for target in $@ ; do pgrep $target; done); return 0; }

mkdir $OUTDIR

for pid in $(pgreps $TARGETS) ;
  do while true; do gstack $pid ; sleep $INTERVAL; done | awk '{ print strftime("%Y-%m-%dT%H:%M:%S"), $0; fflush() }' > $OUTDIR/gsta.$pid &
done
netstat -s $INTERVAL | awk '{ print strftime("%Y-%m-%dT%H:%M:%S"), $0; fflush() }' > $OUTDIR/snet &
netstat -ntoape $INTERVAL | awk '{ print strftime("%Y-%m-%dT%H:%M:%S"), $0; fflush() }' > $OUTDIR/net &
vmstat $INTERVAL 65535 | awk '{ print strftime("%Y-%m-%dT%H:%M:%S"), $0; fflush() }' > $OUTDIR/vms &
iostat -xdN -j PATH $INTERVAL | awk '{ print strftime("%Y-%m-%dT%H:%M:%S"), $0; fflush() }' > $OUTDIR/io &
top -Hbd $INTERVAL | awk '{ print strftime("%Y-%m-%dT%H:%M:%S"), $0; fflush() }' > $OUTDIR/top &
./pss -i $INTERVAL -c 65535 > $OUTDIR/pss &

sleep $DURATION

jobs -p | xargs kill
