#!/bin/bash -
#===============================================================================
#
#          FILE: colorise.sh
#
#         USAGE: ./colorise.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Vito G. Graffagnino (), v.graffagnino@btinternet.com
#  ORGANIZATION: 
#       CREATED: 30/03/17 15:22:07
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
COOL=70
WARM=90

if [[ $1 -lt $COOL ]]
    then echo "\${color2}"$1   # COOL
elif [[ $1 -gt $WARM ]]
    then echo "\${color9}"$1   # HOT
else echo "\${color4}"$1   # WARM
fi
exit 0

