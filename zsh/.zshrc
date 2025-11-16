# Path
export PATH=$HOME/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH

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
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/jgn_rsa
# ssh-add ~/.ssh/ansible_rsa

# Terminal
export TERM=xterm

# Aliases
alias k='kubectl'
complete -o default -F __start_kubectl k

# opencode
export PATH=/Users/jgnovak/.opencode/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"

# iex shell history
export ERL_AFLAGS="-kernel shell_history enabled"


# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

alias code="/Applications/Visual\ \Studio\ \Code.app/Contents/Resources/app/bin/code"

# Ruby
eval "$(rbenv init -)"

# Mise
export PATH=$PATH:$HOME/.local/bin
#echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
eval "$(~/.local/bin/mise activate zsh)"
