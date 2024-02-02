# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.local/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$HOME/.local/fzf/bin"
fi

# Auto-completion
# ---------------
source "$HOME/.local/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "$HOME/.local/fzf/shell/key-bindings.zsh"


#export FZF_DEFAULT_COMMAND='fdfind --type f --hidden'
#export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
export FZF_CTRL_T_OPTS='--height 50% --layout=reverse --border'
export FZF_CTRL_R_OPTS='--height 50% --layout=reverse --border'
export FZF_ALT_C_OPTS="--height 50% --layout=reverse --border --preview 'tree -C {} | head -50'"

# Where should I put you?
bindkey -s ^f "fzf\n"

