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


# Display last command's run time if it's longer than 10sec.
_run_time_mark_start_time() {
  _run_time_start_timestamp="$( date +%s )"
}

_run_time_find_end_time() {
  [[ -n "$_run_time_start_timestamp" ]] || return

  local end_timestamp="$( date +%s )"
  local i
  (( i = $end_timestamp - $_run_time_start_timestamp ))

  if [[ $i -ge 10 ]]; then
    local sec min hrs
    (( sec=i%60, i/=60, min=i%60, hrs=i/60))
    local start_time="$( date -d @$_run_time_start_timestamp '+%m-%d %H:%M:%S')"
    local end_time="$( date -d @$end_timestamp '+%m-%d %H:%M:%S')"
    local duration="$( printf '%d:%02d:%02d' $hrs $min $sec )"
    print -P "%B%F{1}❮%F{3}❮%F{2}❮%f ELAPSED:%b $duration. %BSTART:%b $start_time. %BEND:%b $end_time. %B%F{2}❯%F{3}❯%F{1}❯%f%b"
  fi

  unset _run_time_start_timestamp
}

preexec_functions+=( '_run_time_mark_start_time' )
precmd_functions=( '_run_time_find_end_time' $precmd_functions )


# MISC.
alias -- -='cd -'
alias cd-='cd -'
alias cd..='cd ..'
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
for f in $HOME/.*.env/profile.d/*.sh(N) $HOME/.*.env/zshrc.d/*.zsh(N); do
  source $f
done
unset f

if [[ -r "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
