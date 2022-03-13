module BoysFunction

using QuadGK
using SpecialFunctions

include("functions.jl")
include("recursions.jl")


export boys_gamma,
        boys_quadgk,
        boys_rec_largex,
        downward_recursion

# Write your package code here.

end
