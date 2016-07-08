source "$CODEROOT/zprezto/runcoms/zshrc"


# Patch to the libraries.
unset -f [ false echo kill printf pwd test true 2>/dev/null || true
zstyle ':completion:*' users

function prompt_sorin_pwd {
  _prompt_sorin_pwd="${PWD/#$HOME/~}"
}


# Load oh-my-zsh plugins.
OMZ_PLUGINS_DIR="$CODEROOT/oh-my-zsh/plugins"
fpath+=( "$OMZ_PLUGINS_DIR/zsh-navigation-tools" )
omg_plugins=(
  encode64
  sublime
  zsh-navigation-tools
)
for p in $omg_plugins; do
  source "$OMZ_PLUGINS_DIR/$p/$p.plugin.zsh"
done
unset p OMZ_PLUGINS_DIR


# MISC.
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias .......=../../../../../..
alias l='ls'
alias la='ls -a'
alias lla='ls -lA'
alias lld='ls -ld'
function grepnr() { grep -nr "$@" *; }

bindkey '^[[1;9C' forward-word   # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;9D' backward-word  # [Ctrl-LeftArrow] - move backward one word
bindkey '^[[F' end-of-line        # [Cmd-RightArrow] - Go to end of line
bindkey '^[[H' beginning-of-line  # [Cmd-LeftArrow] - Go to beginning of line


# Load user scripts.
for f in $HOME/.*.env/profile.d/*.sh(N); do
  source $f
done
unset f

if [[ -r "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
