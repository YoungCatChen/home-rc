# Adds aliases like head20, head100, tail50 etc.
# To keep functionality similar with `head-tail.fish`.

for num in 20 30 40 50 100 1000 10000; do
  alias head$num="head -n $num"
  alias tail$num="tail -n $num"
done
unset num
