module PermutationGroup

@doc """
If p is a Permutation instance and v is some vector,
then v[p.value] or permute(v, p) returns the permuted vector whereas
permute!(v, p.value) or permute!(v, p) permutes the
vector in-place.
"""
struct Permutation{T <: Integer}
    value::Array{T}
    function Permutation(value::Array{T})
        # TODO: validate `value` is a permutation
        new(value)
    end
end

permute!(v::Vector, p::Permutation{T}) = permute!(v, p.value)

permute(v::Vector, p::Permutation{T}) = v[p.value]

@doc """
Returns the permutation p1∘p2 obtaining by first applying p2
and then p1.
"""
function *(p1::Parmutation{T}, p2::Permutation{T}) where T <: Integer
end

function to_matrix(p::Permutation{T} where T <: Integer)
end

function from_matrix(m::Array{T,2} where T <: Real)
end

end