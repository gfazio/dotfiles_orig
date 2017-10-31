This guide will show how to setup DHCP or static IP address from command line. 
For full details see [the blackmoreops site:](https://www.blackmoreops.com/2015/03/26/setup-dhcp-or-static-ip-address-from-command-line-in-linux/)

1. STOP and START Networking service
	
	`# /etc/init.d/networking stop` 
	
	`# /etc/init.d/networking start` 
	
	In systems using systemd, then use the following instead:
	`# systemctl stop network.service`
	
	`# systemctl start network.service`
	
2.  STOP and START Network-Manager
	`# systemctl stop NetworkManager.serviced`
	
	`# systemctl start NetworkManager.serviced`
	
3.  Bring up network interface
	`# ifconfig eth0 up`
	
	or 
	
	`ifup eth0`
	
	At this point the interface doesn't have an IP address 
	assigned as can be checked by the following command:
	
	`# ifconfig eth0`
	
4.  Setting up IP Address via DHCP
	`# echo "iface eth0 inet dhcp >> /etc/network/interfaces"`
	
	and then bring up the interface as in previous step.
	
5.  Setting up Static IP
	`# ifconfig eth0 192.168.43.226`
	`# ifconfig eth0 netmask 255.255.255.0`
	`# ifconfig eth0 broadcast 192.168.43.255`
	` route add default gw 192.168.43.1 eth0`
	
6.  Alternative way of setting up Static IP
	`#  echo -e “iface eth0 inet dhcp\n address 10.1.1.2\n netmask 255.255.255.0\n gateway 10.1.1.1″>>/etc/network/interfaces`
	
7.  Fix missing Default Gateway
	`# ping 8.8.8.8`
	
8.  Setting up Nameserver/DNS
	`# echo “nameserver 8.8.8.8\n nameserver 8.8.4.4″ >>/etc/resolv.conf`
	

