module {"name": "aoc"};

def slurp: split("\n") | map(select(. != ""));

def slurpnums: slurp | map(tonumber);
