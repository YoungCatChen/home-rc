# Attaches helpful flags to `pstree`, when supported.
# To keep functionality in sync with `pstree.fish`.

__setup_pstree() {
  unset -f pstree pstreeme pstreethis __setup_pstree

  helpdoc_contains() {
    string_contains "$helpdoc" " $1 "
  }

  helpdoc="`pstree --help 2>&1`"

  # hide threads, show only processes
  helpdoc_contains --hide-threads  && hide=--hide-threads
  # highlight current process and its ancestors
  helpdoc_contains --highlight-all && highlight=--highlight-all
  # show only current process and its ancestors
  helpdoc_contains '-p pid'        && thisproc='-p $$'
  # show uid transitions
  helpdoc_contains --uid-changes   && uid=--uid-changes

  # use graphics chars for tree drawing characters
  if helpdoc_contains '-g n'; then
    unicode=-g3
  elif helpdoc_contains --unicode; then
    unicode=--unicode
  fi

  # show only branches containing processes of <user>
  if helpdoc_contains '-u user'; then
    user="-u $USER"
  elif helpdoc_contains 'PID | USER'; then
    user="$USER"
  fi

  unset -f helpdoc_contains
  alias pstree="pstree $hide $highlight $uid $unicode"
  alias pstreeme="pstree $user"
  alias pstreethis="pstree $thisproc"
}

pstree() {
  local helpdoc hide highlight thisproc uid unicode user
  __setup_pstree
  pstree $hide $highlight $uid $unicode
}

pstreeme() {
  local helpdoc hide highlight thisproc uid unicode user
  __setup_pstree
  pstree $hide $highlight $uid $unicode $user
}

pstreethis() {
  local helpdoc hide highlight thisproc uid unicode user
  __setup_pstree
  eval pstree $hide $highlight $uid $unicode $thisproc
}
