#!/bin/sh

# Configure should be called before run.sh

SIP_CONFIG_NAME="sip-communicator.properties"
VIDEOBRIDGE_CONFIG="/usr/share/jitsi-videobridge/.sip-communicator/"
if [ ! -d "$VIDEOBRIDGE_CONFIG" ]; then
    ORIG_DIR=$PWD

    # Extra configuration of Videobridge (NAT etc)
    cd /etc/jitsi/videobridge
    echo "Configuring $PWD"

    DOMAIN=`grep "^JVB_HOSTNAME=" "./config" | cut -d'=' -f2`
    #LOCAL_IP=`ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
    LOCAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

    SIP_CONFIG="./$SIP_CONFIG_NAME"

    echo "org.jitsi.videobridge.NAT_HARVESTER_LOCAL_ADDRESS=$LOCAL_IP" >> $SIP_CONFIG
    echo "org.jitsi.videobridge.NAT_HARVESTER_PUBLIC_ADDRESS=$DOMAIN" >> $SIP_CONFIG

    mkdir $VIDEOBRIDGE_CONFIG
    if [ -d "$VIDEOBRIDGE_CONFIG" ]; then
	cp -f $SIP_CONFIG $VIDEOBRIDGE_CONFIG
	echo "DONE configuring $PWD --> $VIDEOBRIDGE_CONFIG$SIP_CONFIG_NAME:"
	cat $SIP_CONFIG
    else
	echo "ERROR configuring $VIDEOBRIDGE_CONFIG: directory not found"
    fi

    # UI customization
    MEET_HOME=/usr/share/jitsi-meet
    EXO_HOME=/usr/share/exoplatform/jitsi-meet
    mv -f $MEET_HOME/interface_config.js $MEET_HOME/interface_config.js.bak # backup original config
    cp -f $EXO_HOME/interface_config.js $MEET_HOME/interface_config.js # custom UI config
    cp -rf $EXO_HOME/images $MEET_HOME/ # custom images here

    cd $ORIG_DIR
else
    SIP_CONFIG=$VIDEOBRIDGE_CONFIG$SIP_CONFIG_NAME
    echo "USING configuration $SIP_CONFIG:"
    cat $SIP_CONFIG
fi






