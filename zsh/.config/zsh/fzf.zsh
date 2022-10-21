# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.local/bin/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.local/bin/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.local/bin/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.local/bin/fzf/shell/key-bindings.zsh"
