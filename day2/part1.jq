import "../lib/helpers" as Helpers;

Helpers::slurp
| map(
    capture("forward (?<fwd>\\d+)|down (?<dwn>\\d+)|up (?<up>\\d+)")
    | with_entries(select(.value) | .value |= tonumber)
)
| map(to_entries)
| flatten
| group_by(.key)
| map(reduce .[] as $obj ({}; .[$obj.key] += $obj.value))
| add
| .fwd * (.dwn - .up)
