source "$CODEROOT/zprezto/runcoms/zshrc"

########## Patch: zprezto/modules/prompt/functions/prompt_sorin_setup ##########
function prompt_sorin_precmd() {
  _prompt_sorin_pwd='%~'
}

################### Patch: zprezto/modules/terminal/init.zsh ###################
# Sets the terminal or terminal multiplexer window title.
function set-window-title {
    # <- patch
}

# Sets the terminal tab title.
function set-tab-title {
  local title_format{,ted}
  zstyle -s ':prezto:module:terminal:tab-title' format 'title_format' || title_format="%s"
  zformat -f title_formatted "$title_format" "s:$argv"
  printf "\e]0;%s\a" ${(V%)title_formatted}  # <- patch
}

# Sets the tab and window titles with a given path.
function _terminal-set-titles-with-path {
  emulate -L zsh
  setopt EXTENDED_GLOB

  local absolute_path="${${1:a}:-$PWD}"
  local abbreviated_path="${absolute_path/#$HOME/~}"
  local truncated_path="${abbreviated_path/(#m)?(#c15,)/...${MATCH[-12,-1]}}"
  local -a arr  # <- patch
  arr=("$abbreviated_path" "$truncated_path")
  unset MATCH absolute_path abbreviated_path truncated_path

  if [[ "$TERM" == screen* ]]; then
    set-multiplexer-title "${arr[2]}"
  fi
  set-tab-title "${arr[2]}"
  set-window-title "${arr[1]}"
}

if zstyle -t ':prezto:module:terminal' auto-title; then
  # Sets the tab and window titles before the prompt is displayed.
  add-zsh-hook precmd _terminal-set-titles-with-path
  # Sets the tab and window titles before command execution.
  add-zsh-hook preexec _terminal-set-titles-with-command
fi



################################# Our settings #################################

# Disable some slow operations.
unset -f [ false echo kill printf pwd test true 2>/dev/null || true
zstyle ':completion:*' users

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
unset p omg_plugins OMZ_PLUGINS_DIR


# Display last command's run time if it's longer than 10sec.
_run_time_mark_start_time() {
  _run_time_start_timestamp="$( date +%s )"
}

_run_time_find_end_time() {
  [[ -n "$_run_time_start_timestamp" ]] || return

  local end_timestamp="$( date +%s )"
  local i
  (( i = $end_timestamp - $_run_time_start_timestamp ))

  if (( $i >= 10 )); then
    local sec min hrs
    (( sec=i%60, i/=60, min=i%60, hrs=i/60))
    local start_time="$( date -d @$_run_time_start_timestamp '+%m-%d %H:%M:%S')"
    local end_time="$( date -d @$end_timestamp '+%m-%d %H:%M:%S')"
    local duration="$( printf '%d:%02d:%02d' $hrs $min $sec )"
    print -P "%B%F{1}❮%F{3}❮%F{2}❮%f ELAPSED:%b $duration. %BSTART:%b $start_time. %BEND:%b $end_time. %B%F{2}❯%F{3}❯%F{1}❯%f%b"
  fi

  unset _run_time_start_timestamp
}

add-zsh-hook preexec _run_time_mark_start_time
add-zsh-hook precmd  _run_time_find_end_time


# MISC.
function grepnr() { grep -nr "$@" *; }

bindkey '^[[1;9C' forward-word   # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;9D' backward-word  # [Ctrl-LeftArrow] - move backward one word
bindkey '^[[F' end-of-line        # [Cmd-RightArrow] - Go to end of line
bindkey '^[[H' beginning-of-line  # [Cmd-LeftArrow] - Go to beginning of line


# Load user scripts.
for f in \
    $CODEROOT/zprofile.d/*.zsh(N) \
    $HOME/.*.env/profile.d/*.sh(N) \
    $CODEROOT/zshrc.d/*.zsh(N) \
    $HOME/.*.env/zshrc.d/*.zsh(N) \
    "$HOME/.zprofile.local"(N) \
    "$HOME/.zshrc.local"(N); do
  source $f
done
unset f
