test -z "$PROFILEREAD" && . /etc/profile || true

OS="$(uname -s)"

if test "$OS" = "Darwin"; then

    # MacPorts Installer addition on 2013-02-03_at_11:01:50: adding an appropriate 
    # PATH variable for use with MacPorts.
    #export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    # Finished adapting your PATH environment variable for use with MacPorts.


    test -r /sw/bin/init.sh && . /sw/bin/init.sh
    export TERM=xterm-color

    # Setting PATH for Python 2.7
    # The orginal version is saved in .profile.pysave
    #PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    #export PATH

    # Setting PATH for MacPython 2.6
    # The orginal version is saved in .profile.pysave
    #PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
    #export PATH

    # Setting PATH for Python 3.4
    # The orginal version is saved in .profile.pysave
    #PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
    #export PATH

    # Setting PATH for Python 3.3
    # The orginal version is saved in .profile.pysave
    #PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
    #export PATH

    # Setting PATH for Python 2.7
    # The orginal version is saved in .profile.pysave
    #PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    #export PATH

    # added by Anaconda3 2.4.0 installer
    export PATH="/Volumes/MacOSX-Data/Computing/anaconda/bin:$PATH"

else if test "$OS" = "Linux"; then

    export PATH="/home/vgg/anaconda2/bin:$PATH"

fi

source ~/.bashrc
