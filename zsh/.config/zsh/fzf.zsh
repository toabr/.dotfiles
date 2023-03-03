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


#export FZF_DEFAULT_COMMAND='fdfind --type f --hidden'
#export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
export FZF_CTRL_T_OPTS='--height 50% --layout=reverse --border'
export FZF_CTRL_R_OPTS='--height 50% --layout=reverse --border'
export FZF_ALT_C_OPTS="--height 50% --layout=reverse --border --preview 'tree -C {} | head -50'"

# Where should I put you?
bindkey -s ^f "fzf\n"

