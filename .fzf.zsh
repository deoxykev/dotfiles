# Setup fzf
# ---------
if [[ ! "$PATH" == */home/k/.fzf/bin* ]]; then
  export PATH="$PATH:/home/k/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/k/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/k/.fzf/shell/key-bindings.zsh"

