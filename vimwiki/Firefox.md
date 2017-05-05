# Privacy Security Settings #

A lot of these settings can be found in the excellent ArchWiki 
article at [[https://wiki.archlinux.org/index.php/Firefox/Privacy#Configuration_tweaks|Firefox Privacy settings link]]


## Change user agent and platform ##

To change the user agent in firefox, add the following  string key in *about:config:*

_general.useragent.override_

The value for the key is your browser's user agent. Select a known common one.

*Tip:* _The value Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0_ is used as the user agent for the Tor browser, thus being very common.

_*Warning: Changing the user agent without changing to a corresponding platform will make your browser nearly unique.*_

To change the platform for firefox, add the following string key in *about:config:*

_general.platform.override_

Select a known common platform that corresponds with your user agent.

*Tip:* _The value Win32 is used as the platform for the Tor browser, corresponding with the user agent provided above._


