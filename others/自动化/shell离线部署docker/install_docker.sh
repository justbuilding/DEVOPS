#!/bin/sh

cd `dirname $0`
dir=`pwd`

tar -xf docker.tar.xz -C /usr/bin/
dockerd --iptables=false >/dev/nul 2>&1 &

