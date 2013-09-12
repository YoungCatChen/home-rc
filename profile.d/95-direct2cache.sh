add_direct2cache()
{
  [ ! -e "$1" ] && echo "$2" > "$1"
}

batch_add_direct2cache()
{
  for b_a_d2c_F in "$HOME"/.*env/"$1"; do
    [ ! -d "$b_a_d2c_F" ] && continue
    add_direct2cache "$b_a_d2c_F/10-direct2cache-head.$2"     '### direct2cache head START ###'
    add_direct2cache "$b_a_d2c_F/29-direct2cache-head-end.$2" '#### direct2cache head END ####'
    add_direct2cache "$b_a_d2c_F/70-direct2cache-tail.$2"     '### direct2cache tail START ###'
    add_direct2cache "$b_a_d2c_F/89-direct2cache-tail-end.$2" '#### direct2cache tail END ####'
  done

  unset b_a_d2c_F
}

batch_add_direct2cache profile.d sh
batch_add_direct2cache bashrc.d bash

unset -f add_direct2cache batch_add_direct2cache
