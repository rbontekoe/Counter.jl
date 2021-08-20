using Pkg

Pkg.activate(".") # make the current folder the working environmen

import Counter: Domain, API # import the sub-modules Domain and API

using .Domain, .API # load the sub-modules Domain and API

item = create("ar", 1000) # create an item

println(item)