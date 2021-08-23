module Infrastructure

import ..Counter: Domain, API

using .Domain, .API

using Serialization

export add_to_file, read_from_file, create_new_invoice_nbr

function read_from_file(file::String)
    io = open(file, "r")

    r = []
    while !eof(io)
        push!(r, deserialize(io))
    end

    close(io)

    return r
end # read_from_file

function add_to_file(file::String, data::Array{T, 1} where T <: Any)
    io = open(file, "a+")

    [serialize(io, r) for r in data]

    close(io)
end # add_to_file

function create_new_invoice_nbr(file::String)
    value = 1000
    try
        value = last(read_from_file(file))
    catch e
        add_to_file(file, [value])
    end

    invoice_nbr = value += 1
    add_to_file(file, [invoice_nbr])
    return invoice_nbr
end # create_new_invoice_nbr

end # module