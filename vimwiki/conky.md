On new installs sometimes conky script doesnt work correctly with regards to the network info to be displayed. 
For instance the current network portion of the conky script is:

  { "full_text" : "${if_up wlan0}${wireless_link_qual_perc wlan0 }% @ ${wireless_essid wlan0} ${addr wlan0}${else} down${endif}" , "color" : ${if_up wlan0} "\#00ff00"${else}"\#ff0000"${endif} },
  
  However the wireless_link_qual_perc variable is not displayed. 

This is because conky needs to have root priviledges to access network libraries and functionalities. If you don't want to run conky with root priviledges, 
there is a way to give programs the priviledges they need without running them under root priviledges. 
In this case , we need to delegate (to Conky's binary file) the appropriate root priviledges to 
perform network-related tasks and to capture raw packets from wire/wireless adapter. 
Two of these access categories (which conky needs) are cap_net_admin and cap_net_raw. 
We need to give conky these classes of permission. This is done by the following command:


`sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/conky`

The conky output is then displayed correctly.


