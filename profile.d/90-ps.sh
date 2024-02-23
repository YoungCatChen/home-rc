pstree() {
  unset -f pstree
	nullit command pstree -u && export PSTREEU=-u || export PSTREEU=
	nullit command pstree -h && export PSTREEH=-h || export PSTREEU=
  pstree $PSTREEU $PSTREEH "$@"
  alias pstree="pstree $PSTREEU $PSTREEH"
}

pstreea()   { pstree -a        "$@"; }
pstreeme()  { pstree "$WHOAMI" "$@"; }
pstreemea() { pstreeme -a      "$@"; }
