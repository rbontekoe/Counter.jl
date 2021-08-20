using Pkg; Pkg.activate(".")

import Counter: Domain

using .Domain

item_name = "ar"

item_nbr = 1000

item = Item(item_name, item_nbr)

@info item.name * " has been created on " * string(item.created) * " with the value " * string(item.nbr)