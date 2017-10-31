# Connect to wifi network from command line in linux #

For full article see [the blackmoreops site:](https://www.blackmoreops.com/2014/09/18/connect-to-wifi-network-from-command-line-in-linux/)

1. Find Available Wifi adapters.
    
    `# iw dev` 
    
2. Check Device Status. 
   
   Check to see if the adapter is up/down.
   
   `# ip link show DEVICE_NAME` 
   
   (where DEVICE_NAME is wlan0, eth0 etc). 
   Look for the word UP inside the brackets in the first line of output
   
3. Bring up the Wifi interface.  
   
    `# ip link set wlan0 up`
    
    You can check the device status again as in step 2.
    
4. Check the connection status.  
   
    `# iw wlan0 link` 
    
5. Scan to Find the Wifi network. 
   
    `# iw wlan0 scan` 
    
6. Generate a wpa/wpa2 config file.  
   
    `# wpa_passphrase WIFI-SSID >> /etc/wpa_supplicant.conf`
    `# networkpassword`
    
7. Connect to wifi network. 
   
    Once there is a configuration file it can be used to connect to the network.
    
    `# wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf`
    
        where -B means run in background
              -D specifies the the wireless driver (wext is generic wireless driver).
    
    You can then check connection status as in step 4.
    
8. Get an IP using dhclient. 
   
    `# dhclient wlan0`
    
    IP address can then be vewrified with:
    
    `ip addr show wlan0` or `ifconfig wlan0`
    
    Then we check that we have the proper routing rules.
    
    `ip route show`
    
    If we need to add routing manually:
    
    `ip route add default via 10.0.0.138 dev wlan0`
    
9. Test connectivity.
    
    Ping google to check connectivity.
    
    `# ping 8.8.8.8` 



