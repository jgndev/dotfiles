# Path
export PATH=$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH:$HOME/.config/emacs/bin

# History
setopt appendhistory
setopt sharehistory
setopt EXTENDED_HISTORY

HISTFILE=~/.zsh_history
SAVEHIST=50000
HISTSIZE=50000

# Access to entire history
alias history="history 0"

# Preferred editor
export EDITOR='nvim'

# Colors
unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

# Go related
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Stop zsh from printing a % at the end of the line
export PROMPT_EOL_MARK=''

# The next line enables shell command completion for gcloud.
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# C++ dependencies
export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib

# Aliases
alias vim='nvim'

eval "$(starship init zsh)"

# Terminal
export TERM=xterm

# opencode
export PATH=/Users/jgnovak/.opencode/bin:$PATH

# iex shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# Mise
export PATH=$PATH:$HOME/.local/bin
eval "$(~/.local/bin/mise activate zsh)"
