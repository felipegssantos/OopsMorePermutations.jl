using Test

using Permutations

@testset "Permutations.jl" begin
    include("type_basics.jl")
    include("group_properties.jl")
end
