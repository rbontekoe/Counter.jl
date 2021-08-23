using Counter
using Test

import Counter: Domain, API, Infrastructure
using .Domain, .API, .Infrastructure

@testset "Domain.jl" begin
    item_name = "ar"
    item_nbr = 1000
    item = Item(item_name, item_nbr)
    @test item.name == "ar"
    @test item.nbr == 1000
end

@testset "API.jl" begin
    ar = create("ar", 1000)
    @test ar.name == "ar"
    @test ar.nbr == 1000
end

FILE_COUNTER = "./test_counter.txt"

@testset "Infrastructure.jl" begin
    ar = create("ar", 1000)
    add_to_file(FILE_COUNTER, [ar])
    result = read_from_file(FILE_COUNTER)
    last_item = last(result)
    @test last_item.name == "ar"
    @test last_item.nbr == 1000
    cmd = `rm $FILE_COUNTER`
    run(cmd)
end

@testset "create_new_invoice_nbr" begin
    invoice_nbr = create_new_invoice_nbr(FILE_COUNTER)
    @test invoice_nbr == 1001
    cmd = `rm $FILE_COUNTER`
    run(cmd)
end
