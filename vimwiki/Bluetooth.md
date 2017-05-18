# Bluetooth #

if the following fails to connect/pair successfully, then issue the following command:

`sudo rfkill unblock bluetooth`

So to start we issue the following commands to make sure that bluetooth is running and enabled.

`sudo systemctl restart bluetooth`

 `sudo systemctl enable bluetooth ` (this is only if you wish bluetooth to start at boot-up)

we can then check that this is so with: 

`systemctl status -l bluetooth`

You can then enter the bluetooth shell with:

`bluetoothctl`

Turn the power on and find out the device MAC address:

`power on`

`devices`

if not paired you can enter `pair MAC_ADDRESS`. if already pair you can enter `trust MAC_ADDRESS`

then enter `connect MAC_ADDRESS`


you can now exit and use pavucontrol or the scripts pa-global or pa-solo to redirect sound to the headset.

Ref: Archlinux Wiki [bluetooth](https://wiki.archlinux.org/index.php/bluetooth)


To prevent audio autoskipping with the A2DP profile try the following:

`echo "options iwlwifi bt_coex_active=0" | sudo tee -a /etc/modprobe.d/iwlwifi.conf`

This disables the bluetooth coexistance parameter of the iwlwifi module (sometimes wifi intereferes with the bluetooth)
In this setups case the file may actually be 50-iwl3945.conf so modify the above as follows.

`echo "options iwl3945  bt_coex_active=0" | sudo tee -a /etc/modprobe.d/50-iwl3945.conf`


