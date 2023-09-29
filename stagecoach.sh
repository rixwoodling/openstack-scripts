#!/bin/bash

# define common_exports_flex dir
DATE=$( date +%y%m%d%H%M )
FILE="openstack-scripts/common_exports_flex"

if [ ! -z $1 ]; then
    # backup common_exports_flex file
    if [ -f $HOME/$FILE ]; then
        mv $HOME/$FILE $HOME/$FILE-$DATE
    fi

    # create new common_exports_flex file
    echo "rt SEAMLESS_UPDATER_ENDPOINT=${SEAMLESS_UPDATER_ENDPOINT:-'http://10.45.242.8:9666'}" > $HOME/$FILE
    echo "export SEAMLESS_COLLECTOR_ENDPOINT=${SEAMLESS_COLLECTOR_ENDPOINT:-'http://10.45.242.20:9666'}" >> $HOME/$FILE
    echo "export IPA_BASEURL=${IPA_BASEURL:-'http://a001s016.fl30lcent1.deacluster.intel.com:8080/ipa-images'}" >> $HOME/$FILE
    echo "export IPA_IMGNAME=${IPA_IMGNAME:-"ipa-fedora-whitley-wallaby-34508105"}" >> $HOME/$FILE
    echo "export QCOW2_BASEURL=${QCOW2_BASEURL:-'http://a001s016.fl30lcent1.deacluster.intel.com:8080/qcow2-images'}" >> $HOME/$FILE

    # QCOW2 image set to $1
    echo "export QCOW2_IMGNAME=${QCOW2_IMGNAME:-'"$1"'}" >> $HOME/$FILE

    echo "export CDRIVE_BASEURL=${CDRIVE_BASEURL:-'http://a001s016.fl30lcent1.deacluster.intel.com:8080/configdrives'}" >> $HOME/$FILE
    echo 'export QCOW2_CDRIVE=${QCOW2_CDRIVE:-"centos8-group01-1.0.0.iso.gz"}' >> $HOME/$FILE

    cat $HOME/$FILE

else
    echo "needs argument"
fi


