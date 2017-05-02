# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vgg/dotfiles/fzf/bin* ]]; then
  export PATH="$PATH:/home/vgg/dotfiles/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vgg/dotfiles/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/vgg/dotfiles/fzf/shell/key-bindings.bash"

