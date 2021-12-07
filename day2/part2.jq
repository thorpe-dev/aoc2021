split("\n")
| map(select(. != ""))
| map(
    capture("forward (?<fwd>\\d+)|down (?<dwn>\\d+)|up (?<up>\\d+)")
    | with_entries(select(.value) | .value |= tonumber)
)
| map(to_entries)
| flatten
| reduce .[] as {$key, $value} (
    {aim: 0, depth: 0, hor: 0};
    if $key == "dwn" then
        {depth: .depth, hor: .hor, aim: (.aim + $value)}
    elif $key == "up" then
        {depth: .depth, hor: .hor, aim: (.aim - $value)}
    else # forward
        {depth: (.depth + .aim * $value), hor: (.hor + $value), aim: .aim}
    end
)
| .hor * .depth
