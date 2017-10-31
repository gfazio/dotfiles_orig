# Setup fzf
# ---------
if [[ ! "$PATH" == */home/shared/dotfiles/fzf/bin* ]]; then
  export PATH="$PATH:/home/shared/dotfiles/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/shared/dotfiles/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/shared/dotfiles/fzf/shell/key-bindings.zsh"

