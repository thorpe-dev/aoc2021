.[0:-2] as $fst
| .[1:-1] as $snd
| .[2:] as $thd
| [$fst, $snd, $thd]
| transpose
| map(add) as $arr
| $arr
| [to_entries[] | select(.key != 0 and $arr[.key - 1] < .value)]
| length
