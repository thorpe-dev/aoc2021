. as $arr
| [
    to_entries[]
    | select(.key != 0 and $arr[.key - 1] < .value)
] | length
