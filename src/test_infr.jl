using Pkg

Pkg.activate(".") # activate the Counter environment from Julia

import Counter: Domain, API, Infrastructure

using .Domain, .API, .Infrastructure

const FILE_COUNTER = "./test_counter.txt" # Julia gives a warning when the value is changed

item = create("ar", 1000)

add_to_file(FILE_COUNTER, [item])

result = read_from_file(FILE_COUNTER)

println(result)