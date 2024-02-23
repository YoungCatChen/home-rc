# Adds aliases like head20, head100, tail50 etc.
# To keep functionality similar with `head-tail.fish`.

local n
for n in 20 30 40 50 100 1000 10000; do
  alias head$n="head -n $n"
  alias tail$n="tail -n $n"
done
