using Counter
using Test

using Counter
using Test

import Counter: Domain
using .Domain

@testset "Domain.jl" begin
    item_name = "ar"
    item_nbr = 1000
    item = Item(item_name, item_nbr)
    @test item.name == "ar"
    @test item.nbr == 1000
end
