# Adds cd-related aliases like `cd-`, `cd..`, `cd....`
# as well as `-` and `...` without spelling out "cd".
# To be in sync with `cd.fish`.

alias        cd-='cd -'
alias        cd.='cd .'
alias       cd..='cd ..'
alias      cd...='cd ../..'
alias     cd....='cd ../../..'
alias    cd.....='cd ../../../..'
alias   cd......='cd ../../../../..'
alias  cd.......='cd ../../../../../..'
alias cd........='cd ../../../../../../..'

alias        -='cd -'
alias       ..='cd ..'
alias      ...='cd ../..'
alias     ....='cd ../../..'
alias    .....='cd ../../../..'
alias   ......='cd ../../../../..'
alias  .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
