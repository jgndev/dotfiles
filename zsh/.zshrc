# Path
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

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
alias k='kubectl'
alias vim='nvim'

eval "$(starship init zsh)"

# SSH Agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/jgn_rsa
ssh-add ~/.ssh/ansible_rsa

# Terminal
export TERM=xterm

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jgnovak/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

alias k='kubectl'

complete -o default -F __start_kubectl k
