module PermutationGroup

using LinearAlgebra: I

# TODO: random transposition; once we have this, monte carlo over
# permutations is easy to implement

export Permutation

@doc """
If p is a Permutation instance and v is some vector,
then v[p.value] or permute(v, p) returns the permuted vector whereas
permute!(v, p.value) or permute!(v, p) permutes the
vector in-place.
"""
struct Permutation{T<:Integer}
    value::Vector{T}

    function Permutation{T}(value::Vector{T}) where {T<:Integer}
        if sort(value) == 1:length(value)
            return new(value)
        else
            error("Permutation's value must be a permutation of 1,2,...,N")
        end
    end
end

Permutation(value::Array{T}) where {T<:Integer} = Permutation{T}(value);

permute!(v::Vector, p::Permutation{T}) where {T<:Integer} = permute!(v, p.value)

permute(v::Vector, p::Permutation{T}) where {T<:Integer} = v[p.value]

@doc """
Returns the permutation p1∘p2 obtaining by first applying p2
and then p1.
"""
function Base.:*(p1::Permutation{T}, p2::Permutation{T}) where T <: Integer
    return Permutation(p1.value[p2.value])  # TODO: verify!
end

Base.length(p::Permutation{T}) where {T<:Integer} = length(p.value)

function to_matrix(p::Permutation{T} where T <: Integer)
    N = length(p)
    return [Int8(j == p.value[i]) for i=1:N, j=1:N]
end

function from_matrix(m::Array{T,2} where T <: Real)
    if (all(x in [0,1] for x in m) && all(s == 1 for s in sum(m, dims=1))
                                   && all(s == 1 for s in sum(m, dims=2)))
        p::Vector{Int} = m * Vector(1:size(m)[1])
        return Permutation(p)  # TODO: verify!
    else
        error("Not a permutation matrix")
    end
end

end