Xvnc -listen localhost:5900 -localhost=1 -SecurityTypes=none -from 127.0.0.1 -noreset &
# Wait 3 seconds for Xvnc to start
sleep 3
# Create the dbus metadata directory.
mkdir -p $HOME/$REPL_SLUG/.dbus
mkdir -p /run/current-system/sw/bin
ln -s $DBUS_PATH/bin/dbus-daemon /run/current-system/sw/bin/dbus-daemon 2>/dev/null
touch $HOME/$REPL_SLUG/.dbus/machine-id
# Add a machine id to the machine ID file. Doesn't matter if we regenerate during a session, they're unique anyway.
dbus-uuidgen>$HOME/$REPL_SLUG/.dbus/machine-id
dbus-launch
# Start your window manager.
fluxbox &
# Start your apps
$( sleep 2; xterm ) &

$( sleep 1 ; $HOME/$REPL_SLUG/vnc/utils/novnc_proxy )
# Make sure this is the last line. (This makes sure everything finishes before we exit)
wait