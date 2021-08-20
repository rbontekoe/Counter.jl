module API

import ..Counter: Domain

using .Domain

export create

"""
    create(name::String, nbr::Int64)::Item

Create an item object.

# Example
```julia
julia> using counter

julia> ar = create("ar", 1000);

julia> ar.created
2020-09-28T10:56:29.997

julia> ar.name
"ar"

julia> ar.nbr
1000
```
"""
function create end

create(name::String, nbr::Int64)::Item = Item(name, nbr)

end