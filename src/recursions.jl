
"""
    downward_recursion(x, fn,  n)

Takes as an input value of Boys function (`fn`) for given `n` value
and returns value of Boys function for one lower value.

Fₙ(x) -> Fₙ₋₁(x) 
"""
function downward_recursion(x, fn,  n)
    upper = 2x * fn + exp(-x)
    lower = 2(n-1) + 1
    return upper / lower
end