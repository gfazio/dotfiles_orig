## How To Change Default Application From The Command Line ##

xdg-open basically just looks to see which desktop environment you have and then runs gnome-open, gvfs-open, xfce-open, to open the default application for a particular
filetype. However, xdg-open works perfectly without desktop environment and therefore can be used with the i3 window manager. 

#### Example: Set Transmission as default application to open magnet file. ####


* Find out the MIME type string. For file MIME types, you can find it out with file command:

       ` $ file -i Broken_Blossoms.webm `

  This provides the output as: 
  
  `Broken_Blossoms.webm: video/webm; charset=binary`

    For the above file, MIME type is **video/webm**.

    For URI handlers, the type is x-scheme-handler/<scheme>, where <scheme> is the part of URI before colon, e.g. "http", "mailto" "irc" or "magnet". Following are examples of valid MIME types:

    `x-scheme-handler/http`
    `x-scheme-handler/irc`
    `x-scheme-handler/magnet`
    `x-scheme-handler/mailto`

* Find out the name of the application .desktop file.

    Installed .desktop files live under **/usr/share/applications**. 

        `$ grep "Transmission" -l -r /usr/share/applications`
        `/usr/share/applications/transmission-gtk.desktop`
        `$`

    In case you have "strange" application that may not have the file at all, you can always create one. Easy way would be to copy an existing one, 
    rewrite fields you understand and remove those you don't. Refer to the specification for details.

* Make the assignment using **xdg-mime** command:

        `$ xdg-mime default transmission-gtk.desktop x-scheme-handler/magnet`

    Note that no matter where the file actually is (/usr/share/applications, ~/.local/share/applications...), you always use only the name, not the full path.

* Normally the command will not output anything. If you want to verify what you just did or see what is currently assigned to any MIME type without opening it:

        `$ xdg-mime query default x-scheme-handler/magnet`
        `transmission-gtk.desktop`
        `$`

##### Note 1: ##### 

If you want to check out other MIME types, you can look at /etc/mime.types. It does not contain all types in the world; for example the URI handlers,i
but it could be used for "aggressive" form of handling the associations. For example:

`grep ^video/ | cut -d\t -f1 | xargs xdg-mime default vlc.desktop`

would associate all known video formats to VLC.

