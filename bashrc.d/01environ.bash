##############################################################################
#
#                ENVIRONMENT VARIABLES
#
###############################################################################
###############################################################################
#
# Astro
#
###############################################################################

export VMD="/Volumes/MacOSX-Data"
export ASTRO="$VMD/Astro"
export ASTROSW="$ASTRO/sw"
export ASTROPY="$ASTROSW/AstroPy"
export ASTROX="$ASTRO/X-Ray"
export AWD="$ASTROX/WorkingDir"
export HEADAS="$ASTROSW/heasoft-6.17/x86_64-apple-darwin13.4.0"
export SASDIR="$ASTROSW/SAS/xmmsas_20131209_1901"

#export SAS_ODF="/home/vgg/Astro/X-Ray/ODF"
# After odfingest has been run SAS_ODF needs to be set to the 
# /full/path/to/ODF/file*SUM.SAS file that has been created.  

export SAS_ODF="$AWD/CU_Vir/2125_0677980501_SCX00000SUM.SAS"  

export SAS_CCF="$AWD/ccf.cif"
export SAS_CCFPATH="$ASTROSW/CCF"
export SAS_VERBOSITY=3
export SAS_SUPPRESS_WARNING=3
export SAS_IMAGEVIEWER="$ASTROX/ds9/ds9"

###############################################################################
#
# Comp
#
###############################################################################

export COMP="$VMD/Computing"
export COMPD="$COMP/Development"
export COMPB="$COMPD/BASH"
export COMPC="$COMPD/C++"
export COMPL="$COMPD/LinuxProgramming"
export COMPP="$COMPD/Perl"
export COMPY="$COMPD/Python"
export PalmOS="$COMPD/PalmOS"
export ECLIPSE_HOME="/Applications/eclipse"
export webOS="$COMPD/WebOS"

export WEBOS_TOOLS=$COMP/Palm/webos/Homebrew/Tools

###############################################################################
#
# General
#
###############################################################################

export EDITOR=vim
export PATH="/Volumes/MacOSX-Data/Computing/anaconda/bin:$PATH"
export PATH="$PATH:/Users/vgg/bin/"
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export PATH=$PATH:/opt/PalmSDK/Current/bin:/opt/PalmPDK/bin/
export PATH=$PATH:$ASTRO:$ASTROX:$ASTROX/DS9
export PATH=$PATH:/Applications/calibre.app/Contents/MacOS/
export PYTHONPATH=$PYTHONPATH:$ASTROPY/astrolib/astrolib_installed/lib/python
export VLC_PLUGIN_PATH=/Applications/VLC.app/Contents/MacOS/plugins
###############################################################################
#
# History control
#
###############################################################################

export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTIGNORE="ls:exit:df:w:h:ll:apollo:top"

###############################################################################
#
# Colours
#
###############################################################################

export CLICOLOR=true
export LSCOLORS='cxfxcxdxbxegedabagacad'

###############################################################################
#
# SSH / ftp / rdesktop
#
###############################################################################

export GPUServer="128.243.70.77"

###############################################################################
