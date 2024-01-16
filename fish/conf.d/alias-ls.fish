if not status is-interactive; return; end

if command ls --group-directories-first / &> /dev/null
  functions --copy ls __fish_ls
  alias ls='__fish_ls --group-directories-first'
end

alias    l='ls'
alias   la='ls -A'
alias  lsd='ls -d'
alias   ll='ls -l'
alias  lla='ls -lA'
alias  lld='ls -ld'
alias  llh='ls -lh'
alias llhd='ls -lhd'
alias  dir='ls'

alias   l.='ls -d .*'
alias  ll.='ll -d .*'
