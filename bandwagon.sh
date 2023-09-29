#!/bin/bash

# add nodes to openstack
if [ ! -z $1 ]; then
    if [ -z $( cat $HOME/openstack-scripts/data/nodes | grep $1 ) ]; then
    MAC=$( source $HOME/openrc-bhs; openstack baremetal port list --node $1 | grep ":" | awk -F' ' '{print $4}' ) && echo $MAC;
    NEWNODE=$( printf $1; printf $( printf ,$1 | sed 's/s/b/' ).deacluster.intel.com,debuguser,0penBmc1,$MAC );
    echo $NEWNODE | tee -a $HOME/openstack-scripts/data/nodes
    fi
else
    echo "need node argument"
fi

