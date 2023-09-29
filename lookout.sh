#!/bin/bash

if [ ! -z $1 ]; then
    while true; do timeout 15 openstack baremetal node list | grep $1 2>/dev/null; sleep 10; done
else
    echo "needs node argument"
fi

