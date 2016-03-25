#!/bin/sh

# Configure should be called before run.sh

ORIG_DIR=$PWD

cd /etc/jitsi/videobridge
echo "Configuring $PWD"

DOMAIN=`grep "^JVB_HOSTNAME=" "./config" | cut -d'=' -f2`
#LOCAL_IP=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
LOCAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

SIP_CONFIG="./sip-communicator.properties"

echo "org.jitsi.videobridge.NAT_HARVESTER_LOCAL_ADDRESS=$LOCAL_IP" >> $SIP_CONFIG
echo "org.jitsi.videobridge.NAT_HARVESTER_PUBLIC_ADDRESS=$DOMAIN" >> $SIP_CONFIG

VIDEOBRIDGE_CONFIG="/usr/share/jitsi-videobridge/.sip-communicator/"
if [ ! -d "$VIDEOBRIDGE_CONFIG" ]; then
    mkdir $VIDEOBRIDGE_CONFIG
fi

cp -f $SIP_CONFIG $VIDEOBRIDGE_CONFIG

echo "Done configuring $PWD --> $VIDEOBRIDGE_CONFIG"
cat $SIP_CONFIG

cd $ORIG_DIR




