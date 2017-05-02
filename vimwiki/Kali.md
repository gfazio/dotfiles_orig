
 ##  Kali Linux 2.0 ## 
 
Notes:
 
If you enter a login loop, then press ** ctrl-alt f1,2,3,4,5, ** or ** 6 ** to get a console login. 
Login as root and enter __dpkg --configure -a__. 
Select any defaults offered and then reboot.

### Network ### 

** Network Adapter ** This VM has a number of network adapters so that it can communicate with the 
   other VM's on host only private networks. However by default the first network adapter is automatically 
   started and set to Bridged mode so that this VM can communicate wth the outside world, for updates etc. 
   This can be changed prior to launching this vm in the network editor and assigned to one of the other
   host only network adaptors.
