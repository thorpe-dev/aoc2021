[
    .[0:-2], .[1:-1], .[2:]  # Triple of arrays
]
| transpose # Array of triples
| map(add)  # Array of sums
| [.[:-1], .[1:]] # solution to part 1
| transpose
| map(select(.[1] > .[0]))
| length
