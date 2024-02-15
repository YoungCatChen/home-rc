if command ls --group-directories-first / &> /dev/null
  functions --copy ls __fish_ls
  alias ls '__fish_ls --group-directories-first'
end

abbr -a    l 'ls'
abbr -a   la 'ls -A'
abbr -a  lsd 'ls -d'
abbr -a   ll 'ls -l'
abbr -a  lla 'ls -lA'
abbr -a  lld 'ls -ld'
abbr -a  llh 'ls -lh'
abbr -a llhd 'ls -lhd'
abbr -a  dir 'ls'

abbr -a   l. 'ls -d .*'
abbr -a  ll. 'll -d .*'
