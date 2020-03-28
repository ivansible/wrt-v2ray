#!/bin/sh

ENABLED=yes
PROCS=v2ray-client
ARGS="-config /opt/etc/v2ray.json"
PREARGS=""
DESC=$PROCS
PATH=/opt/sbin:/opt/bin:/opt/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

[ -z "$(which $PROCS)" ] && exit 0

. /opt/etc/init.d/rc.func
