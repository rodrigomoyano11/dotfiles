# General
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export PS1="%1d> "

# Plugins
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-shift-select
)

source $ZSH/oh-my-zsh.sh

# History management
if id vscode >/dev/null 2>&1; then
  export HISTFILE=/dc/shellhistory/.zsh_history
  export PROMPT_COMMAND='history -a'
  sudo chown -R vscode /dc/shellhistory
fi

# Options
HIST_STAMPS="dd/mm/yyyy"
DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

# Key bindings
bindkey "^Z" undo

# Aliases
eval $(ssh-agent -s)
