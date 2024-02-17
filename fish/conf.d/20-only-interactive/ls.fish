if command ls --group-directories-first / &> /dev/null
  functions --copy ls __fish_ls
  alias ls '__fish_ls --group-directories-first'
end

# fish 方面，所有 abbr / alias 改成 function 放到 functions dir
# bash 方面，取消 bin 的 alias，改 watch alias 加空格。

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
