[.[:-1], .[1:]] # Create pair of arrays with a slice
| transpose  # Turn pair of arrays into array of pairs
| map(select(.[1] > .[0])) # select where item 1 (next elem) is greater than item 0 (cur elem)
| length # length of array
