For Full article go [here:](https://arstechnica.com/civis/viewtopic.php?t=1163023)

* To see the status of a connection:
	
	`# nmcli con status id 'Wired connection 1'`

* To bring down the interface and disconnect:
	
	`# nmcli con down id 'Wired connection 1'`
	`# nmcli dev disconnect iface eth0`

* to bring it back up:
	
	`# nmcli con up id 'Wired connection 1'``


* To get syntax reminders:
	
	`# nmcli help`
	`# nmcli con help`
	`# nmcli dev help`
	
* Import OpenVPN config from CLI
	
	`# sudo nmcli connection import type openvpn file OpenVPNFile-config.ovpn`


