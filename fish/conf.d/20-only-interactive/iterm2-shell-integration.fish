# iTerm2's shell integration will be enabled if
# `~/.iterm2_shell_integration.fish` is available via
# `curl -L https://iterm2.com/shell_integration/fish -o ~/.iterm2_shell_integration.fish` .

[ -r $HOME/.iterm2_shell_integration.fish ] && \
    source $HOME/.iterm2_shell_integration.fish
