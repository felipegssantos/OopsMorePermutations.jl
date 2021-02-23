@testset "Group properties" begin

    σ1 = Permutation([1, 2, 3])
    σ2 = Permutation([2, 3, 1])
    σ3 = Permutation([3, 1, 2])
    τ1 = Permutation([1, 3, 2])
    τ2 = Permutation([3, 2, 1])
    τ3 = Permutation([2, 1, 3])
    cycles = [σ1, σ2, σ3]
    transpositions = [τ1, τ2, τ3]
    
    @testset "Existence of identity" begin
        for π = [cycles..., transpositions...]
            @test σ1 * π == π * σ1 == π
        end
    end

    @testset "Existence of the inverse" begin
        @test σ2 * σ3 == σ3 * σ2 == σ1
        for τ = transpositions
            @test τ * τ == σ1
        end
    end

    @testset "Closeness under multiplication" begin
        @test σ2 * σ2 == σ3
        @test σ3 * σ3 == σ2
        @test τ1 * τ2 == τ2 * τ3 == τ3 * τ1 == σ2
        @test τ3 * τ2 == τ2 * τ1 == τ1 * τ3 == σ3
    end
    
    @testset "Associativity" begin
        p_group = [cycles..., transpositions...]
        for π1 = p_group, π2 = p_group, π3 = p_group
            @test (π1 * π2) * π3 == π1 * (π2 * π3)
        end
    end 

end
