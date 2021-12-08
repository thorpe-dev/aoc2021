import "../lib/helpers" as Helpers;

Helpers::slurpnums
| [.[:-1], .[1:]] # Create pair of arrays with a slice
| transpose  # Turn pair of arrays into array of pairs
| map(select(.[0] < .[1])) # select where item 1 (next elem) is greater than item 0 (cur elem)
| length # length of array
