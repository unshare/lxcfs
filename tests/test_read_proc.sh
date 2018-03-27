#!/bin/bash -eux
#./lxcfs -s -f -d -o allow_other -o direct_io ${DIR}

red_c() {
     echo -e $2 "\e[31;1m${1}\e[0m"
}
LXCFSDIR="{$LXCFSDIR:-/var/lib/lxcfs}"

if ! mountpoint -q ${LXCFSDIR}; then
    echo "lxcfs isn't mounted on ${LXCFSDIR}"
    exit 1
fi


COUNT=3

for i in test_read
do
	BIN=$PWD/$i

	red_c "$BIN test cpuinfo"
	$BIN ${LXCFSDIR}/proc/cpuinfo $COUNT

	red_c "$BIN test stat"
	$BIN ${LXCFSDIR}/proc/stat $COUNT

	red_c "$BIN test meminfo"
	$BIN ${LXCFSDIR}/proc/meminfo $COUNT
done
exit 0
