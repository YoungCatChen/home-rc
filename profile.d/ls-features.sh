ls() {
  unset -f ls

  nullit command ls -F           / && export LSF='-F'           || export LSF=
  nullit command ls --color=auto / && export LSC='--color=auto' || export LSC=
  nullit command ls --hide=bin   / && export LSH='--hide=*{*}*' || export LSH=

  ls $LSF $LSC $LSH "$@"
  alias ls="ls $LSF $LSC $LSH"
}
