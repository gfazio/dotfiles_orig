# Path to your oh-my-zsh installation.
export ZSH="/home/vgg/.oh-my-zsh"


#Path to aliases and environment variables used in bash
export BASH_DIR="/home/vgg/.bashrc.d"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
#ZSH_THEME="nanotech"
#ZSH_THEME="Honukai"
#ZSH_THEME="kardan"
#ZSH_THEME="wezm"
#ZSH_THEME="terminalparty"
#ZSH_THEME="bureau"
#ZSH_THEME="sunrise"

# 
# Alternative prompts can be had using prompt:
#
#
# # list
# prompt -l
#
# #preview
# prompt -p
#
#
#
# autoload -U promptinit && promptinit
# prompt fade 'red'
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python sudo common-aliases z)

# User configuration

#  export PATH="/home/vgg/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

OS_VAR="$(uname -s)"
if [[ "${OS_VAR}" == "Darwin" ]] ; then
    source $BASH_DIR/01environ.bash.osx
    source $BASH_DIR/02aliases.bash.osx
    source $BASH_DIR/03functions.bash.osx 
    source $BASH_DIR/04options.bash.osx
elif [[ "${OS_VAR}" == "Linux" ]] ; then
    source $BASH_DIR/01environ.bash.linux
    source $BASH_DIR/02aliases.bash.linux
    source $BASH_DIR/03functions.bash.linux 
    source $BASH_DIR/04options.bash.linux 
fi

source $ZSH/oh-my-zsh.sh
#-------- Suffix Alias {{{
#------------------------------------------------------
# open file with default program base on extension
# Ex: 'alias -s avi=mplayer' makes 'file.avi' execute 'mplayer file.avi'

alias -s {avi,flv,mkv,mp4,mpeg,mpg,ogv,wmv}=$PLAYER
alias -s {flac,mp3,ogg,wav}=$MUSICER
alias -s {gif,GIF,jpeg,JPEG,jpg,JPG,png,PNG}="background $IMAGEVIEWER"
alias -s {djvu,pdf,ps}="background $READER"
alias -s txt=$EDITOR
alias -s epub="background $EBOOKER"
alias -s {cbr,cbz}="background $COMICER"
# might conflict with emacs org mode
alias -s {at,ch,com,de,net,org}="background $BROWSER"

# archive extractor
alias -s ace="unace l"
alias -s rar="unrar l"
alias -s {tar,bz2,gz,xz}="tar tvf"	#tar.bz2,tar.gz,tar.xz
alias -s zip="unzip -l"

#}}}
source /home/vgg/dotfiles/z/z.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="vim ~/.zshrc"
 alias ohmyzsh="vim ~/.oh-my-zsh"

#-------- ZMV {{{
#------------------------------------------------------
# http://onethingwell.org/post/24608988305/zmv
autoload zmv

# }}}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#-------- Fuzzy Finder {{{
#------------------------------------------------------
#

# function bind to a hotkey
fzf_history() { zle -I; eval $(history | fzf +s | sed 's/ *[0-9]* *//') ; }; zle -N fzf_history; bindkey '^F' fzf_history

fzf_killps() { zle -I; ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} ; }; zle -N fzf_killps; bindkey '^Q' fzf_killps

fzf_cd() { zle -I; DIR=$(find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf) && cd "$DIR" ; }; zle -N fzf_cd; bindkey '^E' fzf_cd
# }}}
#-------- Autocomplete Custom {{{
#------------------------------------------------------
# autocomplete surfraw bookmarks
# usage: srb <bookmark_name>
_cmpl_surfraw() {
	reply=($(awk 'NF != 0 && !/^#/ {print $1}' ~/.config/surfraw/bookmarks | sort -n))
}
compctl -K _cmpl_surfraw srb


# cheat
_cmpl_cheat() {
	reply=($(cheat -l | cut -d' ' -f1))
}
compctl -K _cmpl_cheat cheat


# fzf_surfraw() { zle -I; surfraw $(cat ~/.config/surfraw/bookmarks | fzf | awk 'NF != 0 && !/^#/ {print $1}' ) ; }; zle -N fzf_surfraw; bindkey '^W' fzf_surfraw


# }}}
