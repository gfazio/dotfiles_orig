# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vgg/.fzf/bin* ]]; then
  export PATH="$PATH:/home/vgg/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vgg/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/vgg/.fzf/shell/key-bindings.zsh"

