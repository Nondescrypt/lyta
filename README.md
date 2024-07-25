# lyta

Lyta is a simple raytracer. 
The design will loosely follow "The Raytracer Challenge" by J. Buck, Pragmatic Press, 2019.

Lyta is provided under a BSD 3-clause license. See LICENSE file.

# Development
Lyta is not a registered Julia package -- yet!

```
> git clone https://github.com/Nondescrypt/lyta.git
> julia                 # smash ] to open the Julia pkg manager
pkg> activate ./lyta    
pkg> build
pkg> test
# backspace to return to the julia prompt
julia> import Lyta
julia> Lyta.greet()     # should output the greeting text
julia> cd("lyta")
```

See https://pkgdocs.julialang.org/v1/creating-packages/ for information about creating Julia packages.



