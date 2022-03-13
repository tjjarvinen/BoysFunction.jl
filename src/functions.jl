
"""
    boys_quadgk(x, n::Int; rtol=1e-12)

Calculates Boys function with Gaussian Quadrature using QuadGK.jl.
Accuracy can be tuned with `rtol` argument.
This is accurate, but slow.
"""
function boys_quadgk(x, n::Int; rtol=1e-12)
    tmp = quadgk( 0, 1; rtol=rtol) do t
        t^(2n) * exp( -x*t^2 )
    end
    return tmp[1]
end

"""
    boys_gamma(x, n::Int)

Evaluate Boys function with gamma function.
This is accurate.
"""
function boys_gamma(x, n::Int)
    upper = gamma( n + 1//2 ) - gamma( n + 1//2, x )
    lower = 2x^( n + 1//2 )
    return upper / lower
end


"""
    boys_rec_largex(x, n::Int)

For large `x` > 30. Calculate using recursion.
Uses approximations.
This is fast, but loses accuracy on high `n` values.

Based on:
A. K. H. Weiss, C. Ochsenfeld J. Comput.
Chem. 2015, 36, 1390–1398. DOI: 10.1002/jcc.23935
"""
function boys_rec_largex(x, n::Int)
    if n == 0
        return √π / (2√x)
    else
        return ( n - 1//2 ) * boys_rec_largex(x, n-1) / x
    end
end