#!/bin/sh
# Cycle through all media sessions of app (e.g VLC, MPV, FFPlay, Firefox etc) and unmute/mute volume 
# I used it to watch multiple TV channels especially during prime news hour
# This script must be run by the user who is playing application to control
# i.e. pipewire must be running

# Variables
CLIENT_VOLUME="120%"
CLIENT_LIST_FILE=/tmp/pw-clients-switcher.log
CLIENT_NUMBERS=$($(which pw-dump) | jq '.[] | select(.info.props["media.class"] == "Stream/Output/Audio") | .id')



###############
#  FUNCTIONS  #
###############

cycle_thru_client_numbers () {
echo $CLIENT_NUMBERS | tr " " "\n" | while read CLIENT_NO
do
$1 $2 $CLIENT_NO
done
}

mute_all_clients () {
for NODE_ID in $CLIENT_NUMBERS
do
/usr/bin/pw-cli s $NODE_ID Props '{ mute: true }'
done
}



#################
#  MAIN SCRIPT  #
#################

# See if this is first time to run script
[ -s $CLIENT_LIST_FILE ] || cycle_thru_client_numbers echo >> $CLIENT_LIST_FILE

# Mute all clients
mute_all_clients

# Get next client number from list
NODE_ID=`head -1 $CLIENT_LIST_FILE`

# Play next client No.
#---------------------
# Unmute
/usr/bin/pw-cli s $NODE_ID Props '{ mute: false }'

# Remove played client number from list
sed -i -e '1d' $CLIENT_LIST_FILE

# Quit
exit 0


# Volume
#/usr/bin/pw-cli s 42 Props '{ channelVolumes: [ 0.6, 0.6 ] }'
