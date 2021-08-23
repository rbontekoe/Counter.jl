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
end

function add_to_file(file::String, data::Array{T, 1} where T <: Item)
    io = open(file, "a+")

    [serialize(io, r) for r in data]

    close(io)
end

function create_new_invoice_nbr(file::String)
    result = read_from_file(file)
    last_item = last(result)
    invoice_nbr = last_item.nbr
    invoice_nbr += 1
    name = haskey(ENV, "HOSTNAME") ? split(ENV["HOSTNAME"], "-")[1] * split(ENV["HOSTNAME"], "-")[3] : "A"
    item = create(name, invoice_nbr)
    add_to_file(file, [item])
    return item
end

end