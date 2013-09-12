#!/bin/bash

T=`mktemp`
LINE='none /cygdrive cygdrive noacl'

cp /etc/fstab "$T"
confappend 'cygwin-noacl' "$LINE" "$T" > /etc/fstab

rm -f "$T"
