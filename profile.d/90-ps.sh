ps() {
  unset -f ps
  nullit command ps -H && export PSH=-H     || export PSH=
  ps $PSH "$@"
  alias ps="ps $PSH"
}

pstree() {
  unset -f pstree
	nullit command pstree -u && export PSTREEU=-u || export PSTREEU=
	nullit command pstree -h && export PSTREEH=-h || export PSTREEU=
  pstree $PSTREEU $PSTREEH "$@"
  alias pstree="pstree $PSTREEU $PSTREEH"
}

pse()       { ps -e            "$@"; }
psef()      { ps -ef           "$@"; }
psme()      { ps -u "$WHOAMI"  "$@"; }
psmef()     { psme -f          "$@"; }
pstreea()   { pstree -a        "$@"; }
pstreeme()  { pstree "$WHOAMI" "$@"; }
pstreemea() { pstreeme -a      "$@"; }
